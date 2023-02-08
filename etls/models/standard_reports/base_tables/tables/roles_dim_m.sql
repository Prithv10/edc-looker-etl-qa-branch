-- roles_dim_m

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
  name,
  organization_id AS org_id_s,
  CAST(master_role AS bool) master_role,
  TIMESTAMP(roles.created_at) AS created_at,
  TIMESTAMP(roles.updated_at) AS updated_at,
  image_url,
  threshold,
  default_name,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(roles.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('roles')}} roles
WHERE
  organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and roles.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
