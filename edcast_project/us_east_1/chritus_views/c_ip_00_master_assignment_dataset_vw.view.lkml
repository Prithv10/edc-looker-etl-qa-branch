# The name of this view in Looker is "C IP 00 Master Assignment Dataset Vw"
view: c_ip_00_master_assignment_dataset_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aws-us-east-1-prod-01.edc_prod_analytics_customer_1998.c_ip_00_master_assignment_dataset_vw`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Action Reason" in Explore.

  dimension: action_reason {
    type: string
    sql: ${TABLE}.action_reason ;;
  }

  dimension: action_reason_eff_date {
    type: string
    sql: ${TABLE}.action_reason_eff_date ;;
  }

  dimension: assigned_by_id {
    type: number
    sql: ${TABLE}.assigned_by_id ;;
  }

  dimension: assigned_by_name {
    type: string
    sql: ${TABLE}.assigned_by_name ;;
  }

  dimension: assigned_to_group_id {
    type: number
    sql: ${TABLE}.assigned_to_group_id ;;
  }

  dimension: assigned_to_group_name {
    type: string
    sql: ${TABLE}.assigned_to_group_name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: assignment_completed {
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
    sql: ${TABLE}.assignment_completed_date ;;
  }

  dimension_group: assignment_created {
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
    sql: ${TABLE}.assignment_created_date ;;
  }

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

  dimension: assignment_progress {
    type: string
    sql: ${TABLE}.assignment_progress ;;
  }

  dimension_group: assignment_started {
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
    sql: ${TABLE}.assignment_started_date ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
  }

  dimension: cards_completed {
    type: string
    sql: ${TABLE}.cards_completed ;;
  }

  dimension_group: completed_date {
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
    sql: ${TABLE}.completed_date ;;
  }

  dimension: completion_progress {
    type: number
    sql: ${TABLE}.completion_progress ;;
    value_format: "0\%"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_completion_progress {
    type: sum
    sql: ${completion_progress} ;;
  }

  measure: average_completion_progress {
    type: average
    sql: ${completion_progress} ;;
  }

  dimension: completion_progress_category {
    type: string
    sql: ${TABLE}.completion_progress_category ;;
  }

  dimension: completion_status {
    type: string
    sql: ${TABLE}.completion_status ;;
  }

  dimension: content_progress_combined {
    type: string
    sql: ${TABLE}.content_progress_combined ;;
  }

  dimension: content_received_as {
    type: string
    sql: ${TABLE}.content_received_as ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  dimension: department_id {
    type: string
    sql: ${TABLE}.department_id ;;
  }

  dimension: department_name {
    type: string
    sql: ${TABLE}.department_name ;;
  }

  dimension: department_number {
    type: string
    sql: ${TABLE}.department_number ;;
  }

  dimension: employee_id {
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: employment_status {
    type: string
    sql: ${TABLE}.employment_status ;;
  }

  dimension: entity_id {
    type: string
    sql: ${TABLE}.entity_id ;;
  }

  dimension: entity_name {
    type: string
    sql: ${TABLE}.entity_name ;;
  }

  dimension_group: first_day_of_active_engagement {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_day_of_active_engagement ;;
  }

  dimension_group: first_view {
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
    sql: ${TABLE}.first_view_date ;;
  }

  dimension: fte {
    type: string
    sql: ${TABLE}.fte ;;
  }

  dimension: initial_hire_date {
    type: string
    sql: ${TABLE}.initial_hire_date ;;
  }

  dimension: is_manager {
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_code_id {
    type: string
    sql: ${TABLE}.job_code_id ;;
  }

  dimension: job_code_name {
    type: string
    sql: ${TABLE}.job_code_name ;;
  }

  dimension: last_run {
    type: number
    sql: ${TABLE}.last_run ;;
  }

  dimension_group: latest_day_of_active_engagement {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.latest_day_of_active_engagement ;;
  }

  dimension_group: link_visited {
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
    sql: ${TABLE}.link_visited_date ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: ministry_name {
    type: string
    sql: ${TABLE}.ministry_name ;;
  }

  dimension: network_id {
    type: string
    sql: ${TABLE}.network_id ;;
  }

  dimension: paygroup {
    type: string
    sql: ${TABLE}.paygroup ;;
  }

  dimension: position_category {
    type: string
    sql: ${TABLE}.position_category ;;
  }

  dimension: position_family {
    type: string
    sql: ${TABLE}.position_family ;;
  }

  dimension: position_id {
    type: string
    sql: ${TABLE}.position_id ;;
  }

  dimension: position_level {
    type: string
    sql: ${TABLE}.position_level ;;
  }

  dimension: position_name {
    type: string
    sql: ${TABLE}.position_name ;;
  }

  dimension: position_sub_category {
    type: string
    sql: ${TABLE}.position_sub_category ;;
  }

  dimension: preferred_full_name {
    type: string
    sql: ${TABLE}.preferred_full_name ;;
  }

  dimension: rehire_date {
    type: string
    sql: ${TABLE}.rehire_date ;;
  }

  dimension: relationship_to_org {
    type: string
    sql: ${TABLE}.relationship_to_org ;;
  }

  dimension: reports_to_email {
    type: string
    sql: ${TABLE}.reports_to_email ;;
  }

  dimension: reports_to_employee_id {
    type: string
    sql: ${TABLE}.reports_to_employee_id ;;
  }

  dimension: reports_to_name {
    type: string
    sql: ${TABLE}.reports_to_name ;;
  }

  dimension: reports_to_network_id {
    type: string
    sql: ${TABLE}.reports_to_network_id ;;
  }

  dimension: termination_date {
    type: string
    sql: ${TABLE}.termination_date ;;
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

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: work_location_id {
    type: string
    sql: ${TABLE}.work_location_id ;;
  }

  dimension: work_location_name {
    type: string
    sql: ${TABLE}.work_location_name ;;
  }

  dimension: yrs_of_service {
    type: string
    sql: ${TABLE}.yrs_of_service ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_user_id {
    type: number
  sql: count(${user_id}) ;;

    drill_fields: [detail*]

  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      entity_name,
      ministry_name,
      user_full_name,
      assigned_to_group_name,
      assigned_by_name,
      department_name,
      position_name,
      reports_to_name,
      middle_name,
      work_location_name,
      preferred_full_name,
      job_code_name
    ]
  }
}
