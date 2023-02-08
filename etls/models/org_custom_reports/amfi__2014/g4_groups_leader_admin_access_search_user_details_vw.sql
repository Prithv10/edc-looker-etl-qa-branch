-- Groups [G][4] [Leader & Admin Access][Search User Details] 
-- g4_groups_leader_admin_access_search_user_details_vw

-- NULL indicates missing columns

SELECT time, analytics_version, event, is_admin_request, is_system_generated, hostname, org_id, platform, platform_version_number, 
results_count, search_query, user_agent, user_id, user_full_name, email, time_account_created, NULL AS sign_in_count, user_account_status, 
NULL AS location_code, NULL AS division_code, NULL AS department_function_code, NULL AS department_id, NULL AS person_city, 
NULL AS person_state, NULL AS employee_type, NULL AS management_level, NULL AS manager_name, NULL AS start_date, NULL AS job_code, 
NULL AS department, NULL AS department_function, NULL AS division_name, NULL AS company_name, NULL AS AFI_External_ID, NULL AS sales_state,
group_id, group_name, excluded_from_leaderboard, NULL AS SME, granted_event_view_access
FROM (
 SELECT * FROM
   {{ ref('g3_groups_search_user_details_vw') }} AS search_user
 LEFT OUTER JOIN (
   SELECT DISTINCT group_id AS group_id_1,granted_event_view_access
   FROM
     {{ ref('g3_groups_group_leadersgroup_admin_vw') }}) AS leader
 ON
   search_user.group_id = leader.group_id_1)
