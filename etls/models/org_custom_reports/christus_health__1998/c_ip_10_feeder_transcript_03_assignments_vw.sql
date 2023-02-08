-- C-IP-10 [FEEDER] [TRANSCRIPT] 03 ASSIGNMENTS
-- c_ip_10_feeder_transcript_03_assignments_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity':'month'},
    cluster_by = ['completion_status'],
    tags=['incremental']
  )
}}

SELECT user_id,user_full_name,user_account_status,card_id,card_title,content_structure,first_view_date,completed_date,
link_visited_date,cards_completed,completion_progress,completion_progress_category,middle_name,preferred_full_name,user_email,network_id,
employee_id,job_code_id,job_code_name,department_id,department_number,department_name,work_location_id,work_location_name,entity_id,entity_name,
ministry_name,employment_status,relationship_to_org,is_manager,reports_to_network_id,reports_to_employee_id,reports_to_name,reports_to_email,
initial_hire_date,rehire_date,termination_date,action_reason,action_reason_eff_date,yrs_of_service,paygroup,fte,position_id,position_level,
position_name,position_family,position_category,position_sub_category,time_account_created,latest_day_of_active_engagement,
first_day_of_active_engagement,last_run,content_progress,completion_status,assignment_user_id,assignment_card_id,assignment_content_received_as,
assigned_to_group_id,assigned_to_group_name,assignment_progress,assignment_created_date,assigned_by_id,assigned_by_name,assignment_started_date,
assignment_completed_date,assignment_due_date, current_timestamp() as etl_record_created_time,  CASE 
WHEN `assignment_content_received_as` = 'Assigned as Individual' THEN 'Assigned as Individual'
WHEN `assignment_content_received_as` = 'Asssigned via Group' THEN 'Asssigned via Group'
ELSE 'Elective'
END AS content_received_as FROM (select * from {{ ref("c_ip_10_feeder_transcript_02_journey_pathways_vw") }} as feeder
left outer join
    (
        select user_id as assignment_user_id, card_id as assignment_card_id, content_received_as as assignment_content_received_as, 
        assigned_to_group_id, assigned_to_group_name, assignment_progress, assignment_created_date, assigned_by_id, assigned_by_name, 
        assignment_started_date, assignment_completed_date, assignment_due_date
        from {{ ref('c_ip_11_feeder_assignment_individual_group_combined_vw') }}
    ) as select_columns
    on feeder.user_id = select_columns.assignment_user_id
    and feeder.card_id = select_columns.assignment_card_id)
