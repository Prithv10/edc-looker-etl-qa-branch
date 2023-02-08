-- Groups [G][4] [Leader & Admin Access][Overall Onboarding Status]
-- g4_groups_leaderadmin_access_overall_onboarding_status_vw

SELECT user_id, user_full_name, email, time_account_created, sign_in_count, user_account_status, 
total_days_of_active_engagement, latest_day_of_active_engagement, first_day_of_active_engagement, overall_onboarding_status, group_id, 
group_name, null as location_code, null as division_code, null as department_function_code, null as department_id,
null as person_city, null as person_state, null as employee_type, null as management_level, null as manager_name, null as start_date, null as job_code, 
null as department, null as department_function, null as division_name, null as company_name, null as afi_external_id, null as sales_state, 
excluded_from_leaderboard, null as sme, granted_event_view_access
FROM (SELECT * FROM {{ref('g3_groups_overall_onboarding_status_vw')}}) g3_overall 
LEFT OUTER JOIN 
(SELECT distinct group_id as group_id_1, granted_event_view_access FROM {{ref('g3_groups_group_leadersgroup_admin_vw')}}) g3_leadersgroup
ON g3_overall.group_id = g3_leadersgroup.group_id_1
