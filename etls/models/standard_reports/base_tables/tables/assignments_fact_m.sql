-- assignments_fact_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  assignments.id,
  user_id,
  title,
  assignable_type,
  assignable_id,
  TIMESTAMP(assignments.created_at) AS created_at,
  TIMESTAMP(assignments.updated_at) AS updated_at,
  state,
  TIMESTAMP(assignments.started_at) AS started_at,
  TIMESTAMP(assignments.completed_at) AS completed_at,
  TIMESTAMP(assignments.due_at) AS due_at,
  TIMESTAMP(start_date) AS start_date,
  assignor_id,
  TIMESTAMP(assigned_date) AS assigned_date,
  organization_id AS org_id_s,
  TIMESTAMP(last_reminder_date) AS last_reminder_date,
  assignment_priority,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(assignments.record_insert_time)) AS record_insert_time,
  CAST(assignments.yr AS STRING) yr,
  CAST(assignments.month AS STRING) month,
  assignments.day,
  CAST(assignments.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('assignments')}} assignments
LEFT JOIN
  {{ref('users_dim_m_v')}} users
ON
  assignments.user_id= users.id
WHERE
  organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and assignments.day >= (SELECT max(day) FROM {{ this }})
{% endif %}

