# The name of this view in Looker is "C IP 21 Channel Activity Counts Vw"
view: c_ip_21_channel_activity_counts_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aws-us-east-1-prod-01.edc_prod_analytics_customer_1998.c_ip_21_channel_activity_counts_vw`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "All Views Category" in Explore.

  dimension: all_views_category {
    type: string
    sql: ${TABLE}.all_views_category ;;
  }

  dimension: badges_earned {
    type: number
    sql: ${TABLE}.badges_earned ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_badges_earned {
    type: sum
    sql: ${badges_earned} ;;
  }

  measure: average_badges_earned {
    type: average
    sql: ${badges_earned} ;;
  }

  dimension: bookmarks {
    type: number
    sql: ${TABLE}.bookmarks ;;
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_resource_url {
    type: number
    sql: ${TABLE}.card_resource_url ;;
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

  dimension: channel_content {
    type: string
    sql: ${TABLE}.channel_content ;;
  }

  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension: clicked_link {
    type: number
    sql: ${TABLE}.clicked_link ;;
  }

  dimension: comments {
    type: number
    sql: ${TABLE}.comments ;;
  }

  dimension: completions {
    type: number
    sql: ${TABLE}.completions ;;
  }

  dimension: content_activity_card_title {
    type: string
    sql: ${TABLE}.content_activity_card_title ;;
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.duration_hhmm ;;
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
  }

  dimension: feeder_card_id {
    type: number
    sql: ${TABLE}.feeder_card_id ;;
  }

  dimension: in_channel {
    type: string
    sql: ${TABLE}.in_channel ;;
  }

  dimension: in_journey {
    type: string
    sql: ${TABLE}.in_journey ;;
  }

  dimension: in_pathway {
    type: string
    sql: ${TABLE}.in_pathway ;;
  }

  dimension: likes {
    type: number
    sql: ${TABLE}.likes ;;
  }

  dimension: shared_to_group {
    type: number
    sql: ${TABLE}.shared_to_group ;;
  }

  dimension: shared_to_person {
    type: number
    sql: ${TABLE}.shared_to_person ;;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
  }

  dimension: tags {
    type: number
    sql: ${TABLE}.tags ;;
  }

  dimension: unique_views_category {
    type: string
    sql: ${TABLE}.unique_views_category ;;
  }

  dimension: views_all {
    type: number
    sql: ${TABLE}.views_all ;;
  }

  dimension: views_unique {
    type: number
    sql: ${TABLE}.views_unique ;;
  }

  measure: count {
    type: count
    drill_fields: [ecl_source_name, card_author_full_name, channel_name]
  }
}
