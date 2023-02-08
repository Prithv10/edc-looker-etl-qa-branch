# The name of this view in Looker is "U1 Users Project Cards Vw"
view: u1_users_project_cards_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u1_users_project_cards_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.u1_users_project_cards_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average Rating" in Explore.

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
  }

  dimension: card_resource_url {
    type: number
    sql: ${TABLE}.card_resource_url ;;
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.card_subtype ;;
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

  dimension: changed_column {
    type: string
    sql: ${TABLE}.changed_column ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  dimension: current_content_owner_full_name {
    type: string
    sql: ${TABLE}.current_content_owner_full_name ;;
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: grade {
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: grade_range {
    type: string
    sql: ${TABLE}.grade_range ;;
  }

  dimension: grader_full_name {
    type: string
    sql: ${TABLE}.grader_full_name ;;
  }

  dimension: grader_id {
    type: number
    sql: ${TABLE}.grader_id ;;
  }

  dimension: grader_type {
    type: string
    sql: ${TABLE}.grader_type ;;
  }

  dimension: grading_system {
    type: string
    sql: ${TABLE}.grading_system ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

  dimension: old_value {
    type: string
    sql: ${TABLE}.old_value ;;
  }

  dimension: project_card_submission_id {
    type: string
    sql: ${TABLE}.project_card_submission_id ;;
  }

  dimension: project_card_submission_url {
    type: string
    sql: ${TABLE}.project_card_submission_url ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: published {
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
    sql: ${TABLE}.published_at ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
  }

  dimension: submission_status {
    type: string
    sql: ${TABLE}.submission_status ;;
  }

  dimension: submitter_full_name {
    type: string
    sql: ${TABLE}.submitter_full_name ;;
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}.submitter_id ;;
  }

  dimension: submitter_type {
    type: string
    sql: ${TABLE}.submitter_type ;;
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
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: time_account_created {
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
    sql: ${TABLE}.time_account_created ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
  }

# A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_rating {
    type: sum
    sql: ${average_rating} ;;
    drill_fields: [details*]
  }

  measure: average_average_rating {
    type: average
    sql: ${average_rating} ;;
    drill_fields: [details*]
  }

#***********************************************************************************************************
#Custom Measures

#sum((CASE WHEN (`Submission Status` = 'Graded') THEN 1 else 0 END)) this equation used in DOMO
measure: total_graded {
  type: sum
  sql: case when ${submission_status} = "Graded" then 1 else 0 end;;
  drill_fields: [details*]
}

#***********************************************************************************************************
measure: total_submitted {
  type: count_distinct
  sql: ${TABLE}.submitter_id ;;
  drill_fields: [details*]
}

#***********************************************************************************************************

  measure: count {
    type: count
    drill_fields: [details*]
  }

  set: details {
    fields: [ecl_source_name, current_content_owner_full_name, card_author_full_name, grader_full_name, submitter_full_name]
  }
}
