-- C-IP-00 [MASTER] TRANSCRIPT INTERACTIONS
-- c_ip_00_master_transcript_interactions_vw
-- formula commented out due to error 

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}


SELECT user_id, user_full_name, user_account_status, card_id, card_title, content_structure, content_received_as, content_progress, completion_status, 
first_view_date, completed_date, link_visited_date, cards_completed, completion_progress, completion_progress_category, assigned_to_group_id, 
assigned_to_group_name, assignment_progress, assignment_created_date, assignment_due_date, assigned_by_id, assigned_by_name, assignment_started_date, 
assignment_completed_date, shared_by_id, shared_by_name, shared_date, shared_to_group_id, shared_to_group_name, middle_name, preferred_full_name, user_email, 
network_id, employee_id, job_code_id, job_code_name, department_id, department_name, department_number, work_location_id, work_location_name, entity_id, 
entity_name, ministry_name, employment_status, relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, 
reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, 
position_level, position_name, position_family, position_category, position_sub_category, time_account_created, latest_day_of_active_engagement, 
first_day_of_active_engagement, last_run, card_state, standard_card_type, card_type, card_subtype, card_resource_url, ecl_id, ecl_source_name, tags, 
Duration_seconds, Duration_HHMM, published_at, created_at, updated_at, card_author_id, card_author_full_name, in_channel, in_journey, in_pathway, is_public, 
views_unique, unique_views_category, views_all, all_views_category, completions, clicked_link, shared_to_person, shared_to_group, comments, likes, bookmarks, 
badges_earned, current_timestamp() as etl_record_created_time
FROM 
(
  SELECT user_id, user_full_name, user_account_status, card_id, card_title, content_received_as, content_progress, first_view_date, completed_date, 
  completion_status, link_visited_date, assigned_to_group_id, assigned_to_group_name, assignment_progress, assignment_created_date, assigned_by_id, 
  assigned_by_name, assignment_started_date, assignment_completed_date, assignment_due_date, shared_by_id, shared_by_name, shared_date, shared_to_group_id, 
  shared_to_group_name, middle_name, preferred_full_name, user_email, network_id, employee_id, job_code_id, job_code_name, department_id, department_name, 
  department_number, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, relationship_to_org, is_manager, 
  reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, 
  action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family, position_category, position_sub_category, 
  time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run, cards_completed,
    CASE WHEN
    IFNULL(CAST((CAST(completion_progress as STRING)) as INT64),0) = 0 AND (content_structure<>'Smartcard')
    THEN 0
    ELSE completion_progress
    END AS
    completion_progress,
    CASE WHEN
    IFNULL(CAST((CAST(completion_progress_category as STRING)) as INT64),0) = 0 AND (content_structure<>'Smartcard')
    THEN 'Opened'
    ELSE completion_progress_category
    END AS
    completion_progress_category, master_card_id, card_resource_url, card_subtype, master_card_title, card_type, ecl_id, ecl_source_name, is_public, 
    content_structure, card_author_id, card_author_full_name, Duration_seconds, Duration_HHMM, standard_card_type, activity_type, published_at, created_at, 
    updated_at, card_level, average_rating, tags, Duration_Hours, Duration_Minutes, Genesis_card_link, clickable_genesis_url, in_channel, in_journey, in_pathway, 
    views_unique, views_all, completions, clicked_link, shared_to_person, shared_to_group, comments, likes, bookmarks, badges_earned, unique_views_category, 
    all_views_category, card_state
  FROM 
  (
    SELECT * FROM 
    (
      SELECT user_id, user_full_name, user_account_status, card_id, card_title, content_received_as, content_progress, first_view_date, completed_date, 
      completion_status, link_visited_date, assigned_to_group_id, assigned_to_group_name, assignment_progress, assignment_created_date, assigned_by_id, 
      assigned_by_name, assignment_started_date, assignment_completed_date, assignment_due_date, shared_by_id, shared_by_name, shared_date, shared_to_group_id, 
      shared_to_group_name, middle_name, preferred_full_name, user_email, network_id, employee_id, job_code_id, job_code_name, department_id, department_name, 
      department_number, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, relationship_to_org, is_manager, 
      reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, 
      action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family, position_category, position_sub_category, 
      time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run, cards_completed, completion_progress, 
      completion_progress_category
      FROM
        {{ref('c_ip_10_feeder_transcript_04_shares_vw')}}) AS select_columns_2
    LEFT OUTER JOIN (
      SELECT card_id AS master_card_id, card_resource_url, card_state, card_subtype, card_title AS master_card_title, card_type, ecl_id, ecl_source_name, 
      is_public, content_structure, card_author_id, card_author_full_name, Duration_seconds, Duration_HHMM, standard_card_type, activity_type, published_at, 
      created_at, updated_at, card_level, average_rating, tags, Duration_Hours, Duration_Minutes, Genesis_card_link, clickable_genesis_url, in_channel, in_journey, 
      in_pathway, views_unique, views_all, completions, clicked_link, shared_to_person, shared_to_group, comments, likes, bookmarks, badges_earned, 
      unique_views_category, all_views_category
      FROM
        {{ref('c_ip_00_master_card_dataset_vw')}}) AS select_columns_1
    ON
      select_columns_2.card_id = select_columns_1.master_card_id))