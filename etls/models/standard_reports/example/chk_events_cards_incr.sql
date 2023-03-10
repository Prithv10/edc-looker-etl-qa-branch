{{ config(materialized='table', sort='Time', 
partition_by = {'field': 'day_p', 'data_type': 'timestamp'} ,
cluster_by = ["user_id", "event"]) }}

-- Dataflow Name : 1454_Glue_UserCards [U][0] [Core Event Data - Buffered]
-- View Name : chk_events_cards_incr

SELECT
  user_card_perf_reporting.* EXCEPT(Occurences)
FROM (
  SELECT
    event_time AS Time,
    DATE_TRUNC(event_time,DAY) as day_p,
    card_id,
    card_author_id,
    event,
    user_id,
    platform,
    shared_to_user_id,
    team_id,
    group_user_id,
    is_user_generated,
    comment_id,
    follower_id,
    followed_user_id,
    channel_id,
    assigned_to_user_id,
    collaborator_id,
    curator_id,
    channel_follower_id,
    topic_id,
    topic_label,
    topic_name,
    pathway_id,
    pathway_name,
    journey_id,
    journey_name,
    poll_option_id,
    poll_option_label,
    quiz_option_id,
    quiz_option_label,
    is_correct,
    group_user_role,
    card_subtype,
    card_resource_url,
    ecl_id,
    is_card_promoted,
    is_live_stream,
    card_duration,
    is_channel_curated,
    is_ecl_enabled,
    attributes,
    user_agent,
    created_user_id,
    suspended_user_id,
    badge_id,
    badge_type,
    badge_title,
    completion_type,
    conferencing_tool,
    grade_range,
    grader_type,
    grading_system,
    last_registration_date,
    project_card_submission,
    project_card_submission_id,
    referer,
    registration_limit,
    registration_type,
    request_id,
    submitter_type,
    training_registration_id,
    training_registration_state,
    quiz_attempt_id,
    quiz_attempt_passed,
    quiz_id,
    quiz_option_is_correct,
    quiz_passing_criteria,
    quiz_question_attempt_id,
    quiz_question_attempt_passed,
    quiz_question_id,
    quiz_question_label,
    quiz_questions_passed_count,
    quiz_reanswerable,
    is_system_generated,
    time_zone,
    start_date,
    end_date,
    event_recorder,
    is_admin_request,
    onboarding_status,
    org_hostname,
    platform_version_number,
    sign_in_ip,
    user_org_uid,
    user_role,
    domain_id,
    domain_label,
    domain_name,
    member_user_id,
    controller_action,
    visited_profile_user_id,
    upload_mode,
    user_onboarding_current_step,
    user_onboarding_id,
    user_onboarding_status,
    average_rating,
    card_bookmark_id,
    is_channel_featured,
    is_channel_public,
    org_name,
    changed_column,
    new_val,
    old_val,
    scorm_attempts,
    scorm_course_id,
    scorm_registration_completion,
    scorm_registration_success,
    scorm_score,
    scorm_total_seconds_tracked,
    scorm_user_id,
    skill_id,
    skill_name,
    job_family,
    job_role,
    skill_category,
    skill_level_rated,
    occupation_id,
    occupation_name,
    occupation_category,
    edited_user_id,
    is_open_source_content,
    external_id,
    channel_card_user_id,
    ecl_source_id,
    card_rating,
    skill_credential,
    skill_level,
    manager_user_id,
    removed_role,
    added_role,
    skill_description,
    channel_carousel_creator_id,
    is_channel_carousel_enabled,
    analytics_version channel_carousel_display_name,
    channel_carousel_id,
    channel_carousel_slug,
    impersonator_id,
    deleted_user_id,
    course_event_id,
    course_event_language,
    course_event_location,
    course_event_start_date,
    course_event_end_date,
    course_event_timezone,
    shared_to_user_first_name,
    shared_to_user_last_name,
    shared_to_user_email,
    shared_to_user_handle,
    shared_to_user_organization_role,
    assigned_to_user_first_name,
    assigned_to_user_last_name,
    assigned_to_user_email,
    assigned_to_user_handle,
    assigned_to_user_organization_role,
    group_user_first_name,
    group_user_last_name,
    group_user_email,
    group_user_handle,
    group_user_organization_role,
    user_first_name,
    user_last_name,
    user_organization_role,
    user_email,
    user_last_sign_in_at,
    user_handle,
    user_exclude_from_leaderboard,
    user_created_at,
    user_status,
    user_sign_in_count,
    user_name,
    card_author_first_name,
    card_author_last_name,
    card_author_email,
    card_author_handle,
    card_author_organization_role,
    followed_user_first_name,
    followed_user_last_name,
    followed_user_email,
    followed_user_handle,
    followed_user_organization_role,
    follower_user_first_name,
    follower_user_last_name,
    follower_user_email,
    follower_user_handle,
    follower_user_organization_role,
    collaborator_user_first_name,
    collaborator_user_last_name,
    collaborator_user_email,
    collaborator_user_handle,
    collaborator_user_organization_role,
    curator_user_first_name,
    curator_user_last_name,
    curator_user_email,
    curator_user_handle,
    curator_user_organization_role,
    channel_follower_user_first_name,
    channel_follower_user_last_name,
    channel_follower_user_email,
    channel_follower_user_handle,
    channel_follower_user_organization_role,
    duration,
    title,
    card_message,
    card_type,
    standard_type,
    card_level,
    card_source_name,
    card_created_at,
    card_state,
    card_deleted_at,
    card_is_paid,
    card_is_public,
    card_hidden,
    readable_card_type,
    card_slug,
    team_name,
    comment_message,
    comment_type,
    channel_label,
    channel_is_private,
    channel_visible,
    channel_description,
    org_id_s,
    record_insert_time,
    COUNT(event) AS Occurences
  FROM (
    SELECT
      event_time,
      time,
      analytics_version,
      card_id,
      card_author_id,
      event,
      user_id,
      (CASE
          WHEN `platform` = 'iPhone' THEN 'ios'
          WHEN `platform` IN ('ios',
          'android',
          'web')
        AND (LOWER(`user_agent`) LIKE '%msteam%'
          OR LOWER(`user_agent`) LIKE '%ms team%') THEN 'MS Teams'
        ELSE
        `platform`
      END
        ) AS platform,
      shared_to_user_id,
      team_id,
      group_user_id,
      is_user_generated,
      comment_id,
      follower_id,
      followed_user_id,
      channel_id,
      assigned_to_user_id,
      collaborator_id,
      curator_id,
      channel_follower_id,
      topic_id,
      topic_label,
      topic_name,
      pathway_id,
      pathway_name,
      journey_id,
      journey_name,
      poll_option_id,
      poll_option_label,
      quiz_option_id,
      quiz_option_label,
      is_correct,
      group_user_role,
      CAST(NULL AS STRING)AS actor_id,
      CAST(NULL AS STRING) AS owner_id,
      CAST(NULL AS STRING) AS role,
      CAST(0 AS INT64) AS score_value,
      CAST(NULL AS STRING) AS original_event,
      CAST(0 AS INT64) AS time_spent,
      card_subtype,
      card_resource_url,
      ecl_id,
      is_card_promoted,
      is_live_stream,
      card_duration,
      is_channel_curated,
      is_ecl_enabled,
      attributes,
      user_agent,
      created_user_id,
      suspended_user_id,
      badge_id,
      badge_type,
      badge_title,
      CAST(NULL AS STRING) AS channel_name,
      CAST(NULL AS STRING) AS group_name,
      completion_type,
      conferencing_tool,
      grade_range,
      grader_type,
      grading_system,
      last_registration_date,
      project_card_submission,
      project_card_submission_id,
      referer,
      registration_limit,
      registration_type,
      request_id,
      submitter_type,
      training_registration_id,
      training_registration_state,
      quiz_attempt_id,
      quiz_attempt_passed,
      quiz_id,
      quiz_option_is_correct,
      quiz_passing_criteria,
      quiz_question_attempt_id,
      quiz_question_attempt_passed,
      quiz_question_id,
      quiz_question_label,
      quiz_questions_passed_count,
      quiz_reanswerable,
      is_system_generated,
      time_zone,
      start_date,
      end_date,
      event_recorder,
      is_admin_request,
      onboarding_status,
      org_hostname,
      platform_version_number,
      sign_in_ip,
      user_org_uid,
      user_role,
      domain_id,
      domain_label,
      domain_name,
      member_user_id,
      controller_action,
      visited_profile_user_id,
      upload_mode,
      user_onboarding_current_step,
      user_onboarding_id,
      user_onboarding_status,
      average_rating,
      card_bookmark_id,
      is_channel_featured,
      is_channel_public,
      org_name,
      changed_column,
      new_val,
      old_val,
      scorm_attempts,
      scorm_course_id,
      scorm_registration_completion,
      scorm_registration_success,
      scorm_score,
      scorm_total_seconds_tracked,
      scorm_user_id,
      skill_id,
      skill_name,
      job_family,
      job_role,
      skill_category,
      skill_level_rated,
      occupation_id,
      occupation_name,
      occupation_category,
      edited_user_id,
      is_open_source_content,
      external_id,
      channel_card_user_id,
      ecl_source_id,
      card_rating,
      skill_credential,
      skill_level,
      manager_user_id,
      removed_role,
      added_role,
      skill_description,
      channel_carousel_creator_id,
      is_channel_carousel_enabled,
      channel_carousel_display_name,
      channel_carousel_id,
      channel_carousel_slug,
      impersonator_id,
      deleted_user_id,
      time_string,
      course_event_id,
      course_event_language,
      course_event_location,
      course_event_start_date,
      course_event_end_date,
      course_event_timezone,
      assignment_due_at,
      shared_to_user_first_name,
      shared_to_user_last_name,
      shared_to_user_email,
      shared_to_user_handle,
      shared_to_user_organization_role,
      assigned_to_user_first_name,
      assigned_to_user_last_name,
      assigned_to_user_email,
      assigned_to_user_handle,
      assigned_to_user_organization_role,
      group_user_first_name,
      group_user_last_name,
      group_user_email,
      group_user_handle,
      group_user_organization_role,
      user_first_name,
      user_last_name,
      user_organization_role,
      user_email,
      user_last_sign_in_at,
      user_handle,
      user_exclude_from_leaderboard,
      user_created_at,
      user_status,
      user_sign_in_count,
      user_name,
      card_author_first_name,
      card_author_last_name,
      card_author_email,
      card_author_handle,
      card_author_organization_role,
      followed_user_first_name,
      followed_user_last_name,
      followed_user_email,
      followed_user_handle,
      followed_user_organization_role,
      follower_user_first_name,
      follower_user_last_name,
      follower_user_email,
      follower_user_handle,
      follower_user_organization_role,
      collaborator_user_first_name,
      collaborator_user_last_name,
      collaborator_user_email,
      collaborator_user_handle,
      collaborator_user_organization_role,
      curator_user_first_name,
      curator_user_last_name,
      curator_user_email,
      curator_user_handle,
      curator_user_organization_role,
      channel_follower_user_first_name,
      channel_follower_user_last_name,
      channel_follower_user_email,
      channel_follower_user_handle,
      channel_follower_user_organization_role,
      duration,
      title,
      card_message,
      card_type,
      standard_type,
      card_level,
      card_source_name,
      card_created_at,
      card_state,
      card_deleted_at,
      card_is_paid,
      card_is_public,
      card_hidden,
      readable_card_type,
      card_slug,
      team_name,
      comment_message,
      comment_type,
      channel_label,
      channel_is_private,
      channel_visible,
      channel_description,
      org_id_s,
      minute,
      record_insert_time
    FROM
      {{get_db_source('user_card_performance_reporting_i_v')}}
    UNION ALL
    SELECT
      event_time,
      time,
      analytics_version,
      card_id,
      card_author_id,
      event,
      user_id,
      platform,
      shared_to_user_id,
      team_id,
      group_user_id,
      is_user_generated,
      comment_id,
      follower_id,
      followed_user_id,
      channel_id,
      assigned_to_user_id,
      collaborator_id,
      curator_id,
      channel_follower_id,
      topic_id,
      topic_label,
      topic_name,
      pathway_id,
      pathway_name,
      journey_id,
      journey_name,
      poll_option_id,
      poll_option_label,
      quiz_option_id,
      quiz_option_label,
      is_correct,
      group_user_role,
      actor_id,
      owner_id,
      role,
      score_value,
      original_event,
      time_spent,
      card_subtype,
      card_resource_url,
      ecl_id,
      is_card_promoted,
      is_live_stream,
      card_duration,
      is_channel_curated,
      is_ecl_enabled,
      attributes,
      user_agent,
      created_user_id,
      suspended_user_id,
      badge_id,
      badge_type,
      badge_title,
      channel_name,
      group_name,
      completion_type,
      conferencing_tool,
      grade_range,
      grader_type,
      grading_system,
      last_registration_date,
      project_card_submission,
      project_card_submission_id,
      referer,
      registration_limit,
      registration_type,
      request_id,
      submitter_type,
      training_registration_id,
      training_registration_state,
      quiz_attempt_id,
      quiz_attempt_passed,
      quiz_id,
      quiz_option_is_correct,
      quiz_passing_criteria,
      quiz_question_attempt_id,
      quiz_question_attempt_passed,
      quiz_question_id,
      quiz_question_label,
      quiz_questions_passed_count,
      quiz_reanswerable,
      is_system_generated,
      time_zone,
      start_date,
      end_date,
      event_recorder,
      is_admin_request,
      onboarding_status,
      org_hostname,
      platform_version_number,
      sign_in_ip,
      user_org_uid,
      user_role,
      domain_id,
      domain_label,
      domain_name,
      member_user_id,
      controller_action,
      visited_profile_user_id,
      upload_mode,
      user_onboarding_current_step,
      user_onboarding_id,
      user_onboarding_status,
      average_rating,
      card_bookmark_id,
      is_channel_featured,
      is_channel_public,
      org_name,
      changed_column,
      new_val,
      old_val,
      scorm_attempts,
      scorm_course_id,
      scorm_registration_completion,
      scorm_registration_success,
      scorm_score,
      scorm_total_seconds_tracked,
      scorm_user_id,
      skill_id,
      skill_name,
      job_family,
      job_role,
      skill_category,
      skill_level_rated,
      occupation_id,
      occupation_name,
      occupation_category,
      edited_user_id,
      is_open_source_content,
      external_id,
      channel_card_user_id,
      ecl_source_id,
      card_rating,
      skill_credential,
      skill_level,
      manager_user_id,
      removed_role,
      added_role,
      skill_description,
      channel_carousel_creator_id,
      is_channel_carousel_enabled,
      channel_carousel_display_name,
      channel_carousel_id,
      channel_carousel_slug,
      impersonator_id,
      deleted_user_id,
      time_string,
      course_event_id,
      course_event_language,
      course_event_location,
      course_event_start_date,
      course_event_end_date,
      course_event_timezone,
      assignment_due_at,
      shared_to_user_first_name,
      shared_to_user_last_name,
      shared_to_user_email,
      shared_to_user_handle,
      shared_to_user_organization_role,
      assigned_to_user_first_name,
      assigned_to_user_last_name,
      assigned_to_user_email,
      assigned_to_user_handle,
      assigned_to_user_organization_role,
      group_user_first_name,
      group_user_last_name,
      group_user_email,
      group_user_handle,
      group_user_organization_role,
      user_first_name,
      user_last_name,
      user_organization_role,
      user_email,
      user_last_sign_in_at,
      user_handle,
      user_exclude_from_leaderboard,
      user_created_at,
      user_status,
      user_sign_in_count,
      user_name,
      card_author_first_name,
      card_author_last_name,
      card_author_email,
      card_author_handle,
      card_author_organization_role,
      followed_user_first_name,
      followed_user_last_name,
      followed_user_email,
      followed_user_handle,
      followed_user_organization_role,
      follower_user_first_name,
      follower_user_last_name,
      follower_user_email,
      follower_user_handle,
      follower_user_organization_role,
      collaborator_user_first_name,
      collaborator_user_last_name,
      collaborator_user_email,
      collaborator_user_handle,
      collaborator_user_organization_role,
      curator_user_first_name,
      curator_user_last_name,
      curator_user_email,
      curator_user_handle,
      curator_user_organization_role,
      channel_follower_user_first_name,
      channel_follower_user_last_name,
      channel_follower_user_email,
      channel_follower_user_handle,
      channel_follower_user_organization_role,
      duration,
      title,
      card_message,
      card_type,
      standard_type,
      card_level,
      card_source_name,
      card_created_at,
      card_state,
      card_deleted_at,
      card_is_paid,
      card_is_public,
      card_hidden,
      readable_card_type,
      card_slug,
      team_name,
      comment_message,
      comment_type,
      channel_label,
      channel_is_private,
      channel_visible,
      channel_description,
      org_id_s,
      minute,
      record_insert_time
    FROM
      {{get_db_source('invalid_user_card_performance_reporting_i_v')}}
    WHERE
      event LIKE 'user%'
      OR event LIKE 'card%'
      OR event = 'channel_added_to_channel_carousel'
      OR event = 'channel_removed_from_channel_carousel' )
  GROUP BY
    event_time,
    time,
    analytics_version,
    card_id,
    card_author_id,
    event,
    user_id,
    platform,
    shared_to_user_id,
    team_id,
    group_user_id,
    is_user_generated,
    comment_id,
    follower_id,
    followed_user_id,
    channel_id,
    assigned_to_user_id,
    collaborator_id,
    curator_id,
    channel_follower_id,
    shared_to_user_first_name,
    shared_to_user_last_name,
    shared_to_user_email,
    shared_to_user_handle,
    shared_to_user_organization_role,
    assigned_to_user_first_name,
    assigned_to_user_last_name,
    assigned_to_user_email,
    assigned_to_user_handle,
    assigned_to_user_organization_role,
    group_user_first_name,
    group_user_last_name,
    group_user_email,
    group_user_handle,
    group_user_organization_role,
    user_first_name,
    user_last_name,
    user_organization_role,
    user_email,
    user_last_sign_in_at,
    user_handle,
    user_name,
    card_author_first_name,
    card_author_last_name,
    card_author_email,
    card_author_handle,
    card_author_organization_role,
    followed_user_first_name,
    followed_user_last_name,
    followed_user_email,
    followed_user_handle,
    followed_user_organization_role,
    follower_user_first_name,
    follower_user_last_name,
    follower_user_email,
    follower_user_handle,
    follower_user_organization_role,
    collaborator_user_first_name,
    collaborator_user_last_name,
    collaborator_user_email,
    collaborator_user_handle,
    collaborator_user_organization_role,
    curator_user_first_name,
    curator_user_last_name,
    curator_user_email,
    curator_user_handle,
    curator_user_organization_role,
    channel_follower_user_first_name,
    channel_follower_user_last_name,
    channel_follower_user_email,
    channel_follower_user_handle,
    channel_follower_user_organization_role,
    duration,
    title,
    card_message,
    card_type,
    standard_type,
    card_level,
    card_source_name,
    card_created_at,
    card_state,
    team_name,
    comment_message,
    comment_type,
    channel_label,
    channel_is_private,
    channel_visible,
    channel_description,
    org_id_s,
    record_insert_time,
    group_user_role,
    topic_id,
    topic_label,
    topic_name,
    pathway_id,
    pathway_name,
    journey_id,
    journey_name,
    poll_option_id,
    poll_option_label,
    quiz_option_id,
    quiz_option_label,
    is_correct,
    card_subtype,
    card_resource_url,
    ecl_id,
    is_card_promoted,
    is_live_stream,
    card_duration,
    attributes,
    user_agent,
    user_exclude_from_leaderboard,
    user_created_at,
    user_status,
    user_sign_in_count,
    card_deleted_at,
    card_is_paid,
    card_is_public,
    created_user_id,
    suspended_user_id,
    badge_id,
    badge_type,
    badge_title,
    completion_type,
    conferencing_tool,
    grade_range,
    grader_type,
    grading_system,
    last_registration_date,
    project_card_submission,
    project_card_submission_id,
    referer,
    registration_limit,
    registration_type,
    request_id,
    submitter_type,
    training_registration_id,
    training_registration_state,
    quiz_attempt_id,
    quiz_attempt_passed,
    quiz_id,
    quiz_option_is_correct,
    quiz_passing_criteria,
    quiz_question_attempt_id,
    quiz_question_attempt_passed,
    quiz_question_id,
    quiz_question_label,
    quiz_questions_passed_count,
    quiz_reanswerable,
    is_system_generated,
    time_zone,
    start_date,
    end_date,
    card_hidden,
    readable_card_type,
    card_slug,
    event_recorder,
    is_admin_request,
    onboarding_status,
    org_hostname,
    platform_version_number,
    sign_in_ip,
    user_org_uid,
    user_role,
    domain_id,
    domain_label,
    domain_name,
    member_user_id,
    controller_action,
    visited_profile_user_id,
    upload_mode,
    user_onboarding_current_step,
    user_onboarding_id,
    user_onboarding_status,
    average_rating,
    card_bookmark_id,
    is_channel_featured,
    is_channel_public,
    org_name,
    changed_column,
    new_val,
    old_val,
    scorm_attempts,
    scorm_course_id,
    scorm_registration_completion,
    scorm_registration_success,
    scorm_score,
    scorm_total_seconds_tracked,
    scorm_user_id,
    skill_id,
    skill_name,
    job_family,
    job_role,
    skill_category,
    skill_level_rated,
    occupation_id,
    occupation_name,
    occupation_category,
    is_channel_curated,
    is_ecl_enabled,
    edited_user_id,
    is_open_source_content,
    external_id,
    channel_card_user_id,
    ecl_source_id,
    card_rating,
    skill_credential,
    skill_level,
    manager_user_id,
    removed_role,
    added_role,
    skill_description,
    channel_carousel_creator_id,
    is_channel_carousel_enabled,
    channel_carousel_display_name,
    channel_carousel_id,
    channel_carousel_slug,
    impersonator_id,
    deleted_user_id,
    course_event_id,
    course_event_language,
    course_event_location,
    course_event_start_date,
    course_event_end_date,
    course_event_timezone ) AS user_card_perf_reporting
JOIN
  {{ ref('u1_users_latest_metadata_vw') }} AS u1_latest_metadata_vw
ON
  user_card_perf_reporting.user_id = u1_latest_metadata_vw.user_id
