-- C-IP-00 [MASTER] ASSIGNMENT DATASET
-- c_ip_00_master_assignment_dataset_vw


With final_select as(
SELECT *, 
CASE WHEN assignment_progress = 'completed' then 'Completed Via Assignment'
     WHEN assignment_progress = 'dismissed' then 'Dismissed' 
     ELSE 'Not Started'
     END as content_progress_completed,
CASE WHEN content_progress='Started' THEN 'Started'
     WHEN content_progress='Completed' THEN 'Completed'
     ELSE content_progress
     END as content_progress_combined
 FROM 
(
SELECT user_id, user_full_name, card_id, card_title, content_received_as, assigned_to_group_id, assigned_to_group_name, assignment_progress, assignment_created_date, assigned_by_id, assigned_by_name, assignment_started_date, assignment_completed_date, assignment_due_date, identity_user_id, middle_name, preferred_full_name, user_email, user_account_status, network_id, employee_id, job_code_id, job_code_name, department_id, department_number, department_name, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family, position_category, position_sub_category, time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run
FROM {{ref('c_ip_10_assignment_assignment_list_identity_vw')}}) select_columns

LEFT OUTER JOIN 

(SELECT user_id as interaction_user_id, card_id as interaction_card_id, content_structure, content_progress, first_view_date, completion_status,
completed_date, link_visited_date, cards_completed, completion_progress, completion_progress_category
 FROM {{ref('c_ip_10_feeder_transcript_02_journey_pathways_vw')}}) select_columns_1

ON select_columns.user_id = select_columns_1.interaction_user_id
and select_columns.card_id = select_columns_1.interaction_card_id)

SELECT user_id, user_full_name, card_id, card_title, content_structure, content_received_as, content_progress_combined, first_view_date, link_visited_date, 
CASE WHEN content_progress_combined= 'Completed' THEN 'Completed'
     WHEN content_progress_combined= 'Completed via Assignment' THEN 'Completed'
     ELSE 'Not Completed'
     END as completion_status, completed_date, cards_completed, completion_progress, completion_progress_category, assigned_to_group_id, assigned_to_group_name, assigned_by_id, assigned_by_name, 
assignment_created_date, assignment_due_date, assignment_started_date, assignment_completed_date, assignment_progress, middle_name, preferred_full_name, user_email,
user_account_status, network_id, employee_id, job_code_id, job_code_name, department_id, department_number, department_name, work_location_id,
work_location_name, entity_id, entity_name, ministry_name, employment_status, relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id,
reports_to_name, reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, position_id,
position_level, position_name, position_family, position_category, position_sub_category, time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement,
last_run FROM final_select

