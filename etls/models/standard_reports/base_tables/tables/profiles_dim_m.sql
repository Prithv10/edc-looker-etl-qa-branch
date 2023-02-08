-- profiles_dim_m


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  profiles.id,
  user_id,
  external_id,
  uid,
  TIMESTAMP(profiles.created_at) AS created_at,
  TIMESTAMP(profiles.updated_at) AS updated_at,
  users.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(profiles.record_insert_time)) AS record_insert_time,
  CAST(profiles.yr AS STRING) yr,
  CAST(profiles.month AS STRING) month,
  profiles.day,
  CAST(profiles.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
     {{get_master_db('profiles')}} profiles
INNER JOIN
         {{ref('users_dim_m_v')}} users
ON
  users.id = profiles.user_id
WHERE
  users.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and profiles.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
