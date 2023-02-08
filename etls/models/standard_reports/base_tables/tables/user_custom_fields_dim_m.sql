-- user_custom_fields_dim_m


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  user_custom_fields.id,
  user_custom_fields.user_id,
  user_custom_fields.custom_field_id,
  SUBSTR(user_custom_fields.value, 1, 4000) AS value,
  custom_fields.display_name,
  custom_fields.abbreviation,
  CAST(custom_fields.enable_people_search AS bool) enable_people_search,
  TIMESTAMP(user_custom_fields.created_at) AS created_at,
  TIMESTAMP(user_custom_fields.updated_at) AS updated_at,
  users.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(user_custom_fields.record_insert_time)) AS record_insert_time,
  CAST(user_custom_fields.yr AS STRING) yr,
  CAST(user_custom_fields.month AS STRING) month,
  user_custom_fields.day,
  CAST(user_custom_fields.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('user_custom_fields')}} user_custom_fields
INNER JOIN
    {{ref('custom_fields_dim_m_v')}} custom_fields
ON
  custom_fields.id = user_custom_fields.custom_field_id
INNER JOIN
    {{ref('users_dim_m_v')}} users
ON
  users.id = user_custom_fields.user_id
WHERE
  users.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and user_custom_fields.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
