

# The name of this view in Looker is "Mock Channel Performance"
  view: mock_channel_performance {
    # The sql_table_name parameter indicates the underlying database table
    # to be used for all fields in this view.
    sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.ch2_channel_performance_part2_final_results_vw`
      ;;
    # No primary key is defined for this view. In order to join this view in an Explore,
    # define primary_key: yes on a dimension that has no repeated values.
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Channel ID" in Explore.
    dimension: channel_id {
      type: number
      sql: ${TABLE}.Channel_ID ;;
      # drill_fields: [details*]
    }
    dimension: channel_name {
      type: string
      sql: trim(${TABLE}.Channel_Name) ;;
      drill_fields: [details*]
    }
    dimension: channel_status {
      type: string
      sql: trim(${TABLE}.Channel_Status) ;;
      drill_fields: [details*]
    }
    dimension: email {
      type: string
      sql: ${TABLE}.Email ;;
      drill_fields: [details*]
    }
    dimension: event {
      type: string
      sql: ${TABLE}.Event ;;
      drill_fields: [details*]
    }
    dimension: excluded_from_leaderboard {
      type: yesno
      sql: ${TABLE}.Excluded_From_Leaderboard ;;
      # drill_fields: [details*]
    }
    dimension: external_id {
      type: string
      sql: ${TABLE}.External_ID ;;
      # drill_fields: [details*]
    }
    dimension: is_channel_curated {
      type: number
      sql: ${TABLE}.Is_Channel_Curated ;;
      drill_fields: [details*]
    }
    # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
    # measures for this dimension, but you can also add measures of many different aggregates.
    # Click on the type parameter to see all the options in the Quick Help panel on the right.
    measure: total_is_channel_curated {
      type: sum
      sql: ${is_channel_curated} ;;
      # drill_fields: [details*]
    }
    measure: average_is_channel_curated {
      type: average
      sql: ${is_channel_curated} ;;
      # drill_fields: [details*]
    }
    dimension: is_channel_private {
      type: yesno
      sql: ${TABLE}.Is_Channel_Private ;;
      # drill_fields: [details*]
    }
    dimension: is_ecl_enabled {
      type: number
      sql: ${TABLE}.Is_ECL_Enabled ;;
      # drill_fields: [details*]
    }
    dimension: performance_metric {
      type: string
      sql: ${TABLE}.Performance_Metric ;;
      drill_fields: [details*]
    }
    dimension: platform {
      type: string
      sql: trim(${TABLE}.Platform) ;;
      # drill_fields: [details*]
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
      drill_fields: [details*]
      html: {{ rendered_value | date: "%D %r" }};;
    }
    dimension: month {
      type: date_month_name
      sql: ${TABLE}.month ;;
      # drill_fields: [details*]
    }
    dimension: user_account_status {
      type: string
      sql: ${TABLE}.User_Account_Status ;;
      # drill_fields: [details*]
    }
    dimension: user_full_name {
      type: string
      sql: ${TABLE}.User_Full_Name ;;
      drill_fields: [details*]
    }
    dimension: user_id {
      type: number
      sql: ${TABLE}.User_ID ;;
      # drill_fields: [details*]
    }
    measure: count {
      type: count
      drill_fields: [details*]
    }
    set: details {
      fields: [event,performance_metric,channel_name,is_channel_private,is_channel_curated,channel_status, user_id, user_full_name,email,time_raw,channel_id,  platform,user_account_status, channel_status,excluded_from_leaderboard,
        is_ecl_enabled, external_id]
      #set: details {
      #fields: [channel_id,time_raw, channel_name, channel_status, email, event, excluded_from_leaderboard, is_channel_private, is_channel_curated,
      #is_ecl_enabled, performance_metric, platform, user_account_status, user_full_name, user_id]
    }
  }
