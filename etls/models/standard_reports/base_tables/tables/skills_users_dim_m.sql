-- skills_users_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  * EXCEPT (skill_col, cols), cols AS skills,
  TRIM( REPLACE(
      CASE
        WHEN REGEXP_EXTRACT(cols,r'(?:topic_label:)(.*)') IS NOT NULL THEN REGEXP_EXTRACT(cols,r'(?:topic_label:)(.*)')
        WHEN REGEXP_EXTRACT(cols,r'(?:label:)(.*)') IS NOT NULL THEN REGEXP_EXTRACT(cols,r'(?:label:)(.*)')
      ELSE
      NULL
    END
      , '\\"', '')) AS skill_label
FROM
  (
  SELECT
    skills_users.id,
    user_id,
    skill_id,
    description,
    SUBSTR(credential, 1, 4000) AS credential,
    TIMESTAMP(skills_users.created_at) AS created_at,
    TIMESTAMP(skills_users.updated_at) AS updated_at,
    experience,
    skill_level,
    credential_name,
    credential_url,
    TIMESTAMP(expiry_date) AS expiry_date,
    TIMESTAMP(issue_date) AS issue_date,
    issuer,
    credential_id,
    credential_type,
    CAST(verified AS bool) verified,
    score,
    skills_detail_id,
    skills_users.global_user_id,
    card_id,
    s.name AS skill_name,
    users.organization_id AS org_id_s,
    FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(skills_users.record_insert_time)) AS record_insert_time,
    CAST(skills_users.yr AS STRING) yr,
    CAST(skills_users.month AS STRING) month,
    skills_users.day,
    CAST(skills_users.hour AS STRING) hour,
    REGEXP_EXTRACT_ALL(skills, r'(?:- )([^-]*)') AS skill_col,
    current_timestamp() AS etl_record_created_time
  FROM
    {{get_master_db('skills_users')}} skills_users
  LEFT JOIN
  {{get_master_db('skills')}} s
  ON
    s.id = skills_users.skill_id
  JOIN
    {{ref('users_dim_m_v')}} users
  ON
    skills_users.user_id = users.id
  WHERE
        users.organization_id={{var("var_cust_id")}}
        {% if is_incremental() %}
            and skills_users.day >= (SELECT max(day) FROM {{ this }})
        {% endif %}
    ) DATA
    LEFT JOIN
      UNNEST(skill_col) cols


#   DATA
#   LEFT JOIsN
#     UNNEST(skill_col) cols

