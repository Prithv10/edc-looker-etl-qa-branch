-- C-IP-50 [USER] Individual Activity Counts
-- c_ip_50_user_individual_activity_counts_vw
WITH u2_users1 as(
SELECT 
event_user_id, card_bookmarked as bookmarks, card_comment_created as comments, card_liked as likes, 
card_shared as shares, card_viewed as views, card_marked_as_complete as completes, card_created as cards_created,
user_badge_completed as badges_completed
 FROM(
SELECT event_user_id, event, count(event) as counts FROM
(SELECT user_id as event_user_id, card_id as event_card_id, event, time FROM {{ref('u2_users_performance_part5_final_results_vw')}}
WHERE event NOT IN ('user_followed', 'card_source_visited', 'card_published', 'card_scorm_started', 'card_scorm_completed'))
GROUP BY 
event_user_id, event)
PIVOT (
    MAX(counts)
    FOR event IN ('card_viewed','card_comment_created','card_shared','card_marked_as_complete','card_relevance_rated','user_badge_shared_on_social','card_bookmarked','user_badge_completed','card_created','card_liked')
))

SELECT user_id, user_full_name, user_account_status, views, completes, badges_completed, comments, shares, 
likes, bookmarks, cards_created, middle_name, preferred_full_name, user_email, network_id, employee_id, job_code_id,
job_code_name, department_id, department_number, department_name, work_location_id, work_location_name, entity_id, entity_name,
ministry_name, employment_status, relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, 
reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, 
fte, position_id, position_level, position_name, position_family, position_category, position_sub_category, time_account_created,
latest_day_of_active_engagement, first_day_of_active_engagement, last_run
FROM(
SELECT 
user_id, user_full_name, middle_name, preferred_full_name, user_email, user_account_status, 
network_id, employee_id, healthstream_id, job_code_id, job_code_name, department_id, department_number,
department_name, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, 
relationship_to_org, is_manager, reports_to_network_id, reports_to_name, reports_to_employee_id,
reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, 
position_id, position_level, position_name, position_family, position_category, position_sub_category,
time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run
FROM {{ref('c_ip_00_master_identity_dataset_part2_final_vw')}}) master_identity
LEFT OUTER JOIN 
u2_users1
ON master_identity.user_id = u2_users1.event_user_id
