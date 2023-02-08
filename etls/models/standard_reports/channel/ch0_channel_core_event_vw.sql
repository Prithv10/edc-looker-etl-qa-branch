-- 1454_Glue_Channel [U][0][Core Event Data - Buffered]
-- ch0_channel_core_event_vw
-- NOTE : Changed name from dbt_channel_u0_event_vw to ch0_channel_core_event_vw - to avoid confusion

SELECT
  channel_perf_reporting.* EXCEPT(Occurences)
FROM (
  SELECT
  event_time AS Time, card_id, card_author_id, card_created_at, event, user_id, (CASE WHEN `platform` = 'iPhone' THEN 'ios'ELSE `platform` END ) AS platform, shared_to_user_id, group_user_id, is_user_generated, comment_id, follower_id, followed_user_id, team_id, team_name, event_channel_id, shared_to_user_first_name, shared_to_user_last_name, shared_to_user_handle, shared_to_user_organization_role, shared_to_user_email, group_user_first_name, group_user_last_name, group_user_handle, group_user_organization_role, group_user_email, user_last_sign_in_at, user_first_name, user_last_name, user_name, user_handle, user_organization_role, card_author_first_name, card_author_last_name, card_author_handle, card_author_organization_role, card_author_email, followed_user_first_name, followed_user_last_name, followed_user_handle, followed_user_organization_role, followed_user_email, follower_user_first_name, follower_user_last_name, follower_user_handle, follower_user_organization_role, follower_user_email, duration, title, card_message, card_type, card_level, card_state, card_source_name, comment_message, comment_type, assigned_to_user_id, assigned_to_user_first_name, assigned_to_user_last_name, assigned_to_user_email, assigned_to_user_handle, assigned_to_user_organization_role, channel_follower_id, channel_follower_user_first_name, channel_follower_user_last_name, channel_follower_user_email, channel_follower_user_handle, channel_follower_user_organization_role, curator_id, curator_user_first_name, curator_user_last_name, curator_user_email, curator_user_handle, curator_user_organization_role, collaborator_id, collaborator_user_first_name, collaborator_user_last_name, collaborator_user_email, collaborator_user_handle, collaborator_user_organization_role, channel_id, channel_label, channel_description, channel_is_private, channel_visible, org_id_s, user_email, topic_id, topic_label, topic_name, pathway_id, pathway_name, journey_id, journey_name, poll_option_id, poll_option_label, quiz_option_id, quiz_option_label, is_correct, user_agent, is_channel_curated, is_ecl_enabled, COUNT(event) AS Occurences
FROM (
  SELECT
    domain_label, domain_name, average_rating, quiz_question_attempt_passed, upload_mode, standard_type, scorm_total_seconds_tracked, follower_user_email, quiz_attempt_passed, assigned_to_user_last_name, org_hostname, channel_carousel_display_name, record_insert_time, skill_description, channel_carousel_creator_id, changed_column, course_event_location, duration, is_system_generated, channel_follower_user_first_name, edited_user_id, is_open_source_content, skill_credential, group_user_first_name, platform_version_number, visited_profile_user_id, group_user_id, card_subtype, suspended_user_id, quiz_question_id, team_id, course_event_id, assigned_to_user_id, card_duration, group_user_email, user_email, course_event_end_date, channel_follower_user_handle, user_exclude_from_leaderboard, last_registration_date, scorm_attempts, channel_follower_user_organization_role, shared_to_user_organization_role, user_onboarding_status, channel_carousel_id, card_author_organization_role, time_string, user_created_at, follower_user_handle, card_author_last_name, created_user_id, registration_limit, user_last_sign_in_at, card_resource_url, quiz_reanswerable, analytics_version, card_hidden, card_slug, scorm_score, followed_user_email, followed_user_id, occupation_category, is_ecl_enabled, completion_type, user_status, event_time, referer, collaborator_user_organization_role, channel_id, is_channel_featured, card_is_public, user_handle, minute, curator_user_email, end_date, card_rating, card_level, card_author_handle, registration_type, old_val, job_role, group_user_organization_role, follower_user_last_name, attributes, user_onboarding_current_step, comment_type, request_id, time, grading_system, channel_card_user_id, group_user_last_name, card_is_paid, user_last_name, curator_id, journey_id, ecl_id, org_id_s, follower_user_organization_role, skill_id, card_created_at, is_user_generated, follower_id, ecl_source_id, card_author_email, followed_user_handle, topic_id, training_registration_state, is_channel_carousel_enabled, collaborator_user_last_name, comment_message, topic_name, followed_user_organization_role, shared_to_user_email, assigned_to_user_first_name, scorm_registration_completion, user_agent, course_event_start_date, channel_description, course_event_language, team_name, quiz_option_label, badge_id, grade_range, curator_user_first_name, badge_type, channel_visible, is_admin_request, comment_id, card_source_name, channel_carousel_slug, channel_follower_user_email, channel_label, user_org_uid, scorm_course_id, shared_to_user_first_name, card_state, assigned_to_user_email, impersonator_id, card_author_first_name, domain_id, readable_card_type, card_bookmark_id, user_organization_role, event_recorder, topic_label, pathway_name, quiz_option_is_correct, deleted_user_id, card_author_id, project_card_submission, assigned_to_user_handle, collaborator_id, collaborator_user_email, channel_follower_user_last_name, project_card_submission_id, group_user_role, group_user_handle, time_zone, followed_user_last_name, user_role, user_onboarding_id, onboarding_status, manager_user_id, removed_role, quiz_option_id, card_message, user_first_name, quiz_attempt_id, event, scorm_user_id, added_role, channel_is_private, shared_to_user_handle, assigned_to_user_organization_role, job_family, assignment_due_at, poll_option_id, skill_category, curator_user_organization_role, badge_title, skill_name, scorm_registration_success, submitter_type, external_id, member_user_id, training_registration_id, collaborator_user_handle, is_card_promoted, journey_name, grader_type, skill_level_rated, curator_user_last_name, follower_user_first_name, is_live_stream, poll_option_label, card_id, card_type, quiz_question_attempt_id, user_sign_in_count, card_deleted_at, quiz_questions_passed_count, is_correct, followed_user_first_name, shared_to_user_id, title, quiz_passing_criteria, occupation_id, skill_level, is_channel_curated, sign_in_ip, channel_follower_id, user_name, platform, conferencing_tool, org_name, occupation_name, course_event_timezone, pathway_id, start_date, curator_user_handle, is_channel_public, user_id, quiz_id, controller_action, shared_to_user_last_name, collaborator_user_first_name, quiz_question_label, new_val, event_channel_id, CAST(NULL as STRING) as role, CAST(NULL as STRING)as actor_id, CAST(NULL as STRING) as owner_id, CAST(0 as INT64) as score_value, CAST(NULL as STRING) as original_event, CAST(0 as INT64) as time_spent, CAST(NULL as STRING) AS channel_name, CAST(NULL as STRING) as group_name,
  FROM
    {{get_db_source('channel_performance_reporting_i_v')}}
  UNION ALL
  SELECT
    domain_label, domain_name, average_rating, quiz_question_attempt_passed, upload_mode, standard_type, scorm_total_seconds_tracked, follower_user_email, quiz_attempt_passed, assigned_to_user_last_name, org_hostname, channel_carousel_display_name, record_insert_time, skill_description, channel_carousel_creator_id, changed_column, course_event_location, duration, is_system_generated, channel_follower_user_first_name, edited_user_id, is_open_source_content, skill_credential, group_user_first_name, platform_version_number, visited_profile_user_id, group_user_id, card_subtype, suspended_user_id, quiz_question_id, team_id, course_event_id, assigned_to_user_id, card_duration, group_user_email, user_email, course_event_end_date, channel_follower_user_handle, user_exclude_from_leaderboard, last_registration_date, scorm_attempts, channel_follower_user_organization_role, shared_to_user_organization_role, user_onboarding_status, channel_carousel_id, card_author_organization_role, time_string, user_created_at, follower_user_handle, card_author_last_name, created_user_id, registration_limit, user_last_sign_in_at, card_resource_url, quiz_reanswerable, analytics_version, card_hidden, card_slug, scorm_score, followed_user_email, followed_user_id, occupation_category, is_ecl_enabled, completion_type, user_status, event_time, referer, collaborator_user_organization_role, channel_id, is_channel_featured, card_is_public, user_handle, minute, curator_user_email, end_date, card_rating, card_level, card_author_handle, registration_type, old_val, job_role, group_user_organization_role, follower_user_last_name, attributes, user_onboarding_current_step, comment_type, request_id, time, grading_system, channel_card_user_id, group_user_last_name, card_is_paid, user_last_name, curator_id, journey_id, ecl_id, org_id_s, follower_user_organization_role, skill_id, card_created_at, is_user_generated, follower_id, ecl_source_id, card_author_email, followed_user_handle, topic_id, training_registration_state, is_channel_carousel_enabled, collaborator_user_last_name, comment_message, topic_name, followed_user_organization_role, shared_to_user_email, assigned_to_user_first_name, scorm_registration_completion, user_agent, course_event_start_date, channel_description, course_event_language, team_name, quiz_option_label, badge_id, grade_range, curator_user_first_name, badge_type, channel_visible, is_admin_request, comment_id, card_source_name, channel_carousel_slug, channel_follower_user_email, channel_label, user_org_uid, scorm_course_id, shared_to_user_first_name, card_state, assigned_to_user_email, impersonator_id, card_author_first_name, domain_id, readable_card_type, card_bookmark_id, user_organization_role, event_recorder, topic_label, pathway_name, quiz_option_is_correct, deleted_user_id, card_author_id, project_card_submission, assigned_to_user_handle, collaborator_id, collaborator_user_email, channel_follower_user_last_name, project_card_submission_id, group_user_role, group_user_handle, time_zone, followed_user_last_name, user_role, user_onboarding_id, onboarding_status, manager_user_id, removed_role, quiz_option_id, card_message, user_first_name, quiz_attempt_id, event, scorm_user_id, added_role, channel_is_private, shared_to_user_handle, assigned_to_user_organization_role, job_family, assignment_due_at, poll_option_id, skill_category, curator_user_organization_role, badge_title, skill_name, scorm_registration_success, submitter_type, external_id, member_user_id, training_registration_id, collaborator_user_handle, is_card_promoted, journey_name, grader_type, skill_level_rated, curator_user_last_name, follower_user_first_name, is_live_stream, poll_option_label, card_id, card_type, quiz_question_attempt_id, user_sign_in_count, card_deleted_at, quiz_questions_passed_count, is_correct, followed_user_first_name, shared_to_user_id, title, quiz_passing_criteria, occupation_id, skill_level, is_channel_curated, sign_in_ip, channel_follower_id, user_name, platform, conferencing_tool, org_name, occupation_name, course_event_timezone, pathway_id, start_date, curator_user_handle, is_channel_public, user_id, quiz_id, controller_action, shared_to_user_last_name, collaborator_user_first_name, quiz_question_label, new_val, CAST(NULL as INT64) as event_channel_id, CAST(NULL as STRING) as role, CAST(NULL as STRING) as actor_id, CAST(NULL as STRING) as owner_id, CAST(NULL as INT64) as score_value, CAST(NULL as STRING) as original_event, CAST(NULL as INT64) as time_spent, CAST(NULL as STRING) as channel_name, CAST(NULL as STRING) as group_name
           
  FROM
    {{get_db_source('invalid_user_card_performance_reporting_i_v')}}
  WHERE
    event LIKE "channel%")
  Group by 
event_time, card_id, card_author_id, card_created_at, event, user_id, platform, shared_to_user_id, group_user_id, is_user_generated, comment_id, follower_id, followed_user_id, team_id, team_name, event_channel_id, shared_to_user_first_name, shared_to_user_last_name, shared_to_user_handle, shared_to_user_organization_role, shared_to_user_email, group_user_first_name, group_user_last_name, group_user_handle, group_user_organization_role, group_user_email, user_last_sign_in_at, user_first_name, user_last_name, user_name, user_handle, user_organization_role, card_author_first_name, card_author_last_name, card_author_handle, card_author_organization_role, card_author_email, followed_user_first_name, followed_user_last_name, followed_user_handle, followed_user_organization_role, followed_user_email, follower_user_first_name, follower_user_last_name, follower_user_handle, follower_user_organization_role, follower_user_email, duration, title, card_message, card_type, card_level, card_state, card_source_name, comment_message, comment_type, assigned_to_user_id, assigned_to_user_first_name, assigned_to_user_last_name, assigned_to_user_email, assigned_to_user_handle, assigned_to_user_organization_role, channel_follower_id, channel_follower_user_first_name, channel_follower_user_last_name, channel_follower_user_email, channel_follower_user_handle, channel_follower_user_organization_role, curator_id, curator_user_first_name, curator_user_last_name, curator_user_email, curator_user_handle, curator_user_organization_role, collaborator_id, collaborator_user_first_name, collaborator_user_last_name, collaborator_user_email, collaborator_user_handle, collaborator_user_organization_role, channel_id, channel_label, channel_description, channel_is_private, channel_visible, org_id_s, user_email, topic_id, topic_label, topic_name, pathway_id, pathway_name, journey_id, journey_name, poll_option_id, poll_option_label, quiz_option_id, quiz_option_label, is_correct, user_agent, is_channel_curated, is_ecl_enabled

  ) AS channel_perf_reporting
JOIN
  {{ ref('u1_users_latest_metadata_vw') }} AS u1_latest_metadata_vw
ON
  channel_perf_reporting.user_id = u1_latest_metadata_vw.user_id