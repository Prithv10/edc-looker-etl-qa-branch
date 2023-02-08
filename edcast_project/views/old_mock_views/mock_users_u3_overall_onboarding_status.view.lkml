# The name of this view in Looker is "Mock Users U3 Overall Onboarding Status"
view: mock_users_u3_overall_onboarding_status {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  #sql_table_name: `{{ _user_attributes['database'] }}.spark_edcast_qa.mock_users_u3_overall_onboarding_status`
   # ;;

  sql_table_name: `spark_edcast_qa.mock_users_u3_overall_onboarding_status`;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: first_day_of_active_engagement {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_day_of_active_engagement ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: latest_day_of_active_engagement {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.latest_day_of_active_engagement ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: overall_onboarding_status {
    type: string
    sql: ${TABLE}.overall_onboarding_status ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sign_in_count {
    type: sum
    sql: ${sign_in_count} ;;
  }

  measure: average_sign_in_count {
    type: average
    sql: ${sign_in_count} ;;
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

  dimension_group: time_of_first_session {
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
    sql: ${TABLE}.time_of_first_session ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: time_of_last_session {
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
    sql: ${TABLE}.time_of_last_session ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: total_days_of_active_engagement {
    type: number
    sql: ${TABLE}.total_days_of_active_engagement ;;
  }

  dimension: total_sessions {
    type: number
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [details*]
  }

  set: details {
    fields: [first_day_of_active_engagement_raw,user_id,user_full_name,email,time_account_created_raw,sign_in_count,user_account_status,excluded_from_leaderboard,
      latest_day_of_active_engagement_raw,total_days_of_active_engagement,time_of_first_session_raw,time_of_last_session_raw,
      total_sessions,overall_onboarding_status]
  }
}
