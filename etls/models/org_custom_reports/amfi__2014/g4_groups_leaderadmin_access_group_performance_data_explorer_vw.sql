-- Groups [G][4] [Leader & Admin Access][Group Performance Data Explorer]
-- g4_groups_leaderadmin_access_group_performance_data_explorer_vw

-- NOTE: removed columns is_card_promoted, is_live_stream, is_user_generated, content_status
-- Missing columns location_code, division_code, department_function_code, department_id, person_city, person_state, employee_type, management_level, manager_name, start_date, job_code, department, department_function, division_name, company_name, afi_external_id, sales_state, avg_rating, total_user_ratings, sme, card_author_sme
SELECT user_id, group_id, group_name, card_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, is_public, content_structure, 
card_author_id, card_author_full_name, user_full_name, email, time_account_created, sign_in_count, user_account_status, time, event, shared_to_user_id, shared_to_group_id,
platform, performance_metric, comment_id, comment_message, followed_user_id, follower_id, shared_to_user_full_name, following_user_full_name, follower_user_full_name, shared_to_group_name, 
NUll as location_code, null as division_code, null as department_function_code, null as department_id, 
null as person_city, null as person_state, null as  employee_type, null as management_level, null as manager_name, null as start_date, null as job_code, null as department, null as  department_function, 
null as division_name, null as company_name, null as afi_external_id, null as sales_state, null as avg_rating, null as total_user_ratings, null as sme, null as card_author_sme, granted_event_view_access, excluded_from_leaderboard
from
(SELECT * FROM {{ref('g3_groups_performance_data_explorer_vw')}}) g3_performance
LEFT OUTER JOIN 
(SELECT distinct group_id as group_id_1, granted_event_view_access FROM {{ref('g3_groups_group_leadersgroup_admin_vw')}}) g3_leadersgroup
ON g3_performance.group_id = g3_leadersgroup.group_id_1