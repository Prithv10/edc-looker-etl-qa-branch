-- clcs_dim_m

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
  entity_id,
  entity_type,
  TIMESTAMP(from_date) AS from_date,
  TIMESTAMP(to_date) AS to_date,
  target_score,
  organization_id AS org_id_s,
  target_steps,
  TIMESTAMP(clcs.deleted_at) AS deleted_at,
  TIMESTAMP(clcs.created_at) AS created_at,
  TIMESTAMP(clcs.updated_at) AS updated_at,
  name,
  status,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(clcs.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('clcs')}} clcs
WHERE
  organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and clcs.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
