include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: greenhouse{
  allowed_values: ["edc_prod_analytics_customer_100080"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {


  dimension: _3_months_new_hire_100080 {
    label: "3 Months New Hire"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}._3_months_new_hire ;;
  }

  dimension: _6_months_new_hire_100080 {
    label: "6 Months New Hire"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}._6_months_new_hire ;;
  }

  dimension: business_unit_100080 {
    label: "Business Unit"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: contingent_worker_100080 {
    label: "Contingent Worker"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.contingent_worker ;;
  }

  dimension: cost_center_100080 {
    label: "Cost Center"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: country_100080 {
    label: "Country"
    required_access_grants: [greenhouse]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: employee_id_100080 {
    label: "Employee ID"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: employee_type_100080 {
    label: "Employee Type"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: first_day_as_manager_100080 {
    label: "First Day As Manager"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.first_day_as_manager ;;
  }

  dimension: hire_date_100080 {
    label: "Hire Date"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: is_manager_100080 {
    label: "Is Manager"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_title_100080 {
    label: "Job Title"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: level_04_from_top_100080 {
    label: "Level 04 From Top"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.level_04_from_top ;;
  }

  dimension: level_05_from_top_100080 {
    label: "Level 05 From Top"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.level_05_from_top ;;
  }

  dimension: location_100080 {
    label: "Location"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_email_100080 {
    label: "Manager Email"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_external_id_100080 {
    label: "Manager External ID"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.manager_external_id ;;
  }

  dimension: manager_id_100080 {
    label: "Manager ID"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: manager_name_100080 {
    label: "Manager Name"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: region_100080 {
    label: "Region"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: span_of_control_permanent_100080 {
    label: "Span Of Control Permanent"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.span_of_control_permanent ;;
  }

  dimension: span_of_control_rest_100080 {
    label: "Span Of Control Rest"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.span_of_control_rest ;;
  }

  dimension: status_100080 {
    label: "Status"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: supervisory_organization_100080 {
    label: "Supervisory Organisation"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.supervisory_organization ;;
  }

  dimension: us_state_100080 {
    label: "US State"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.us_state ;;
  }

  dimension: user_id_100080 {
    label: "User ID"
    required_access_grants: [greenhouse]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: worker_type_100080 {
    label: "Worker Type"
    required_access_grants: [greenhouse]
    type: string
    sql: ${TABLE}.worker_type ;;
  }

  measure: count_100080 {
    label: "Count"
    required_access_grants: [greenhouse]
    type: count
    drill_fields: [manager_name_100080]
  }
}
