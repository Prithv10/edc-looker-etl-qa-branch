-- user_job_family_role_skills_dim_m

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
  CAST(course_percentage_complete AS FLOAT64) AS course_percentage_complete,
  user_id,
  learning_plan_activated,
  job_family_role_skill_id,
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
  {{get_master_db('user_job_family_role_skills')}} ujfrs
WHERE
  organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and ujfrs.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
