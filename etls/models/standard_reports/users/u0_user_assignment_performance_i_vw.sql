  -- 1454_Glue_Users[U][0] User_Assignments_Performance_i 
  -- u0_user_assignment_performance_i_vw
 
SELECT card_id, title, card_message, card_source_name, duration, card_type, card_level, card_author_name, assignor_name, assignor_id, assigned_user_id, assigned_user_full_name, assigned_user_handle, assignor_handle, assignment_state, record_insert_time, time_assignment_started, time_completed, assignment_due_date, time_assignment_created, time_assigned FROM
    (SELECT card_id, title, card_message, card_source_name, duration, card_type, card_level, card_author_name, assignor_name, assignor_id, assigned_user_id, assigned_user_full_name, assigned_user_handle, assignor_handle, assignment_state, record_insert_time, time_assignment_started, time_completed, assignment_due_date, time_assignment_created, time_assigned FROM
      (SELECT card_id, title, card_message, card_source_name, duration, card_type, card_level, card_author_name, assignor_name, assignor_id, assigned_user_id, assigned_user_full_name, assigned_user_handle, assignor_handle, assignment_state, record_insert_time, time_assignment_started, time_completed, assignment_due_date, time_assignment_created, time_assigned,
      RANK() OVER (PARTITION BY card_id, assignor_id, assigned_user_id ORDER BY record_insert_time DESC) AS rank from
      {{get_db_source('user_assignments_performance_i_v')}} QUALIFY rank = 1) user_assign_perform_i
 
    LEFT OUTER JOIN 
 
    (Select Time, card_id as assigned_card_id, card_author_id, event, user_id, platform, shared_to_user_id, team_id, group_user_id, is_user_generated, comment_id, follower_id, followed_user_id, channel_id, assigned_to_user_id, collaborator_id, curator_id, channel_follower_id, shared_to_user_first_name, shared_to_user_last_name, shared_to_user_email, shared_to_user_handle, shared_to_user_organization_role, assigned_to_user_first_name, assigned_to_user_last_name, assigned_to_user_email, assigned_to_user_handle, assigned_to_user_organization_role, group_user_first_name, group_user_last_name, group_user_email,group_user_handle, group_user_organization_role, user_first_name, user_last_name, user_organization_role, user_email, user_handle, user_name, card_author_first_name, card_author_last_name, card_author_email, card_author_handle, card_author_organization_role, followed_user_first_name, followed_user_last_name, followed_user_email, followed_user_handle, followed_user_organization_role, follower_user_first_name, follower_user_last_name, follower_user_email, follower_user_handle, follower_user_organization_role, collaborator_user_first_name, collaborator_user_last_name, collaborator_user_email, collaborator_user_handle, collaborator_user_organization_role, curator_user_first_name, curator_user_last_name, curator_user_email, curator_user_handle, curator_user_organization_role, channel_follower_user_first_name, channel_follower_user_last_name, channel_follower_user_email, channel_follower_user_handle, channel_follower_user_organization_role, duration as Filter_Rows_2_duration, title as Filter_Rows_2_title , card_message as Filter_Rows_2_card_message, card_type as Filter_Rows_2_card_type, card_level as Filter_Rows_2_card_level, card_source_name as Filter_Rows_2_card_source_name, card_created_at, card_state, team_name, comment_message, comment_type, channel_label, channel_is_private, channel_description, org_id_s, group_user_role, topic_id, topic_label, topic_name, pathway_id, pathway_name, journey_id, journey_name, poll_option_id, poll_option_label, quiz_option_id, quiz_option_label, is_correct, card_subtype, card_resource_url, ecl_id, is_card_promoted, is_live_stream, card_duration, attributes, user_agent, user_exclude_from_leaderboard, user_created_at, user_status, card_deleted_at, card_is_paid, card_is_public, created_user_id, suspended_user_id, badge_id, badge_type, badge_title, project_card_submission, project_card_submission_id, changed_column, old_val, new_val, grade_range, grader_type, grading_system,submitter_type, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_user_id, scorm_total_seconds_tracked, scorm_score, scorm_registration_success, user_last_sign_in_at, channel_visible, record_insert_time as Filter_Rows_2_record_insert_time, user_sign_in_count, completion_type, conferencing_tool, last_registration_date, referer, registration_limit, registration_type, request_id, training_registration_id, training_registration_state, quiz_attempt_id, quiz_attempt_passed, quiz_id, quiz_option_is_correct,quiz_passing_criteria, quiz_question_attempt_id, quiz_question_attempt_passed, quiz_question_id, quiz_question_label, quiz_questions_passed_count, quiz_reanswerable, is_system_generated, time_zone, start_date, end_date, card_hidden, readable_card_type, card_slug, event_recorder, is_admin_request, onboarding_status, org_hostname, user_org_uid, user_role, domain_id, domain_label, domain_name, member_user_id, controller_action, visited_profile_user_id, upload_mode, user_onboarding_current_step, user_onboarding_id, user_onboarding_status, average_rating, card_bookmark_id, is_channel_featured, is_channel_public, org_name, skill_id, skill_name, job_family, job_role, skill_category, skill_level_rated, occupation_id, occupation_name, occupation_category, channel_carousel_id, added_role, removed_role, card_rating, standard_type, platform_version_number, sign_in_ip, is_channel_curated, is_ecl_enabled, edited_user_id, is_open_source_content, external_id, channel_card_user_id, ecl_source_id, skill_credential, skill_level, manager_user_id, skill_description, channel_carousel_creator_id, is_channel_carousel_enabled, channel_carousel_display_name, channel_carousel_slug, impersonator_id, deleted_user_id, course_event_id, course_event_language, course_event_location, course_event_start_date, course_event_end_date FROM
    {{ ref('u0_usercards_event_vw') }}
    WHERE event = 'card_assignment_deleted') usercards_event
 
    ON 
 
    user_assign_perform_i.card_id = usercards_event.assigned_card_id
    and 
    user_assign_perform_i.assigned_user_id = usercards_event.assigned_to_user_id
    WHERE 
    time_assignment_created > time OR assigned_card_id IS NULL AND assigned_to_user_id IS NULL )
