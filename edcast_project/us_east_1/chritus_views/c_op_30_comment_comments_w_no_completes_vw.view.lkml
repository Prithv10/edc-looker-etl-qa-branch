# The name of this view in Looker is "C Op 30 Comment Comments W No Completes Vw"
view: c_op_30_comment_comments_w_no_completes_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aws-us-east-1-prod-01.edc_prod_analytics_customer_1998.c_op_30_comment_comments_w_no_completes_vw`
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

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
  }

  dimension: badges_earned {
    type: number
    sql: ${TABLE}.badges_earned ;;
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

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
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

  dimension: clickable_genesis_url {
    type: string
    sql: ${TABLE}.clickable_genesis_url ;;
  }

  dimension: clicked_link {
    type: number
    sql: ${TABLE}.clicked_link ;;
  }

  dimension: comment_message {
    type: string
    sql: ${TABLE}.comment_message ;;
  }

  dimension: comment_status {
    type: string
    sql: ${TABLE}.comment_status ;;
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

  dimension: department_name {
    type: number
    sql: ${TABLE}.department_name ;;
  }

  dimension: department_number {
    type: number
    sql: ${TABLE}.department_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_department_number {
    type: sum
    sql: ${department_number} ;;
  }

  measure: average_department_number {
    type: average
    sql: ${department_number} ;;
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.duration_hhmm ;;
  }

  dimension: duration_hours {
    type: number
    sql: ${TABLE}.duration_hours ;;
  }

  dimension: duration_minutes {
    type: number
    sql: ${TABLE}.duration_minutes ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: fte {
    type: number
    sql: ${TABLE}.fte ;;
  }

  dimension: genesis_card_link {
    type: string
    sql: ${TABLE}.genesis_card_link ;;
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

  dimension: initial_hire_date {
    type: number
    sql: ${TABLE}.initial_hire_date ;;
  }

  dimension: is_manager {
    type: number
    sql: ${TABLE}.is_manager ;;
  }

  dimension: is_public {
    type: string
    sql: ${TABLE}.is_public ;;
  }

  dimension: job_code {
    type: number
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_code_descr {
    type: number
    sql: ${TABLE}.job_code_descr ;;
  }

  dimension: likes {
    type: number
    sql: ${TABLE}.likes ;;
  }

  dimension: master_card_id {
    type: number
    sql: ${TABLE}.master_card_id ;;
  }

  dimension: ministry {
    type: number
    sql: ${TABLE}.ministry ;;
  }

  dimension: network_id {
    type: number
    sql: ${TABLE}.network_id ;;
  }

  dimension: paygroup {
    type: number
    sql: ${TABLE}.paygroup ;;
  }

  dimension: position_category {
    type: number
    sql: ${TABLE}.position_category ;;
  }

  dimension: position_family {
    type: number
    sql: ${TABLE}.position_family ;;
  }

  dimension: position_id {
    type: number
    sql: ${TABLE}.position_id ;;
  }

  dimension: position_level {
    type: number
    sql: ${TABLE}.position_level ;;
  }

  dimension: position_name {
    type: number
    sql: ${TABLE}.position_name ;;
  }

  dimension: position_sub_category {
    type: number
    sql: ${TABLE}.position_sub_category ;;
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

  dimension: rehire_date {
    type: number
    sql: ${TABLE}.rehire_date ;;
  }

  dimension: relationship_to_org {
    type: number
    sql: ${TABLE}.relationship_to_org ;;
  }

  dimension: reporting_location_id {
    type: number
    sql: ${TABLE}.reporting_location_id ;;
  }

  dimension: reporting_location_name {
    type: number
    sql: ${TABLE}.reporting_location_name ;;
  }

  dimension: reports_to_name {
    type: number
    sql: ${TABLE}.reports_to_name ;;
  }

  dimension: reports_to_network_id {
    type: number
    sql: ${TABLE}.reports_to_network_id ;;
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

  dimension: termination_date {
    type: number
    sql: ${TABLE}.termination_date ;;
  }

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

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      ecl_source_name,
      card_author_full_name,
      user_full_name,
      reporting_location_name,
      department_name,
      position_name,
      reports_to_name
    ]
  }
}
