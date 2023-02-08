-- custom_fields_dim_m

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
  abbreviation,
  display_name,
  TIMESTAMP(custom_fields.created_at) AS created_at,
  TIMESTAMP(custom_fields.updated_at) AS updated_at,
  CAST(enable_people_search AS boolean) enable_people_search,
  IFNULL(custom_fields.data_type, 0) AS data_type,
  custom_fields.field_type,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(custom_fields.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
{{get_master_db('custom_fields')}} custom_fields
WHERE
  organization_id = {{var("var_cust_id")}}


{% if is_incremental() %}
    and custom_fields.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
