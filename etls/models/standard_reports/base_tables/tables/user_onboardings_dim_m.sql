-- user_onboardings_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  user_onboardings.id,
  user_id,
  current_step,
  user_onboardings.status,
  TIMESTAMP(user_onboardings.completed_at) AS completed_at,
  TIMESTAMP(user_onboardings.created_at) AS created_at,
  TIMESTAMP(user_onboardings.updated_at) AS updated_at,
  users.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(user_onboardings.record_insert_time)) AS record_insert_time,
  CAST(user_onboardings.yr AS STRING) yr,
  CAST(user_onboardings.month AS STRING) month,
  user_onboardings.day,
  CAST(user_onboardings.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('user_onboardings')}} user_onboardings
INNER JOIN
    {{ref('users_dim_m_v')}} users
ON
  users.id = user_onboardings.user_id
WHERE
  users.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and user_onboardings.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
