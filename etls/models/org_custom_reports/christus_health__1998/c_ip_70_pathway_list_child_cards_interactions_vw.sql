-- C-IP-70 [PATHWAY] List Child Cards + Interactions 
-- c_ip_70_pathway_list_child_cards_interactions_vw

SELECT * FROM 

(SELECT pathway_id, pathway_title, pathway_state, card_id, card_title, card_state, content_structure, card_type, card_subtype, card_resource_url, 
ecl_id, ecl_source_name, tags, Duration_seconds, Duration_HHMM, created_at, published_at, updated_at, card_author_id, card_author_full_name
FROM {{ref('c_op_70_pathway_list_child_cards_in_pathway_vw')}}
WHERE content_structure != 'Pathway') select_columns

LEFT OUTER JOIN 

(SELECT user_id, user_full_name, user_account_status, card_id as transcript_card_id, content_progress, completion_status, first_view_date,
completed_date, link_visited_date, middle_name, preferred_full_name, user_email, network_id, employee_id,
job_code_id, job_code_name, department_id, department_number, department_name, work_location_id,
work_location_name, entity_id, entity_name, ministry_name, employment_status, relationship_to_org, 
is_manager, reports_to_network_id, reports_to_employee_id, reports_to_name, reports_to_email, initial_hire_date,
rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, position_id,
position_level, position_name, position_family, position_category, position_sub_category, 
time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement, last_run
FROM {{ref('c_ip_00_master_transcript_interactions_vw')}}
WHERE user_full_name NOT like '%Christus%') select_columns_1

ON select_columns.card_id = select_columns_1.transcript_card_id