-- C-IP-10 [FEEDER] [TRANSCRIPT] 04 SHARES
-- c_ip_10_feeder_transcript_04_shares_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity':'month'},
    cluster_by = ['content_structure'],
    tags=['incremental']
  )
}}

SELECT user_id, user_full_name, user_account_status, card_id, card_title, content_structure, content_received_as, content_progress, first_view_date, 
completed_date, completion_status, link_visited_date, assigned_to_group_id, assigned_to_group_name, assignment_progress, assignment_created_date, 
assigned_by_id, assigned_by_name, assignment_started_date, assignment_completed_date, assignment_due_date, shared_by_id, shared_by_name, shared_date, 
shared_to_group_id, shared_to_group_name, middle_name, preferred_full_name, user_email, network_id, employee_id, job_code_id, job_code_name, department_id, 
department_name, department_number, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, relationship_to_org, is_manager, 
reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, 
action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family, position_category, position_sub_category, 
time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run, cards_completed, completion_progress, completion_progress_category, current_timestamp() as etl_record_created_time
FROM 
(
  SELECT shared_to_user_id, shared_card_id, share_type, shared_by_id, shared_by_name, shared_date, shared_to_group_id, shared_to_group_name, user_card, user_id, 
  user_full_name, user_account_status, card_id, card_title, content_structure,
    CASE
      WHEN `content_received_as` = 'Assigned as Individual' THEN 'Assigned as Individual'
      WHEN `content_received_as` = 'Asssigned via Group' THEN 'Asssigned via Group'
      WHEN `share_type` = 'Shared via Group' THEN 'Shared via Group'
      WHEN `share_type` = 'Shared To Individual' THEN 'Shared To Individual'
    ELSE
    'Elective'
  END AS content_received_as, content_progress, first_view_date, completed_date, completion_status, link_visited_date, middle_name, preferred_full_name, 
  user_email, network_id, employee_id, job_code_id, job_code_name, department_id, department_name, department_number, work_location_id, work_location_name, 
  entity_id, entity_name, ministry_name, employment_status, relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, 
  reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, 
  position_level, position_name, position_family, position_category, position_sub_category, time_account_created, latest_day_of_active_engagement, 
  first_day_of_active_engagement, last_run, assignment_user_id, assignment_card_id, assignment_content_received_as, assigned_to_group_id, assigned_to_group_name, 
  assignment_progress, assignment_created_date, assigned_by_id, assigned_by_name, assignment_started_date, assignment_completed_date, assignment_due_date, 
  cards_completed, completion_progress, completion_progress_category
  FROM 
  (
    SELECT * FROM 
    (
      SELECT DISTINCT *, CONCAT(shared_to_user_id, '-', shared_card_id) AS user_card FROM (SELECT shared_to_user_id, shared_card_id, share_type, shared_by_id, 
      shared_by_name, shared_date, shared_to_group_id, shared_to_group_name
        FROM
          {{ref('c_ip_80_feeder_share_identity_vw')}})) AS transcript_columns
    LEFT OUTER JOIN 
    (
      SELECT user_id, user_full_name, user_account_status, card_id, card_title, content_structure, content_received_as, content_progress, first_view_date, 
      completed_date, completion_status, link_visited_date, middle_name, preferred_full_name, user_email, network_id, employee_id, job_code_id, job_code_name, 
      department_id, department_name, department_number, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, 
      relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email, initial_hire_date, rehire_date, 
      termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family, 
      position_category, position_sub_category, time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run, 
      assignment_user_id, assignment_card_id, assignment_content_received_as, assigned_to_group_id, assigned_to_group_name, assignment_progress, 
      assignment_created_date, assigned_by_id, assigned_by_name, assignment_started_date, assignment_completed_date, assignment_due_date, cards_completed, 
      completion_progress, completion_progress_category
      FROM
        {{ref('c_ip_10_feeder_transcript_03_assignments_vw')}}) AS share_duplicates
    ON
      share_duplicates.user_id = transcript_columns.shared_to_user_id
      AND share_duplicates.card_id = transcript_columns.shared_card_id))