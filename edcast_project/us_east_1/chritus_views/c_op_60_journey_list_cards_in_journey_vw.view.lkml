# The name of this view in Looker is "C Op 60 Journey List Cards In Journey Vw"
view: c_op_60_journey_list_cards_in_journey_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aws-us-east-1-prod-01.edc_prod_analytics_customer_1998.c_op_60_journey_list_cards_in_journey_vw`
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

  dimension: bookmarks {
    type: number
    sql: ${TABLE}.bookmarks ;;
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_resource_url {
    type: number
    sql: ${TABLE}.card_resource_url ;;
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.card_subtype ;;
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
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

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.Duration_HHMM ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.Duration_seconds ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration_seconds {
    type: sum
    sql: ${duration_seconds} ;;
  }

  measure: average_duration_seconds {
    type: average
    sql: ${duration_seconds} ;;
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
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

  dimension: is_public {
    type: string
    sql: ${TABLE}.is_public ;;
  }

  dimension: journey_badge_title {
    type: string
    sql: ${TABLE}.journey_badge_title ;;
  }

  dimension: journey_id {
    type: number
    sql: ${TABLE}.journey_id ;;
  }

  dimension: journey_pathway_id {
    type: number
    sql: ${TABLE}.journey_pathway_id ;;
  }

  dimension: journey_pathway_title {
    type: string
    sql: ${TABLE}.journey_pathway_title ;;
  }

  dimension: journey_state {
    type: string
    sql: ${TABLE}.journey_state ;;
  }

  dimension: journey_title {
    type: string
    sql: ${TABLE}.journey_title ;;
  }

  dimension: likes {
    type: number
    sql: ${TABLE}.likes ;;
  }

  dimension: pathway_badge_title {
    type: string
    sql: ${TABLE}.pathway_badge_title ;;
  }

  dimension: pathway_id {
    type: number
    sql: ${TABLE}.pathway_id ;;
  }

  dimension: pathway_state {
    type: string
    sql: ${TABLE}.pathway_state ;;
  }

  dimension: pathway_title {
    type: string
    sql: ${TABLE}.pathway_title ;;
  }

  dimension_group: published {
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
    sql: ${TABLE}.published_at ;;
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

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
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
    drill_fields: [ecl_source_name, card_author_full_name]
  }
}
