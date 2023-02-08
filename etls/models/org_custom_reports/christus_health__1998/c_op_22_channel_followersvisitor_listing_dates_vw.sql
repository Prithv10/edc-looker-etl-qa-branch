-- c_op_22_channel_followersvisitor_listing_dates_vw
-- C-OP-22 [CHANNEL] Followers & Visitor Listing Dates



WITH set_up_channel_follow_dates as(
SELECT channel_id, user_id, user_full_name, channel_visited as channel_last_visited_date, channel_first_visited as channel_first_visited_date, channel_followed as channel_followed_date, group_channel_followed as group_channel_followed_date, channel_name, performance_metric 
FROM(
SELECT channel_id, user_id, channel_name, event, performance_metric, user_full_name, max(time) as event_time FROM (
SELECT channel_id, user_id, channel_name, event, performance_metric, user_full_name, time FROM {{ref('g3_groups_channel_performance_vw')}}
WHERE event IN ('channel_visited', 'channel_first_visited', 'channel_followed', 'group_channel_followed'))
group by channel_id, user_id, channel_name, event, performance_metric, user_full_name)
PIVOT (
    MAX(event_time)
    FOR event IN ('channel_visited', 'channel_first_visited', 'channel_followed', 'group_channel_followed')
))


SELECT * FROM (SELECT * FROM set_up_channel_follow_dates) set_up_channel_follow_dates_1
LEFT OUTER JOIN 
(SELECT user_id as identity_user_id, middle_name, preferred_full_name, user_email, user_account_status, 
network_id, employee_id, job_code_id, job_code_name, department_id, department_number,
department_name, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, 
relationship_to_org, is_manager, reports_to_network_id, reports_to_name, reports_to_employee_id,
reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, 
position_id, position_level, position_name, position_family, position_category, position_sub_category,
time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run FROM {{ref('c_ip_00_master_identity_dataset_part2_final_vw')}}) select_columns_1
ON set_up_channel_follow_dates_1.user_id = select_columns_1.identity_user_id