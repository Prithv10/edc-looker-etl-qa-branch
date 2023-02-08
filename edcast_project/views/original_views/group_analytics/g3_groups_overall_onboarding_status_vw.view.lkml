# The name of this view in Looker is "G3 Groups Overall Onboarding Status Vw"
view: g3_groups_overall_onboarding_status_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.


# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_overall_onboarding_status_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.g3_groups_overall_onboarding_status_vw`
  ;;

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
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

# dimension: first_day_of_active_engagement {
  #   type: string
  #   sql: ${TABLE}.first_day_of_active_engagement ;;
  # }

  dimension_group: first_day_of_active_engagement {
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
    sql: timestamp(${TABLE}.first_day_of_active_engagement) ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.Group_ID ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.Group_Name ;;
  }

  dimension: group_status {
    type: string
    sql: ${TABLE}.Group_Status ;;
  }

  dimension: group_user_role {
    type: string
    sql: ${TABLE}.Group_User_Role ;;
  }

  dimension_group: latest_day_of_active_engagement {
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
    sql: timestamp(${TABLE}.latest_day_of_active_engagement) ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  # dimension_group: parsed_first_day_of_active_engagement {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.parsed_first_day_of_active_engagement ;;
  #   #  html: {{ rendered_value | date: "%D %r" }};;
  # }

  # dimension_group: parsed_latest_day_of_active_engagement {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.parsed_latest_day_of_active_engagement ;;
  # }

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

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    sql: ${TABLE}.User_Account_Status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  #***dimension added on 2/09/2022 ********************************** after the data team resolved the issue
  dimension: overall_onboarding_status {
    type: string
    sql: ${TABLE}.overall_onboarding_status ;;
  }
#****************************************************
  measure: count {
    type: count
    drill_fields: [detail*]
  }

# COUNT(DISTINCT `User ID`)
#This counts distinct group users
  measure: distinct_active_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [detail*]
  }

  measure: count_of_overall_onboarding_status {
    type:number
    sql: count(${overall_onboarding_status}) ;;
    drill_fields: [detail*]
  }

  measure: count_external_id {
    type: number
    sql: count(${external_id});;
    drill_fields: [detail*]
  }

  measure: count_distinct_email {
    type: count_distinct
    sql: ${TABLE}.email ;;
    drill_fields: [detail*]
  }

  measure: count_user_account_status {
    type: number
    sql: count(${TABLE}.User_Account_Status) ;;
    drill_fields: [detail*]
  }

  measure: count_of_user_id {
    type: number
    sql: count(${TABLE}.user_id) ;;
    drill_fields: [detail*]
  }
  set: detail {
    fields: [overall_onboarding_status,user_id,user_full_name,email,time_account_created_raw,sign_in_count,user_account_status,excluded_from_leaderboard,
      latest_day_of_active_engagement_raw,total_days_of_active_engagement,first_day_of_active_engagement_raw,group_id,group_name,group_status,external_id]
  }
}
