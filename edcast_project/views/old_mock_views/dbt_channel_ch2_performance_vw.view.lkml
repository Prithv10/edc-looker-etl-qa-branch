# The name of this view in Looker is "Dbt Channel Ch2 Performance Vw"
view: dbt_channel_ch2_performance_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.dbt_channel_ch2_performance_vw`
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

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_channel_curated {
    type: string
    sql: ${TABLE}.Is_Channel_Curated ;;
  }

  dimension: is_channel_private {
    type: yesno
    sql: ${TABLE}.Is_Channel_Private ;;
  }

  dimension: is_ecl_enabled {
    type: string
    sql: ${TABLE}.Is_ECL_Enabled ;;
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
    drill_fields: [details*]
  }

  set: details {
    fields: [event,performance_metric,channel_name,is_channel_private,is_channel_curated,channel_status, user_id, user_full_name,email,time_raw,channel_id, channel_status, email,  excluded_from_leaderboard,
      is_ecl_enabled,  platform, user_account_status]
  }
}
