# The name of this view in Looker is "Dbt Groups G3 Channel Performance Vw"
view: dbt_groups_g3_channel_performance_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.dbt_groups_g3_channel_performance_vw`
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

  measure: count {
    type: count
    drill_fields: [group_name, performance_metric,user_id,group_id,group_status,user_full_name,
      email,time_raw,event,platform,user_account_status,excluded_from_leaderboard]
  }
}
