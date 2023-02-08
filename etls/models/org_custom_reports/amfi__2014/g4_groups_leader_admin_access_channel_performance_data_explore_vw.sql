-- Groups [G][4] [Leader & Admin Access][Channel Performance Data Explorer]
-- g4_groups_leader_admin_access_channel_performance_data_explore_vw

-- NULL indicates missing columns

SELECT user_id, user_full_name, email, NULL AS time_account_created, NULL AS sign_in_count, user_account_status, time, channel_id, 
event, platform, performance_metric, channel_name, is_channel_curated, NULL AS is_channel_featured, NULL AS is_channel_public, 
is_ecl_enabled, channel_status, group_id, group_name, NULL AS location_code, NULL AS division_code, NULL AS department_function_code, 
NULL AS department_id, NULL AS person_city, NULL AS person_state, NULL AS employee_type, NULL AS management_level, NULL AS manager_name, 
NULL AS start_date, NULL AS job_code, NULL AS department, NULL AS department_function, NULL AS division_name, NULL AS company_name,
NULL AS AFI_External_ID, NULL AS sales_state, excluded_from_leaderboard, NULL AS SME, granted_event_view_access
FROM (
  SELECT * FROM
    {{ ref('g3_groups_channel_performance_vw') }} AS channel
  LEFT OUTER JOIN (
    SELECT DISTINCT group_id AS group_id_1,granted_event_view_access
    FROM
      {{ ref('g3_groups_group_leadersgroup_admin_vw') }}) AS leader
  ON
    channel.group_id = leader.group_id_1)