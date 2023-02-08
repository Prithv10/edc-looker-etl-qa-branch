-- user_profiles_fact_m


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}


SELECT
  user_profiles.id,
  users.organization_id AS org_id_s,
  user_id,
  SUBSTR(expert_topics, 1, 4000) AS expert_topics,
  SUBSTR(learning_topics, 1, 4000) AS learning_topics,
  TIMESTAMP(user_profiles.created_at) AS created_at,
  TIMESTAMP(user_profiles.updated_at) AS updated_at,
  hr_job_role_id,
  hr_organization_id,
  hr_location_id,
  hr_competency_id,
  hr_domain_id,
  time_zone,
  SUBSTR(onboarding_options, 1, 4000) AS onboarding_options,
  LANGUAGE,
  CAST(tac_accepted AS bool) tac_accepted,
  job_title,
  dashboard_info,
  company,
  job_role,
  TIMESTAMP(dob) AS dob,
  TIMESTAMP(user_profiles.tac_accepted_at) AS tac_accepted_at,
  gender,
  mobile_number,
  work_country,
  domain,
  CAST(mobile_verified AS bool) mobile_verified,
  occupation_id,
  occupations.name AS occupation_name,
  category AS occupation_category,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(user_profiles.record_insert_time)) AS record_insert_time,
  CAST(user_profiles.yr AS STRING) yr,
  CAST(user_profiles.month AS STRING) month,
  user_profiles.day,
  CAST(user_profiles.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('user_profiles')}} user_profiles
INNER JOIN
    {{get_master_db('occupations')}} occupations
ON
  occupations.id = user_profiles.occupation_id
LEFT JOIN
    {{ref('users_dim_m_v')}} users
ON
  user_profiles.user_id = users.id
WHERE
  users.organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and user_profiles.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
