# The name of this view in Looker is "Ch2 Channel Performance Part2 Final Results Vw"
view: ch2_channel_performance_part2_final_results_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
#<<<<<<< HEAD
 sql_table_name: `{{_user_attributes['database']}}.ch2_channel_performance_part2_final_results_vw`;;

#>>>>>>> branch 'master' of git@github.com:edcast/edc-looker.git
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel ID" in Explore.


# Created Primary Key Dimension
  dimension: primary_key {
    primary_key: yes
    sql: concat(${TABLE}.channel_id,${TABLE}.external_id,${TABLE}.user_id,${TABLE}.performance_metric,${TABLE}.Time) ;;
  }

 dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
 #   drill_fields: [detail*]
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
 #   drill_fields: [detail*]
  }

  dimension: channel_status {
    type: string
    sql: ${TABLE}.channel_status ;;
 #   drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
 #   drill_fields: [detail*]
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  #  drill_fields: [detail*]
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
 #   drill_fields: [detail*]
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  #  drill_fields: [detail*]
  }

  dimension: is_channel_curated {
    type: number
    sql: ${TABLE}.Is_Channel_Curated ;;
  #  drill_fields: [detail*]
  }

  dimension: is_channel_private {
    type: yesno
    sql: ${TABLE}.Is_Channel_Private ;;
    #   drill_fields: [detail*]
  }
  dimension: is_ecl_enabled {
    type: number
    sql: ${TABLE}.Is_ECL_Enabled ;;
    #  drill_fields: [detail*]
  }

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.performance_metric ;;
  #  drill_fields: [detail*]
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
 #   drill_fields: [detail*]
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
  #  drill_fields: [detail*]
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
  #  drill_fields: [detail*]
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  #  drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
 #   drill_fields: [detail*]
  }


#Start - MEASURES for Top 20 channels - Channels Analytics*********************************

  measure: Current_Collaborators{
    type: count
  #  sql: case when ${performance_metric} ='Current Collaborators' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Current Collaborators"
    }
    drill_fields: [detail*]
  }

  measure: Current_Curators{
    type: count
    filters: {
      field: performance_metric
      value: "Current Curators"
    }
    drill_fields: [detail*]
  }

  measure: Current_Followers{
    type: count
    filters: {
      field: performance_metric
      value: "Current Followers"
    }
    drill_fields: [detail*]
  }


  measure: Total_Distinct_User_Visits{
    type: count
    filters: {
      field: performance_metric
      value: "Total Distinct User Visits"
    }
    drill_fields: [detail*]
  }
  measure: Total_Visits{
    type: count
    filters: {
      field: performance_metric
      value: "Total Visits"
    }
    drill_fields: [detail*]
  }

  measure: total_events{
    type: number
    sql: ${Current_Collaborators}+${Current_Curators}+${Current_Followers}+${Total_Distinct_User_Visits}+${Total_Visits};;
    drill_fields: [detail*]
  }

  #End - MEASURES for Top 20 channels - Channels Analytics

  #**********************************************************************************************************


   # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
   # measures for this dimension, but you can also add measures of many different aggregates.
   # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: average_is_channel_curated {
    type: average
    sql: ${is_channel_curated} ;;
       drill_fields: [detail*]
  }

  measure: total_is_channel_curated {
    type: sum
    sql: ${is_channel_curated} ;;
      drill_fields: [detail*]
  }

#************************************************************************************************************
  measure: count_of_channel_ids {
    type: count_distinct
    sql: ${TABLE}.channel_id ;;
    drill_fields: [detail*]
  }

  #***********************************************************************************************************
#Top Channels. COUNT(DISTINCT `Channel ID`)

  measure: total_channels {
    type: count_distinct
    sql: ${TABLE}.channel_id ;;
    drill_fields: [detail*]
  }

  measure: count_distinct_of_event{
    type: count_distinct
    sql: ${TABLE}.event ;;
    drill_fields: [detail*]
  }
  #This counts the Events
 measure: count {
    type: count
    drill_fields: [detail*]

  }

  measure: count_of_event {
    type: number
    sql: count(${event}) ;;
    drill_fields: [detail*]
  }

  measure: count_user_full_name {
    type: number
    sql: count(${user_full_name}) ;;
    drill_fields: [detail*]
  }

  measure: count_of_performance_metric {
    type: number
    sql: count(${performance_metric}) ;;
    drill_fields: [detail*]
  }

  measure: count_distinct_users{
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [detail*]
  }

  measure: count_user_id {
    type: number
    sql: count(${user_id}) ;;
    drill_fields: [detail*]
  }

  # measure: count_of_performance_metric {
  #   type: number
  #   sql: count(${performance_metric}) ;;
  # }


# measure: count_events {
#   type: number
#   sql: count(${event}) ;;
# }
  set: detail {
    fields: [channel_name,performance_metric,user_id,user_full_name,email,time_raw,channel_id,platform,event,channel_status,
      user_account_status,excluded_from_leaderboard,is_channel_private,is_ecl_enabled,is_channel_curated,external_id]
  }
}
