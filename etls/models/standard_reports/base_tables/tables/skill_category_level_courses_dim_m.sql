-- skill_category_level_courses_dim_m

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
  skill_level,
  card_id,
  skill_level_description,
  skills_detail_id,
  skill_id,
  skill_category_id,
  TIMESTAMP(created_at) AS created_at,
  TIMESTAMP(updated_at) AS updated_at,
  organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('skill_category_level_courses')}} sclc
WHERE
  organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and sclc.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
