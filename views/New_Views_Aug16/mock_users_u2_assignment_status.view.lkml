# The name of this view in Looker is "Mock Users U2 Assignment Status"
view: mock_users_u2_assignment_status {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.mock_users_u2_assignment_status`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: assignment_due {
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
    sql: ${TABLE}.assignment_due_date ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assignment Progression" in Explore.

  dimension: assignment_progression {
    type: string
    sql: ${TABLE}.assignment_progression ;;
  }

  dimension: assignment_state {
    type: string
    sql: ${TABLE}.assignment_state ;;
  }

  dimension: assignment_type {
    type: string
    sql: ${TABLE}.assignment_type ;;
  }

  dimension: assignor_full_name {
    type: string
    sql: ${TABLE}.assignor_full_name ;;
  }

  dimension: assignor_id {
    type: number
    sql: ${TABLE}.assignor_id ;;
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
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
    type: string
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

  dimension: content_status {
    type: string
    sql: ${TABLE}.content_status ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  dimension: current_content_owner_full_name {
    type: string
    sql: ${TABLE}.current_content_owner_full_name ;;
  }

  dimension: duration__hh_mm_ {
    type: string
    sql: ${TABLE}.duration__hh_mm_ ;;
  }

  dimension: duration__seconds_ {
    type: number
    sql: ${TABLE}.duration__seconds_ ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration__seconds_ {
    type: sum
    sql: ${duration__seconds_} ;;
  }

  measure: average_duration__seconds_ {
    type: average
    sql: ${duration__seconds_} ;;
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

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_card_promoted {
    type: number
    sql: ${TABLE}.is_card_promoted ;;
  }

  dimension: is_live_stream {
    type: number
    sql: ${TABLE}.is_live_stream ;;
  }

  dimension: is_public_ {
    type: yesno
    sql: ${TABLE}.is_public_ ;;
  }

  dimension: is_user_generated {
    type: number
    sql: ${TABLE}.is_user_generated ;;
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

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
  }

  dimension_group: time_assignment_created {
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
    sql: ${TABLE}.time_assignment_created ;;
  }

  dimension_group: time_assignment_started {
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
    sql: ${TABLE}.time_assignment_started ;;
  }

  dimension_group: time_completed {
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
    sql: ${TABLE}.time_completed ;;
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

  measure: count {
    type: count
    drill_fields: [ecl_source_name, current_content_owner_full_name, assignor_full_name, card_author_full_name, user_full_name]
  }
}
