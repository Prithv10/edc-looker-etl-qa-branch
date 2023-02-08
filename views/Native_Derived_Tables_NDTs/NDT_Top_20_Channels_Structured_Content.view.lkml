

view: derived_table_using_explore_source_top_20_channels_structured_content_step1 {
  derived_table: {
    explore_source: g3_groups_structured_content_performance_data_explorer_vw {
      column: count {}
      column: channel_name { field: g3_groups_structured_content_performance_data_explorer_vw.channel_name }
      filters: [g3_groups_structured_content_performance_data_explorer_vw.channel_name: "-NULL"]
    }
  }

  dimension: count {
    label: "Channel Data Count"
    description: ""
    type: number
  }

  dimension: channel_name {
    description: ""
  }

}

view: derived_table_using_sql_top_20_channels_structured_content_step2 {
  derived_table: {
    sql:
      select count, channel_name,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${derived_table_using_explore_source_top_20_channels_structured_content_step1.SQL_TABLE_NAME} ;;
  }

  dimension: count {
    type: number
  }

  dimension: channel_name {
    type: string
  }

  dimension: rank_step2 {
    type: number
  }
}

view: ndt_top_20_channels_structured_content {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: ndt_top_20_channels_structured_content {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
