# The name of this view in Looker is "Dbt Searches Se1 Search User Details"
view: dbt_searches_se1_search_user_details {


  sql_table_name: `{{ _user_attributes['database'] }}.se1_searches_search_user_details` ;;

  #sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.dbt_searches_se1_search_user_details`
  #  ;;


  dimension: analytics_version {
    type: string
    sql: ${TABLE}.analytics_version ;;
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
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: is_admin_request {
    type: string
    sql: ${TABLE}.is_admin_request ;;
  }

  dimension: is_system_generated {
    type: string
    sql: ${TABLE}.is_system_generated ;;
  }

  dimension: org {
    type: number
    sql: ${TABLE}.org ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_org {
    type: sum
    sql: ${org} ;;
  }

  measure: average_org {
    type: average
    sql: ${org} ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: platform_version_number {
    type: string
    sql: ${TABLE}.platform_version_number ;;
  }

  dimension: results_count {
    type: number
    sql: ${TABLE}.results_count ;;
  }

  dimension: search_query {
    type: string
    sql:trim( ${TABLE}.search_query) ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
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
    sql: ${TABLE}.time ;;
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

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [analytics_version,email,event,excluded_from_leaderboard,external_id,hostname,
   is_admin_request,is_system_generated,org,total_org,
   platform,platform_version_number,results_count,search_query,sign_in_count,user_account_status,
user_agent,user_full_name,user_id,time_raw]
  }

# set: details {
#   fields: [time_account_created_date,event,platform,results_count,search_query,user_id,
#     user_full_name,email,sign_in_count,user_account_status,
#     excluded_from_leaderboard,external_id]
# }


  measure: search_query_count {
    type: count_distinct
    sql: ${TABLE}.search_query ;;
  }

}
