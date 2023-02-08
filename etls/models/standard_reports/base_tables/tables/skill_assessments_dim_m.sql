-- skill_assessments_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

-- depends_on: {{ ref('users_dim_m') }}
SELECT
  sa.id,
  sa.user_id,
  sa.user_job_role_id,
  sa.skill_id,
  sa.skill_name,
  sa.assessed_by,
  sa.rating,
  sa.status,
  SUBSTR(sa.invitation_message, 1, 4000) AS invitation_message,
  TIMESTAMP(sa.due_at) AS due_at,
  sa.skills_detail_id,
  TIMESTAMP(sa.last_reminder_date) AS last_reminder_date,
  sa.skill_assessment_invitation_id,
  TIMESTAMP(sa.created_at) AS created_at,
  TIMESTAMP(sa.updated_at) AS updated_at,
  TIMESTAMP(sa.deleted_at) AS deleted_at,
  users.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(sa.record_insert_time)) AS record_insert_time,
  CAST(sa.yr AS STRING) yr,
  CAST(sa.month AS STRING) month,
  sa.day,
  CAST(sa.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('skill_assessments')}} sa
LEFT JOIN
  {{ref('users_dim_m')}} users
ON
  sa.user_id = users.id
WHERE
  users.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and sa.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
