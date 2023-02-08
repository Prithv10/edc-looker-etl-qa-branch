# The name of this view in Looker is "Ch0 Channel Core Event Vw"
view: ch0_channel_core_event_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aws-us-east-1-prod-01.edc_prod_analytics_customer_1903.ch0_channel_core_event_vw`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assigned to User Email" in Explore.

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

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
  }

  dimension: card_message {
    type: string
    sql: ${TABLE}.card_message ;;
  }

  dimension: card_source_name {
    type: string
    sql: ${TABLE}.card_source_name ;;
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
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

  dimension: duration {
    type: string
    sql: ${TABLE}.duration ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_channel_id {
    type: number
    sql: ${TABLE}.event_channel_id ;;
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

  dimension: is_channel_curated {
    type: string
    sql: ${TABLE}.is_channel_curated ;;
  }

  dimension: is_correct {
    type: string
    sql: ${TABLE}.is_correct ;;
  }

  dimension: is_ecl_enabled {
    type: string
    sql: ${TABLE}.is_ecl_enabled ;;
  }

  dimension: is_user_generated {
    type: number
    sql: ${TABLE}.is_user_generated ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_is_user_generated {
    type: sum
    sql: ${is_user_generated} ;;
  }

  measure: average_is_user_generated {
    type: average
    sql: ${is_user_generated} ;;
  }

  dimension: journey_id {
    type: string
    sql: ${TABLE}.journey_id ;;
  }

  dimension: journey_name {
    type: string
    sql: ${TABLE}.journey_name ;;
  }

  dimension: org_id_s {
    type: number
    value_format_name: id
    sql: ${TABLE}.org_id_s ;;
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

  dimension: poll_option_id {
    type: number
    sql: ${TABLE}.poll_option_id ;;
  }

  dimension: poll_option_label {
    type: string
    sql: ${TABLE}.poll_option_label ;;
  }

  dimension: quiz_option_id {
    type: string
    sql: ${TABLE}.quiz_option_id ;;
  }

  dimension: quiz_option_label {
    type: string
    sql: ${TABLE}.quiz_option_label ;;
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

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
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

  dimension: user_organization_role {
    type: string
    sql: ${TABLE}.user_organization_role ;;
  }

measure: count_of_event {
  type: number
  sql: count(${event}) ;;
  drill_fields: [detail*]
}


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      assigned_to_user_last_name,
      followed_user_first_name,
      followed_user_last_name,
      curator_user_last_name,
      collaborator_user_first_name,
      assigned_to_user_first_name,
      shared_to_user_last_name,
      user_last_name,
      pathway_name,
      user_name,
      follower_user_first_name,
      shared_to_user_first_name,
      user_first_name,
      card_author_first_name,
      group_user_last_name,
      follower_user_last_name,
      collaborator_user_last_name,
      channel_follower_user_first_name,
      group_user_first_name,
      team_name,
      topic_name,
      card_source_name,
      journey_name,
      card_author_last_name,
      curator_user_first_name,
      channel_follower_user_last_name
    ]
  }
}
