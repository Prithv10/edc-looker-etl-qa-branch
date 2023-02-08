-- team_assignments_fact_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  team_assignments.id,
  team_assignments.assignment_id,
  team_assignments.team_id,
  TIMESTAMP(team_assignments.created_at) AS created_at,
  TIMESTAMP(team_assignments.updated_at) AS updated_at,
  team_assignments.assignor_id,
  team_assignments.message,
  users.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(team_assignments.record_insert_time)) AS record_insert_time,
  CAST(team_assignments.yr AS STRING) yr,
  CAST(team_assignments.month AS STRING) month,
  team_assignments.day,
  CAST(team_assignments.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('team_assignments')}} team_assignments
LEFT JOIN
  {{ref('assignments_fact_m_v')}} assignments
ON
  team_assignments.assignment_id = assignments.id
LEFT JOIN
  {{ref('users_dim_m_v')}} users
ON
  assignments.user_id= users.id
WHERE
  users.organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and team_assignments.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
