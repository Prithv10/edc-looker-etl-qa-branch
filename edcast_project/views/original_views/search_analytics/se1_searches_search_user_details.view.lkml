# The name of this view in Looker is "Se1 Searches Search User Details"
view: se1_searches_search_user_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `{{_user_attributes['database']}}.se1_searches_search_user_details_vw`
    ;;
  #gcp-us-central-1-qa-04-323821.spark_edcast_qa

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Analytics Version" in Explore.

  #test line

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
    drill_fields: [detail*]
  }

  measure: average_org {
    type: average
    sql: ${org} ;;
    drill_fields: [detail*]
  }

  dimension: platform {
    type: string
    sql: trim(${TABLE}.platform) ;;
  #  drill_fields: [detail*]
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
    sql: trim(${TABLE}.search_query) ;;
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


  # measure: gsuite_docs1{
  #   type: sum
  # sql: case when ${platform} ='GSuite - Docs' then 1 else 0 end ;;

  #   drill_fields: [detail*]
  # }

  # measure: gsuite_sheets1{
  #   type: sum
  #   sql: case when ${platform} ='GSuite - Sheets' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: gsuite_slides1{
  #   type: sum
  #   sql: case when ${platform} ='GSuite - Slides' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: ms_teams1{
  #   type: sum
  #   sql: case when ${platform} ='Microsoft Teams' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: o365_excel1{
  #   type: sum
  #   sql: case when ${platform} ='O365 - Excel' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: o365_ppt1{
  #   type: sum
  #   sql: case when ${platform} ='O365 - PPT' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: o365_word1{
  #   type: sum
  #   sql: case when ${platform} ='O365 - Word' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: sfdc1{
  #   type: sum
  #   sql: case when ${platform} ='SFDC' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: slack1{
  #   type: sum
  #   sql: case when ${platform} ='Slack' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: widgets1{
  #   type: sum
  #   sql: case when ${platform} ='Widgets' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }


  measure: gsuite_docs{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "GSuite - Docs"
    }
    drill_fields: [detail*]
  }
  measure: gsuite_slides{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "GSuite - Slides"
    }
    drill_fields: [detail*]
  }
  measure: gsuite_sheets{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "GSuite - Sheets"
    }
    drill_fields: [detail*]
  }
  measure: ms_teams{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "Microsoft Teams"
    }
    drill_fields: [detail*]
  }
  measure: o365_word{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "O365 - Word"
    }
    drill_fields: [detail*]
  }
  measure: o365_ppt{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "O365 - PPT"
    }
    drill_fields: [detail*]
  }

  measure: o365_excel{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "O365 - Excel"
    }
    drill_fields: [detail*]
  }

  measure: sfdc{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "SFDC"
    }
    drill_fields: [detail*]
  }

  measure: slack{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "Slack"
    }
    drill_fields: [detail*]
  }

  measure: widgets{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "Widgets"
    }
    drill_fields: [detail*]
  }

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
    sql: ${android}+${ios}+${web}+${widgets}+${slack}+${sfdc}+${o365_word}+${o365_ppt}+${o365_excel}+${ms_teams}+${gsuite_docs}+${gsuite_sheets}+${gsuite_slides};;
    drill_fields: [detail*]
  }

  measure: total_platforms_main_three{
    type: number
    sql: ${android}+${ios}+${web};;
    drill_fields: [detail*]
  }
#   measure: total_platforms{
#     type: sum
#     sql: (case when platform in('GSuite - Docs', 'GSuite - Sheets', 'GSuite - Slides',
# 'Microsoft Teams', 'O365 - Excel', 'O365 - PPT', 'O365 - Word', 'SFDC', 'Slack', 'Widgets', 'android', 'ios', 'web') then 1 else 0 end) ;;

#   drill_fields: [detail*]
#   }

#custom measure for result count which is presented as dimenssion

  measure: count_of_results_count {
    type: number
    sql: count(${TABLE}.results_count );;
    drill_fields: [detail*]
  }

  measure: count_of_search_query {
    type: number
    sql: count(${TABLE}.search_query );;
    drill_fields: [detail*]
  }

  measure: count_of_event {
    type: number
    sql: count(${TABLE}.event) ;;
    drill_fields: [detail*]
  }
  measure: count {
    type: count
    drill_fields: [detail*]
    #html: {{platform._rendered_value}} - {{rendered_value }} ;;
  }

  set: detail {
    fields: [platform,event,time_raw,analytics_version, is_admin_request,is_system_generated,hostname,org,platform_version_number,results_count,search_query,
      user_agent,user_full_name,email,time_account_created_raw,sign_in_count, user_account_status,excluded_from_leaderboard,external_id]
  }
}
