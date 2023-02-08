-- teams_users_fact_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}


SELECT
  teams_users.id,
  team_id,
  organization_id AS org_id_s,
  user_id,
  as_type,
  TIMESTAMP(teams_users.created_at) AS created_at,
  TIMESTAMP(teams_users.updated_at) AS updated_at,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(teams_users.record_insert_time)) AS record_insert_time,
  CAST(teams_users.yr AS STRING) yr,
  CAST(teams_users.month AS STRING) month,
  teams_users.day,
  CAST(teams_users.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
{{get_master_db('teams_users')}} teams_users
LEFT JOIN
{{ref('users_dim_m_v')}} users
ON
  teams_users.user_id=users.id
WHERE
  users.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and teams_users.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
