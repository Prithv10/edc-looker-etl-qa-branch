-- teams_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  domains,
  image_file_name,
  name,
  slug,
  image_content_type,
  TIMESTAMP(teams.image_updated_at) AS image_updated_at,
  description,
  id,
  source_ids,
  image_file_size,
  organization_id AS org_id_s,
  comments_count,
  TIMESTAMP(teams.created_at) AS created_at,
  TIMESTAMP(teams.updated_at) AS updated_at,
  CAST(is_everyone_team AS bool) is_everyone_team,
  CAST(auto_assign_content AS bool) auto_assign_content,
  CAST(is_private AS bool) is_private,
  CAST(is_dynamic AS bool) is_dynamic,
  CAST(is_mandatory AS bool) is_mandatory,
  CAST(only_admin_can_post AS bool) only_admin_can_post,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(teams.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
     {{get_master_db('teams')}} teams
WHERE
  organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and teams.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
