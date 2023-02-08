-- C-IP-10 [ASSIGNMENT] Assignment List + Identity 
-- c_ip_10_assignment_assignment_list_identity_vw


select *
from
    (
        select *
        from {{ ref("c_ip_11_feeder_assignment_individual_group_combined_vw") }}
    ) c_ip_feeder
left outer join
    (
        select
            user_id as identity_user_id, middle_name, preferred_full_name, user_email, user_account_status,
            network_id, employee_id, job_code_id, job_code_name, department_id, 
            department_number, department_name, work_location_id, work_location_name, 
            entity_id, entity_name, ministry_name, employment_status, relationship_to_org, is_manager,
            reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email,
            initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date,
            yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family,
            position_category, position_sub_category, time_account_created, latest_day_of_active_engagement,
            first_day_of_active_engagement, last_run
        from {{ ref("c_ip_00_master_identity_dataset_part2_final_vw") }}
    ) select_columns
    on c_ip_feeder.user_id = select_columns.identity_user_id
