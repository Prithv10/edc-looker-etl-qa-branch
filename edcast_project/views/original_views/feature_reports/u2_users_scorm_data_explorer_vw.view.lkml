# The name of this view in Looker is "U2 Users Scorm Data Explorer Vw"
view: u2_users_scorm_data_explorer_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u2_users_scorm_data_explorer_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.u2_users_scorm_data_explorer_vw`
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
    sql: ${TABLE}.Card_ID ;;
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

#(CASE
#WHEN `Scorm Registration Status` = 'COMPLETED' THEN `Time`
#ELSE 0
#END)
dimension_group: completion {
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
  sql: case when (${scorm_registration_status}="Completed") then TIMESTAMP(${time_date}) else 0 end ;;
  html: {{ rendered_value | date: "%D %r" }};;
}

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  dimension: current_content_owner_full_name {
    type: string
    sql: ${TABLE}.current_content_owner_full_name ;;
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.Duration_HHMM ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.Duration_seconds ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration_seconds {
    type: sum
    sql: ${duration_seconds} ;;
  }

  measure: average_duration_seconds {
    type: average
    sql: ${duration_seconds} ;;
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
    sql: ${TABLE}.Event ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.performance_metric ;;
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

  dimension: scorm_attempts {
    type: string
    sql: ${TABLE}.Scorm_Attempts ;;
  }

  dimension: scorm_course_id {
    type: string
    sql: ${TABLE}.Scorm_Course_ID ;;
  }

  dimension: scorm_registration_status {
    type: string
    sql: ${TABLE}.Scorm_Registration_Status ;;
  }

  dimension: scorm_registration_success {
    type: string
    sql: ${TABLE}.Scorm_Registration_Success ;;
  }

  dimension: scorm_score {
    type: number
    sql: ${TABLE}.Scorm_Score ;;
  }

  dimension: scorm_total_seconds_tracked {
    type: number
    sql: ${TABLE}.Scorm_Total_Seconds_Tracked ;;
  }

  dimension: scorm_time_to_complete_HHMMSS {
    type:number
    sql: ${TABLE}.Scorm_Total_Seconds_Tracked/86400 ;;
    value_format: "hh:mm:ss"
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
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
    sql: ${TABLE}.Time_Account_Created ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.User_Account_Status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.User_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [details*]
  }

  set: details {
    fields: [ecl_source_name, current_content_owner_full_name, card_author_full_name, user_full_name]
  }
}
