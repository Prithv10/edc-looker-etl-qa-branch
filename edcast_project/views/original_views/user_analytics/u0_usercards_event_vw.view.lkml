# The name of this view in Looker is "U0 Usercards Event Vw"
view: u0_usercards_event_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `{{_user_attributes['database']}}.u0_usercards_event_vw`

    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Added Role" in Explore.

  dimension: added_role {
    type: string
    sql: ${TABLE}.added_role ;;
  }

  dimension: analytics_version {
    type: string
    sql: ${TABLE}.analytics_version ;;
  }

  dimension: assigned_to_user_email {
    type: string
    sql: ${TABLE}.assigned_to_user_email ;;
  }

  dimension: assigned_to_user_first_name {
    type: string
    sql: ${TABLE}.assigned_to_user_first_name ;;
  }

  dimension: assigned_to_user_handle {
    type: string
    sql: ${TABLE}.assigned_to_user_handle ;;
  }

  dimension: assigned_to_user_id {
    type: number
    sql: ${TABLE}.assigned_to_user_id ;;
  }

  dimension: assigned_to_user_last_name {
    type: string
    sql: ${TABLE}.assigned_to_user_last_name ;;
  }

  dimension: assigned_to_user_organization_role {
    type: string
    sql: ${TABLE}.assigned_to_user_organization_role ;;
  }

  dimension: attributes {
    type: string
    sql: ${TABLE}.attributes ;;
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
  }

  dimension: badge_id {
    type: string
    sql: ${TABLE}.badge_id ;;
  }

  dimension: badge_title {
    type: string
    sql: ${TABLE}.badge_title ;;
  }

  dimension: badge_type {
    type: string
    sql: ${TABLE}.badge_type ;;
  }

  dimension: card_author_email {
    type: string
    sql: ${TABLE}.card_author_email ;;
  }

  dimension: card_author_first_name {
    type: string
    sql: ${TABLE}.card_author_first_name ;;
  }

  dimension: card_author_handle {
    type: string
    sql: ${TABLE}.card_author_handle ;;
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
  }

  dimension: card_author_last_name {
    type: string
    sql: ${TABLE}.card_author_last_name ;;
  }

  dimension: card_author_organization_role {
    type: string
    sql: ${TABLE}.card_author_organization_role ;;
  }

  dimension: card_bookmark_id {
    type: string
    sql: ${TABLE}.card_bookmark_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: card_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.card_created_at ;;
  }

  dimension_group: card_deleted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.card_deleted_at ;;
  }

  dimension: card_duration {
    type: number
    sql: ${TABLE}.card_duration ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_card_duration {
    type: sum
    sql: ${card_duration} ;;
  }

  measure: average_card_duration {
    type: average
    sql: ${card_duration} ;;
  }

  dimension: card_hidden {
    type: yesno
    sql: ${TABLE}.card_hidden ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_is_paid {
    type: yesno
    sql: ${TABLE}.card_is_paid ;;
  }

  dimension: card_is_public {
    type: yesno
    sql: ${TABLE}.card_is_public ;;
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
  }

  dimension: card_message {
    type: string
    sql: ${TABLE}.card_message ;;
  }

  dimension: card_rating {
    type: number
    sql: ${TABLE}.card_rating ;;
  }

  dimension: card_resource_url {
    type: string
    sql: ${TABLE}.card_resource_url ;;
  }

  dimension: card_slug {
    type: string
    sql: ${TABLE}.card_slug ;;
  }

  dimension: card_source_name {
    type: string
    sql: ${TABLE}.card_source_name ;;
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.card_subtype ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

  dimension: changed_column {
    type: string
    sql: ${TABLE}.changed_column ;;
  }

  dimension: channel_card_user_id {
    type: string
    sql: ${TABLE}.channel_card_user_id ;;
  }

  dimension: channel_carousel_creator_id {
    type: number
    sql: ${TABLE}.channel_carousel_creator_id ;;
  }

  dimension: channel_carousel_display_name {
    type: string
    sql: ${TABLE}.channel_carousel_display_name ;;
  }

  dimension: channel_carousel_id {
    type: number
    sql: ${TABLE}.channel_carousel_id ;;
  }

  dimension: channel_carousel_slug {
    type: string
    sql: ${TABLE}.channel_carousel_slug ;;
  }

  dimension: channel_description {
    type: string
    sql: ${TABLE}.channel_description ;;
  }

  dimension: channel_follower_id {
    type: number
    sql: ${TABLE}.channel_follower_id ;;
  }

  dimension: channel_follower_user_email {
    type: string
    sql: ${TABLE}.channel_follower_user_email ;;
  }

  dimension: channel_follower_user_first_name {
    type: string
    sql: ${TABLE}.channel_follower_user_first_name ;;
  }

  dimension: channel_follower_user_handle {
    type: string
    sql: ${TABLE}.channel_follower_user_handle ;;
  }

  dimension: channel_follower_user_last_name {
    type: string
    sql: ${TABLE}.channel_follower_user_last_name ;;
  }

  dimension: channel_follower_user_organization_role {
    type: string
    sql: ${TABLE}.channel_follower_user_organization_role ;;
  }

  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: channel_is_private {
    type: yesno
    sql: ${TABLE}.channel_is_private ;;
  }

  dimension: channel_label {
    type: string
    sql: ${TABLE}.channel_label ;;
  }

  dimension: channel_visible {
    type: yesno
    sql: ${TABLE}.channel_visible ;;
  }

  dimension: collaborator_id {
    type: number
    sql: ${TABLE}.collaborator_id ;;
  }

  dimension: collaborator_user_email {
    type: string
    sql: ${TABLE}.collaborator_user_email ;;
  }

  dimension: collaborator_user_first_name {
    type: string
    sql: ${TABLE}.collaborator_user_first_name ;;
  }

  dimension: collaborator_user_handle {
    type: string
    sql: ${TABLE}.collaborator_user_handle ;;
  }

  dimension: collaborator_user_last_name {
    type: string
    sql: ${TABLE}.collaborator_user_last_name ;;
  }

  dimension: collaborator_user_organization_role {
    type: string
    sql: ${TABLE}.collaborator_user_organization_role ;;
  }

  dimension: comment_id {
    type: number
    sql: ${TABLE}.comment_id ;;
  }

  dimension: comment_message {
    type: string
    sql: ${TABLE}.comment_message ;;
  }

  dimension: comment_type {
    type: string
    sql: ${TABLE}.comment_type ;;
  }

  dimension: completion_type {
    type: string
    sql: ${TABLE}.completion_type ;;
  }

  dimension: conferencing_tool {
    type: string
    sql: ${TABLE}.conferencing_tool ;;
  }

  dimension: controller_action {
    type: string
    sql: ${TABLE}.controller_action ;;
  }

  dimension_group: course_event_end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.course_event_end_date ;;
  }

  dimension: course_event_id {
    type: string
    sql: ${TABLE}.course_event_id ;;
  }

  dimension: course_event_language {
    type: string
    sql: ${TABLE}.course_event_language ;;
  }

  dimension: course_event_location {
    type: string
    sql: ${TABLE}.course_event_location ;;
  }

  dimension_group: course_event_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.course_event_start_date ;;
  }

  dimension: course_event_timezone {
    type: string
    sql: ${TABLE}.course_event_timezone ;;
  }

  dimension: created_user_id {
    type: number
    sql: ${TABLE}.created_user_id ;;
  }

  dimension: curator_id {
    type: number
    sql: ${TABLE}.curator_id ;;
  }

  dimension: curator_user_email {
    type: string
    sql: ${TABLE}.curator_user_email ;;
  }

  dimension: curator_user_first_name {
    type: string
    sql: ${TABLE}.curator_user_first_name ;;
  }

  dimension: curator_user_handle {
    type: string
    sql: ${TABLE}.curator_user_handle ;;
  }

  dimension: curator_user_last_name {
    type: string
    sql: ${TABLE}.curator_user_last_name ;;
  }

  dimension: curator_user_organization_role {
    type: string
    sql: ${TABLE}.curator_user_organization_role ;;
  }

  dimension: deleted_user_id {
    type: number
    sql: ${TABLE}.deleted_user_id ;;
  }

  dimension: domain_id {
    type: string
    sql: ${TABLE}.domain_id ;;
  }

  dimension: domain_label {
    type: string
    sql: ${TABLE}.domain_label ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domain_name ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}.duration ;;
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
  }

  dimension: ecl_source_id {
    type: string
    sql: ${TABLE}.ecl_source_id ;;
  }

  dimension: edited_user_id {
    type: number
    sql: ${TABLE}.edited_user_id ;;
  }

  dimension_group: end_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: etl_record_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.etl_record_created_time ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_recorder {
    type: string
    sql: ${TABLE}.event_recorder ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: followed_user_email {
    type: string
    sql: ${TABLE}.followed_user_email ;;
  }

  dimension: followed_user_first_name {
    type: string
    sql: ${TABLE}.followed_user_first_name ;;
  }

  dimension: followed_user_handle {
    type: string
    sql: ${TABLE}.followed_user_handle ;;
  }

  dimension: followed_user_id {
    type: number
    sql: ${TABLE}.followed_user_id ;;
  }

  dimension: followed_user_last_name {
    type: string
    sql: ${TABLE}.followed_user_last_name ;;
  }

  dimension: followed_user_organization_role {
    type: string
    sql: ${TABLE}.followed_user_organization_role ;;
  }

  dimension: follower_id {
    type: number
    sql: ${TABLE}.follower_id ;;
  }

  dimension: follower_user_email {
    type: string
    sql: ${TABLE}.follower_user_email ;;
  }

  dimension: follower_user_first_name {
    type: string
    sql: ${TABLE}.follower_user_first_name ;;
  }

  dimension: follower_user_handle {
    type: string
    sql: ${TABLE}.follower_user_handle ;;
  }

  dimension: follower_user_last_name {
    type: string
    sql: ${TABLE}.follower_user_last_name ;;
  }

  dimension: follower_user_organization_role {
    type: string
    sql: ${TABLE}.follower_user_organization_role ;;
  }

  dimension: grade_range {
    type: string
    sql: ${TABLE}.grade_range ;;
  }

  dimension: grader_type {
    type: string
    sql: ${TABLE}.grader_type ;;
  }

  dimension: grading_system {
    type: string
    sql: ${TABLE}.grading_system ;;
  }

  dimension: group_user_email {
    type: string
    sql: ${TABLE}.group_user_email ;;
  }

  dimension: group_user_first_name {
    type: string
    sql: ${TABLE}.group_user_first_name ;;
  }

  dimension: group_user_handle {
    type: string
    sql: ${TABLE}.group_user_handle ;;
  }

  dimension: group_user_id {
    type: number
    sql: ${TABLE}.group_user_id ;;
  }

  dimension: group_user_last_name {
    type: string
    sql: ${TABLE}.group_user_last_name ;;
  }

  dimension: group_user_organization_role {
    type: string
    sql: ${TABLE}.group_user_organization_role ;;
  }

  dimension: group_user_role {
    type: string
    sql: ${TABLE}.group_user_role ;;
  }

  dimension: impersonator_id {
    type: string
    sql: ${TABLE}.impersonator_id ;;
  }

  dimension: is_admin_request {
    type: string
    sql: ${TABLE}.is_admin_request ;;
  }

  dimension: is_card_promoted {
    type: string
    sql: ${TABLE}.is_card_promoted ;;
  }

  dimension: is_channel_carousel_enabled {
    type: string
    sql: ${TABLE}.is_channel_carousel_enabled ;;
  }

  dimension: is_channel_curated {
    type: string
    sql: ${TABLE}.is_channel_curated ;;
  }

  dimension: is_channel_featured {
    type: string
    sql: ${TABLE}.is_channel_featured ;;
  }

  dimension: is_channel_public {
    type: string
    sql: ${TABLE}.is_channel_public ;;
  }

  dimension: is_correct {
    type: string
    sql: ${TABLE}.is_correct ;;
  }

  dimension: is_ecl_enabled {
    type: string
    sql: ${TABLE}.is_ecl_enabled ;;
  }

  dimension: is_live_stream {
    type: string
    sql: ${TABLE}.is_live_stream ;;
  }

  dimension: is_open_source_content {
    type: string
    sql: ${TABLE}.is_open_source_content ;;
  }

  dimension: is_system_generated {
    type: string
    sql: ${TABLE}.is_system_generated ;;
  }

  dimension: is_user_generated {
    type: number
    sql: ${TABLE}.is_user_generated ;;
  }

  dimension: job_family {
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_role {
    type: string
    sql: ${TABLE}.job_role ;;
  }

  dimension: journey_id {
    type: string
    sql: ${TABLE}.journey_id ;;
  }

  dimension: journey_name {
    type: string
    sql: ${TABLE}.journey_name ;;
  }

  dimension_group: last_registration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_registration_date ;;
  }

  dimension: manager_user_id {
    type: number
    sql: ${TABLE}.manager_user_id ;;
  }

  dimension: member_user_id {
    type: number
    sql: ${TABLE}.member_user_id ;;
  }

  dimension: new_val {
    type: string
    sql: ${TABLE}.new_val ;;
  }

  dimension: occupation_category {
    type: string
    sql: ${TABLE}.occupation_category ;;
  }

  dimension: occupation_id {
    type: string
    sql: ${TABLE}.occupation_id ;;
  }

  dimension: occupation_name {
    type: string
    sql: ${TABLE}.occupation_name ;;
  }

  dimension: old_val {
    type: string
    sql: ${TABLE}.old_val ;;
  }

  dimension: onboarding_status {
    type: string
    sql: ${TABLE}.onboarding_status ;;
  }

  dimension: org_hostname {
    type: string
    sql: ${TABLE}.org_hostname ;;
  }

  dimension: org_id_s {
    type: number
    value_format_name: id
    sql: ${TABLE}.org_id_s ;;
  }

  dimension: org_name {
    type: string
    sql: ${TABLE}.org_name ;;
  }

  dimension: pathway_id {
    type: string
    sql: ${TABLE}.pathway_id ;;
  }

  dimension: pathway_name {
    type: string
    sql: ${TABLE}.pathway_name ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: platform_version_number {
    type: string
    sql: ${TABLE}.platform_version_number ;;
  }

  dimension: poll_option_id {
    type: number
    sql: ${TABLE}.poll_option_id ;;
  }

  dimension: poll_option_label {
    type: string
    sql: ${TABLE}.poll_option_label ;;
  }

  dimension: project_card_submission {
    type: string
    sql: ${TABLE}.project_card_submission ;;
  }

  dimension: project_card_submission_id {
    type: string
    sql: ${TABLE}.project_card_submission_id ;;
  }

  dimension: quiz_attempt_id {
    type: string
    sql: ${TABLE}.quiz_attempt_id ;;
  }

  dimension: quiz_attempt_passed {
    type: string
    sql: ${TABLE}.quiz_attempt_passed ;;
  }

  dimension: quiz_id {
    type: string
    sql: ${TABLE}.quiz_id ;;
  }

  dimension: quiz_option_id {
    type: string
    sql: ${TABLE}.quiz_option_id ;;
  }

  dimension: quiz_option_is_correct {
    type: string
    sql: ${TABLE}.quiz_option_is_correct ;;
  }

  dimension: quiz_option_label {
    type: string
    sql: ${TABLE}.quiz_option_label ;;
  }

  dimension: quiz_passing_criteria {
    type: string
    sql: ${TABLE}.quiz_passing_criteria ;;
  }

  dimension: quiz_question_attempt_id {
    type: string
    sql: ${TABLE}.quiz_question_attempt_id ;;
  }

  dimension: quiz_question_attempt_passed {
    type: string
    sql: ${TABLE}.quiz_question_attempt_passed ;;
  }

  dimension: quiz_question_id {
    type: string
    sql: ${TABLE}.quiz_question_id ;;
  }

  dimension: quiz_question_label {
    type: string
    sql: ${TABLE}.quiz_question_label ;;
  }

  dimension: quiz_questions_passed_count {
    type: string
    sql: ${TABLE}.quiz_questions_passed_count ;;
  }

  dimension: quiz_reanswerable {
    type: string
    sql: ${TABLE}.quiz_reanswerable ;;
  }

  dimension: readable_card_type {
    type: number
    sql: ${TABLE}.readable_card_type ;;
  }

  dimension: record_insert_time {
    type: string
    sql: ${TABLE}.record_insert_time ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: registration_limit {
    type: number
    sql: ${TABLE}.registration_limit ;;
  }

  dimension: registration_type {
    type: string
    sql: ${TABLE}.registration_type ;;
  }

  dimension: removed_role {
    type: string
    sql: ${TABLE}.removed_role ;;
  }

  dimension: request_id {
    type: string
    sql: ${TABLE}.request_id ;;
  }

  dimension: scorm_attempts {
    type: string
    sql: ${TABLE}.scorm_attempts ;;
  }

  dimension: scorm_course_id {
    type: string
    sql: ${TABLE}.scorm_course_id ;;
  }

  dimension: scorm_registration_completion {
    type: string
    sql: ${TABLE}.scorm_registration_completion ;;
  }

  dimension: scorm_registration_success {
    type: string
    sql: ${TABLE}.scorm_registration_success ;;
  }

  dimension: scorm_score {
    type: number
    sql: ${TABLE}.scorm_score ;;
  }

  dimension: scorm_total_seconds_tracked {
    type: number
    sql: ${TABLE}.scorm_total_seconds_tracked ;;
  }

  dimension: scorm_user_id {
    type: number
    sql: ${TABLE}.scorm_user_id ;;
  }

  dimension: shared_to_user_email {
    type: string
    sql: ${TABLE}.shared_to_user_email ;;
  }

  dimension: shared_to_user_first_name {
    type: string
    sql: ${TABLE}.shared_to_user_first_name ;;
  }

  dimension: shared_to_user_handle {
    type: string
    sql: ${TABLE}.shared_to_user_handle ;;
  }

  dimension: shared_to_user_id {
    type: number
    sql: ${TABLE}.shared_to_user_id ;;
  }

  dimension: shared_to_user_last_name {
    type: string
    sql: ${TABLE}.shared_to_user_last_name ;;
  }

  dimension: shared_to_user_organization_role {
    type: string
    sql: ${TABLE}.shared_to_user_organization_role ;;
  }

  dimension: sign_in_ip {
    type: string
    sql: ${TABLE}.sign_in_ip ;;
  }

  dimension: skill_category {
    type: string
    sql: ${TABLE}.skill_category ;;
  }

  dimension: skill_credential {
    type: string
    sql: ${TABLE}.skill_credential ;;
  }

  dimension: skill_description {
    type: string
    sql: ${TABLE}.skill_description ;;
  }

  dimension: skill_id {
    type: string
    sql: ${TABLE}.skill_id ;;
  }

  dimension: skill_level {
    type: string
    sql: ${TABLE}.skill_level ;;
  }

  dimension: skill_level_rated {
    type: string
    sql: ${TABLE}.skill_level_rated ;;
  }

  dimension: skill_name {
    type: string
    sql: ${TABLE}.skill_name ;;
  }

  dimension: standard_type {
    type: string
    sql: ${TABLE}.standard_type ;;
  }

  dimension_group: start_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: submitter_type {
    type: string
    sql: ${TABLE}.submitter_type ;;
  }

  dimension: suspended_user_id {
    type: number
    sql: ${TABLE}.suspended_user_id ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.team_name ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Time ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: topic_id {
    type: string
    sql: ${TABLE}.topic_id ;;
  }

  dimension: topic_label {
    type: string
    sql: ${TABLE}.topic_label ;;
  }

  dimension: topic_name {
    type: string
    sql: ${TABLE}.topic_name ;;
  }

  dimension: training_registration_id {
    type: string
    sql: ${TABLE}.training_registration_id ;;
  }

  dimension: training_registration_state {
    type: string
    sql: ${TABLE}.training_registration_state ;;
  }

  dimension: upload_mode {
    type: string
    sql: ${TABLE}.upload_mode ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension_group: user_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.user_created_at ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

  dimension: user_exclude_from_leaderboard {
    type: yesno
    sql: ${TABLE}.user_exclude_from_leaderboard ;;
  }

  dimension: user_first_name {
    type: string
    sql: ${TABLE}.user_first_name ;;
  }

  dimension: user_handle {
    type: string
    sql: ${TABLE}.user_handle ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_last_name {
    type: string
    sql: ${TABLE}.user_last_name ;;
  }

  dimension: user_last_sign_in_at {
    type: string
    sql: ${TABLE}.user_last_sign_in_at ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: user_onboarding_current_step {
    type: string
    sql: ${TABLE}.user_onboarding_current_step ;;
  }

  dimension: user_onboarding_id {
    type: string
    sql: ${TABLE}.user_onboarding_id ;;
  }

  dimension: user_onboarding_status {
    type: string
    sql: ${TABLE}.user_onboarding_status ;;
  }

  dimension: user_org_uid {
    type: string
    sql: ${TABLE}.user_org_uid ;;
  }

  dimension: user_organization_role {
    type: string
    sql: ${TABLE}.user_organization_role ;;
  }

  dimension: user_role {
    type: string
    sql: ${TABLE}.user_role ;;
  }

  dimension: user_sign_in_count {
    type: number
    sql: ${TABLE}.user_sign_in_count ;;
  }

  dimension: user_status {
    type: string
    sql: ${TABLE}.user_status ;;
  }

  dimension: visited_profile_user_id {
    type: string
    sql: ${TABLE}.visited_profile_user_id ;;
  }

#******************************************************************************************************
#created the measure for concatenation
  measure: concat_user_id_card_id {
    type: count_distinct
    sql: concat(${TABLE}.user_id,${TABLE}.card_id) ;;
    drill_fields: [detail*]
  }

  measure: concat_user_id_badge_id {
    type: count_distinct
    sql: concat(${TABLE}.user_id,${TABLE}.badge_id) ;;
    drill_fields: [detail*]
  }

  measure: running_concat_user_id_badge_id {
    type: running_total
    sql: ${concat_user_id_badge_id} ;;
    drill_fields: [detail*]
  }

  measure: count_of_card_ids {
    type: number
    sql: count(${TABLE}.card_id) ;;
    drill_fields: [detail*]
  }

  # measure: concat_user_id_badge_id {
  #   type: count_distinct
  #   sql: concat(${TABLE}.user_id,${TABLE}.badge_id) ;;
  # }

  # measure: count_of_card_ids {
  #   type: number
  #   sql: count(${TABLE}.card_id) ;;
  # }
measure: count_distinct_user_ids {
  type: count_distinct
  sql: ${TABLE}.user_id ;;
  drill_fields: [detail*]
}

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_user_ids {
    type: number
    sql: count(${TABLE}.user_id) ;;
    drill_fields: [detail*]
  }

  measure: count_event {
    type: number
    sql: count(${TABLE}.event) ;;
    drill_fields: [detail*]
  }

  measure: avg_rating {
    type: average
    sql: ${TABLE}.average_rating ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      occupation_name,
      followed_user_first_name,
      followed_user_last_name,
      etl_record_created_time,
      shared_to_user_last_name,
      user_last_name,
      user_name,
      user_first_name,
      group_user_last_name,
      follower_user_last_name,
      skill_name,
      team_name,
      channel_carousel_display_name,
      card_source_name,
      curator_user_first_name,
      channel_follower_user_last_name,
      assigned_to_user_last_name,
      domain_name,
      curator_user_last_name,
      collaborator_user_first_name,
      assigned_to_user_first_name,
      pathway_name,
      follower_user_first_name,
      shared_to_user_first_name,
      card_author_first_name,
      org_name,
      collaborator_user_last_name,
      channel_follower_user_first_name,
      group_user_first_name,
      topic_name,
      org_hostname,
      journey_name,
      card_author_last_name
    ]
  }
}
