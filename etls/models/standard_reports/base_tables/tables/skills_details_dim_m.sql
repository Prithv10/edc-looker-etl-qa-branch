-- skills_details_dim_m
{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  sd.id,
  sd.skill_description,
  sd.skill_id,
  s.name AS skill_name,
  sd.skill_category_id,
  sc.name AS skill_category_name,
  sd.node_id,
  TIMESTAMP(sd.created_at) AS created_at,
  TIMESTAMP(sd.updated_at) AS updated_at,
  sd.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(sd.record_insert_time)) AS record_insert_time,
  CAST(sd.yr AS STRING) yr,
  CAST(sd.month AS STRING) month,
  sd.day,
  CAST(sd.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('skills_details')}} sd
LEFT JOIN
  {{get_master_db('skills')}} s
ON
  sd.skill_id = s.id
LEFT JOIN
  {{get_master_db('skill_categories')}} sc
ON
  sd.skill_category_id = sc.id
WHERE
  organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and sd.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
