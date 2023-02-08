# The name of this view in Looker is "G3 Groups Channel Performance Vw"
view: g3_groups_channel_performance_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.


# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_channel_performance_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.g3_groups_channel_performance_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel ID" in Explore.

  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension: channel_status {
    type: string
    sql: ${TABLE}.channel_status ;;
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

  dimension: is_channel_private {
    type: yesno
    sql: ${TABLE}.Is_Channel_Private ;;
  }

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.performance_metric ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
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

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

#****dimension added on 2/09/2022 ********************************** after the data team resolved the issue****

  dimension: external_id {
    type: string
    sql: ${TABLE}.External_id ;;
  }

  dimension: is_channel_curated {
    type: number
    sql: ${TABLE}.Is_Channel_Curated ;;
  }

  dimension: is_ecl_enabled {
    type: number
    sql: ${TABLE}.Is_ECL_Enabled ;;
  }
####Custom measures for sorting



 #Start - MEASURES for Top 20 Channels - Group Analytics
  # measure:current_collaborators  {
  #   type: sum
  #   sql: case when ${performance_metric} ='Current Collaborators' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }

  # measure:current_curators  {
  #   type: sum
  #   sql: case when ${performance_metric} ='Current Curators' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure:current_followers  {
  #   type: sum
  #   sql: case when ${performance_metric} ='Current Followers' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure:total_distinct_user_visits  {
  #   type: sum
  #   sql: case when ${performance_metric} ='Total Distinct User Visits' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure:total_visits  {
  #   type: sum
  #   sql: case when ${performance_metric} ='Total Visits' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }

  measure: current_collaborators{
    type: count
    #  sql: case when ${performance_metric} ='Current Collaborators' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Current Collaborators"
    }
    drill_fields: [detail*]
  }

  measure: current_curators{
    type: count
    #  sql: case when ${performance_metric} ='Current Curators' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Current Curators"
    }
    drill_fields: [detail*]
  }

  measure: current_followers{
    type: count
#    sql: case when ${performance_metric} ='Current Followers' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Current Followers"
    }
    drill_fields: [detail*]
  }


  measure: total_distinct_user_visits{
    type: count
    #   sql: case when ${performance_metric} = 'Total Distinct User Visits' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Distinct User Visits"
    }
    drill_fields: [detail*]
  }
  measure: total_visits{
    type: count
    #   sql: case when ${performance_metric} ='Total Visits' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Visits"
    }
    drill_fields: [detail*]
  }


  measure: total_events{
    type: number
    sql: ${current_collaborators}+${current_curators}+${current_followers}+${total_distinct_user_visits}+${total_visits};;
    drill_fields: [detail*]
  }


  # measure: total_events{
  #   type: sum
  #   sql: (case when performance_metric in('Current Collaborators', 'Current Curators', 'Current Followers', 'Total Distinct User Visits', 'Total Visits') then 1 else 0 end) ;;
  #   drill_fields: [detail*]
  # }
  #End - MEASURES for Top 20 Channels - Group Analytics


########

  measure: total_is_channel_curated {
    type: sum
    sql: ${is_channel_curated} ;;
    drill_fields: [detail*]
  }

  measure: average_is_channel_curated {
    type: average
    sql: ${is_channel_curated} ;;
    drill_fields: [detail*]
  }
#******************************************************************
  measure: count {
    type: count
    drill_fields: [detail*]
    }

    set: detail {
  fields: [time_raw,channel_name,performance_metric, user_id, user_full_name,
      email,channel_id,platform,event,
      channel_status,group_id,group_name,
      group_status,user_account_status,excluded_from_leaderboard,
      is_channel_private,
      is_ecl_enabled,
      is_channel_curated,
      external_id,
      is_ecl_enabled,
      is_channel_curated,
      external_id
      ]
  }
}
