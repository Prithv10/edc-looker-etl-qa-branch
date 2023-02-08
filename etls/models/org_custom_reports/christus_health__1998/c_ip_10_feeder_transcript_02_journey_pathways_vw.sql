-- C-IP-10 [FEEDER] [TRANSCRIPT] 02 JOURNEY + PATHWAYS
-- c_ip_10_feeder_transcript_02_journey_pathways_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity':'month'},
    cluster_by = ['completion_status'],
    tags=['incremental']
  )
}}


select
    user_id, user_full_name, user_account_status, card_id, card_title, content_structure, content_received_as, first_view_date, 
    completed_date, link_visited_date, cards_completed, completion_progress, completion_progress_category, 
    middle_name, preferred_full_name, user_email, network_id, employee_id, job_code_id, job_code_name, department_id, department_number,
    department_name, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, relationship_to_org, 
    is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email, initial_hire_date, rehire_date, termination_date, 
    action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, position_id, position_level, position_name, position_family, position_category, 
    position_sub_category, time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run,
    case
        when journey_pathway_content_progress = 'Completed'
        then 'Completed'
        else content_progress
    end as content_progress,
    case
        when journey_pathway_completion_status = 'Completed'
        then 'Completed'
        else completion_status
    end as completion_status, current_timestamp() as etl_record_created_time
from (select * from {{ ref("c_op_10_feeder_transcript_01_identity_vw") }}) transcript
left outer join
    (
        select
            user_id as journey_pathway_user_id,
            user_full_name as journey_pathway_user_full_name,
            content_structure,
            journey_pathway_id,
            cards_completed,
            content_progress as journey_pathway_content_progress,
            completion_status as journey_pathway_completion_status,
            completion_progress,
            time_completed,
            completion_progress_category
        from {{ ref("c_ip_60_feeder_journey_progress_pathway_progress_vw") }}
    ) journey
    on transcript.user_id = journey.journey_pathway_user_id
    and transcript.card_id = journey.journey_pathway_id
