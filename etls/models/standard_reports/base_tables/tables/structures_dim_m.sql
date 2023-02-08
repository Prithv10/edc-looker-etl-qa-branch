-- structures_dim_m


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
  creator_id,
  organization_id AS org_id_s,
  parent_id,
  parent_type,
  display_name,
  context,
  slug,
  CAST(enabled AS bool) enabled,
  TIMESTAMP(structures.created_at) AS created_at,
  TIMESTAMP(updated_at) updated_at,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(structures.record_insert_time)) AS record_insert_time,
  organization_id,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
 {{get_master_db('structures')}} structures
WHERE
  organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and structures.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
