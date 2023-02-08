-- user_roles_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  ur.id,
  ur.user_id,
  ur.role_id,
  TIMESTAMP(ur.created_at) AS created_at,
  TIMESTAMP(ur.updated_at) AS updated_at,
  TIMESTAMP(ur.deleted_at) AS deleted_at,
  users.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(ur.record_insert_time)) AS record_insert_time,
  CAST(ur.yr AS STRING) yr,
  CAST(ur.month AS STRING) month,
  ur.day,
  CAST(ur.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('user_roles')}} ur
JOIN
  {{ref('users_dim_m_v')}} users
ON
  ur.user_id = users.id
WHERE
  users.organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and ur.day >= (SELECT max(day) FROM {{ this }})
{% endif %}

