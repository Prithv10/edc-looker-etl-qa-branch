# The name of this view in Looker is "Mock G3 Search User Details"
view: mock_g3_search_user_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.mock_g3_search_user_details`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Analytics Version" in Explore.

  dimension: analytics_version {
    type: string
    sql: ${TABLE}.Analytics_Version ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
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
    sql: ${TABLE}.External_ID ;;
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

  dimension: hostname {
    type: string
    sql: ${TABLE}.Hostname ;;
  }

  dimension: is_admin_request {
    type: number
    sql: ${TABLE}.Is_Admin_Request ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_is_admin_request {
    type: sum
    sql: ${is_admin_request} ;;
  }

  measure: average_is_admin_request {
    type: average
    sql: ${is_admin_request} ;;
  }

  dimension: is_system_generated {
    type: number
    sql: ${TABLE}.Is_System_Generated ;;
  }

  dimension: org_id {
    type: number
    sql: ${TABLE}.Org_ID ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
  }

  dimension: platform_version_number {
    type: string
    sql: ${TABLE}.Platform_Version_Number ;;
  }

  dimension: results_count {
    type: number
    sql: ${TABLE}.Results_Count ;;
  }

  dimension: search_query {
    type: string
    sql: ${TABLE}.Search_Query ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: user_agent {
    type: string
    sql: ${TABLE}.User_Agent ;;
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

# set: details {
#   fields: [time_account_created_date,event,platform,results_count,search_query,user_id,
#     user_full_name,email,sign_in_count,user_account_status,
#     excluded_from_leaderboard,external_id]
# }
  set: details {
    fields: [search_query,platform,time_raw,analytics_version,event,is_admin_request,is_system_generated,hostname,org_id,platform_version_number,results_count,
      user_agent,user_id,user_full_name,email,time_account_created_raw,user_account_status,group_id,group_name,group_status,excluded_from_leaderboard,external_id]
  }
}
