-- C-IP-10 [FEEDER] [TRANSCRIPT] 01 IDENTITY
-- c_op_10_feeder_transcript_01_identity_vw


WITH set_completion as(
SELECT user_id, card_id, card_title, CASE 
WHEN completion_status = 'Completed' THEN 'Completed'
ELSE 'Started'
END as content_progress, content_received_as, first_view_date, completed_date, link_visited_date,completion_status FROM (
SELECT user_id, card_id, card_title, content_progress, content_received_as, first_view_date, completed_date, link_visited_date, CASE 
WHEN IFNULL(CAST((CAST(completed_date as STRING)) as INT64),0) = 0 THEN 'Not Completed'
ELSE 'Completed'
END as completion_status
FROM(
SELECT *
FROM(
SELECT user_id, card_id, card_title, time, event, 'Not Completed' as completion_status, 'Started' as content_progress, 'Elective' as content_received_as FROM {{ref('u2_users_performance_part5_final_results_vw')}}
WHERE event = 'card_viewed' 
or event = 'card_marked_as_completed'
or event = 'card_source_visited')
PIVOT(
    MAX(time)
    FOR event IN ('card_viewed' as first_view_date, 'card_marked_as_completed' as completed_date, 'card_source_visited' as link_visited_date)
)))
)

SELECT user_id, user_full_name, user_account_status, card_id, card_title, content_received_as, content_progress,
first_view_date, completed_date, completion_status, link_visited_date, middle_name, 
preferred_full_name, user_email, network_id, employee_id, job_code_id, job_code_name,
department_id, department_number, department_name, work_location_id, work_location_name,
entity_id, entity_name, ministry_name, employment_status, relationship_to_org, 
is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email,
initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, 
yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family, 
position_category, position_sub_category, time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run
 FROM (SELECT * FROM set_completion) as set_completion_1
LEFT OUTER JOIN
(SELECT user_id as identity_user_id, user_full_name, middle_name, preferred_full_name, user_email, user_account_status, 
network_id, employee_id, job_code_id, job_code_name, department_id, department_number,
department_name, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, 
relationship_to_org, is_manager, reports_to_network_id, reports_to_name, reports_to_employee_id,
reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, 
position_id, position_level, position_name, position_family, position_category, position_sub_category,
time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run FROM {{ref('c_ip_00_master_identity_dataset_part2_final_vw')}}) select_columns_1
ON set_completion_1.user_id = select_columns_1.identity_user_id