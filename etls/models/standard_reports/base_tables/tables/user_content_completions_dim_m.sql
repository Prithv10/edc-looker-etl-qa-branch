-- user_content_completions_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  user_content_completions.user_id,
  user_content_completions.completable_id,
  TIMESTAMP(user_content_completions.completed_at) completed_at,
  user_content_completions.completed_percentage,
  user_content_completions.duration,
  TIMESTAMP(user_content_completions.updated_at) updated_at,
  user_content_completions.state,
  users.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(user_content_completions.record_insert_time)) AS record_insert_time,
  CAST(user_content_completions.yr AS STRING) yr,
  CAST(user_content_completions.month AS STRING) month,
  user_content_completions.day,
  CAST(user_content_completions.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('user_content_completions')}} user_content_completions
INNER JOIN
  {{ref('users_dim_m_v')}} users
ON
  users.id = user_content_completions.user_id
WHERE
  user_content_completions.completable_type='Card'
  AND organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and user_content_completions.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
