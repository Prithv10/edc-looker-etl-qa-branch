# The name of this view in Looker is "G3 Groups Search User Details Vw"
view: g3_groups_search_user_details_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.


  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_search_user_details_vw`
  #   ;;


  sql_table_name: `{{_user_attributes['database']}}.g3_groups_search_user_details_vw`
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
    type: string
    sql: ${TABLE}.Is_Admin_Request ;;
  }

  dimension: is_system_generated {
    type: string
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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_results_count {
    type: sum
    sql: ${results_count} ;;
  }

  measure: average_results_count {
    type: average
    sql: ${results_count} ;;
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


# Start - Custom Measures for Top 20 Searches - Group Analytics
#   measure: gsuite_docs{
#     type: sum
#     sql: case when ${platform} ='GSuite - Docs' then 1 else 0 end ;;

#   }


#   measure: gsuite_sheets{
#     type: sum
#     sql: case when ${platform} ='GSuite - Sheets' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: gsuite_slides{
#     type: sum
#     sql: case when ${platform} ='GSuite - Slides' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: ms_teams{
#     type: sum
#     sql: case when ${platform} ='Microsoft Teams' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: o365_excel{
#     type: sum
#     sql: case when ${platform} ='O365 - Excel' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: o365_ppt{
#     type: sum
#     sql: case when ${platform} ='O365 - PPT' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: o365_word{
#     type: sum
#     sql: case when ${platform} ='O365 - Word' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: sfdc{
#     type: sum
#     sql: case when ${platform} ='SFDC' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: slack{
#     type: sum
#     sql: case when ${platform} ='Slack' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: widgets{
#     type: sum
#     sql: case when ${platform} ='Widgets' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: android{
#     type: sum
#     sql: case when ${platform} ='android' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: ios{
#     type: sum
#     sql: case when ${platform} ='ios' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: web{
#     type: sum
#     sql: case when ${platform} ='web' then 1 else 0 end ;;
#     drill_fields: [details*]
#   }
#   measure: total_platforms{
#     type: sum
#     sql: (case when platform in('GSuite - Docs', 'GSuite - Sheets', 'GSuite - Slides',
#       'Microsoft Teams', 'O365 - Excel', 'O365 - PPT', 'O365 - Word', 'SFDC', 'Slack', 'Widgets', 'android', 'ios', 'web') then 1 else 0 end) ;;
#     drill_fields: [details*]
# }

  measure: android{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "android"
    }
    drill_fields: [detail*]
  }

  measure: ios{
    type: count
    #sql: case when ${platform} ='ios' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "ios"
    }
    drill_fields: [detail*]
  }



  measure: web{
    type: count
    # sql: case when ${platform} ='web' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "web"
    }
    drill_fields: [detail*]
  }


  measure: total_platforms{
    type: number
    sql: ${android}+${ios}+${web};;
    drill_fields: [detail*]
  }
  # End - Custom Measures for Top 20 Searches - Group Analytics

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_of_search_query {
    type: number
    sql: count(${TABLE}.Search_Query);;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [search_query,platform,time_raw,analytics_version,event,is_admin_request,is_system_generated,hostname,org_id,platform_version_number,results_count,
      user_agent,user_id,user_full_name,email,time_account_created_raw,user_account_status,group_id,group_name,group_status,excluded_from_leaderboard,external_id]
  }
}
