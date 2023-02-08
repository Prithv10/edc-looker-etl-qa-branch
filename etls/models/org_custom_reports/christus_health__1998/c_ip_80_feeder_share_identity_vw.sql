-- C-IP-80 [FEEDER] SHARE + IDENTITY
-- c_ip_80_feeder_share_identity_vw


with append_rows as (
        select *
        from {{ ref('c_ip_80_feeder_shares_individuals_vw') }}
        union all
        select *
        from {{ ref('c_ip_80_feeder_share_groups_vw') }}
    )

select shared_to_user_id, shared_to_user_full_name, shared_card_id, shared_card_title, shared_to_group_id, shared_to_group_name, share_type, 
shared_by_id, shared_by_name, shared_date, middle_name, preferred_full_name, user_email, user_account_status, network_id, employee_id, job_code_id, 
job_code_name, department_id, department_number, department_name, work_location_id, work_location_name, entity_id, entity_name, ministry_name, 
employment_status, relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email, 
initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, 
position_level, position_name, position_family, position_category, position_sub_category, time_account_created, latest_day_of_active_engagement, 
first_day_of_active_engagement, last_run
from
    (
        select * from append_rows as append
        left outer join
            (
                select user_id, user_full_name, middle_name, preferred_full_name, user_email, user_account_status, network_id, employee_id, 
                job_code_id, job_code_name, department_id, department_number, department_name, work_location_id, work_location_name, entity_id, 
                entity_name, ministry_name, employment_status, relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id, 
                reports_to_name, reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, 
                yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family, position_category, position_sub_category, 
                time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run
                from {{ ref('c_ip_00_master_identity_dataset_part2_final_vw') }}
            ) as identity_column
            on append.shared_to_user_id = identity_column.user_id
    )
