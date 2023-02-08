# The name of this view in Looker is "Mock G3 Channel Performance"
view: mock_g3_channel_performance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_channel_performance_vw`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel ID" in Explore.

  dimension: channel_id {
    type: number
    sql: ${TABLE}.Channel_ID ;;
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.Channel_Name ;;
  }

  dimension: channel_status {
    type: string
    sql: ${TABLE}.Channel_Status ;;
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

  dimension: is_channel_curated {
    type: number
    sql: ${TABLE}.Is_Channel_Curated ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_is_channel_curated {
    type: sum
    sql: ${is_channel_curated} ;;
  }

  measure: average_is_channel_curated {
    type: average
    sql: ${is_channel_curated} ;;
  }

  dimension: is_channel_private {
    type: yesno
    sql: ${TABLE}.Is_Channel_Private ;;
  }

  dimension: is_ecl_enabled {
    type: number
    sql: ${TABLE}.Is_ECL_Enabled ;;
  }

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.Performance_Metric ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
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
    sql: ${TABLE}.User_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [channel_name, group_name, user_full_name]
  }
}
