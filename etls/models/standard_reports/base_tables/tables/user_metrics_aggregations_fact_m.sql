-- user_metrics_aggregations_fact_m


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}


SELECT
  id,
  organization_id AS org_id_s,
  user_id,
  total_user_score,
  time_spent_minutes,
  TIMESTAMP(user_metrics_aggregations.updated_at) AS updated_at,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(user_metrics_aggregations.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
     {{get_master_db('user_metrics_aggregations')}} user_metrics_aggregations
WHERE
  organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and user_metrics_aggregations.day >= (SELECT max(day) FROM {{ this }})
{% endif %}

