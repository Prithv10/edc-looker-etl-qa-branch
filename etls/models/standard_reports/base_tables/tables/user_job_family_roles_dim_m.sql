-- user_job_family_roles_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  ujfr.id,
  ujfr.job_family_role_id,
  ujfr.user_id,
  TIMESTAMP(ujfr.created_at) AS created_at,
  TIMESTAMP(ujfr.updated_at) AS updated_at,
  users.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(ujfr.record_insert_time)) AS record_insert_time,
  CAST(ujfr.yr AS STRING) yr,
  CAST(ujfr.month AS STRING) month,
  ujfr.day,
  CAST(ujfr.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('user_job_family_roles')}} ujfr
LEFT JOIN
  {{ref('users_dim_m_v')}} users
ON
  ujfr.user_id = users.id
WHERE
  users.organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and ujfr.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
