 include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"
  access_grant: hmgroup {
    allowed_values: ["edc_prod_analytics_customer_100143"]
    user_attribute: database
  }

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_1 {


  dimension: brand_100143 {
    label: "Brand"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: business_area_100143 {
    label: "Business Area"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.business_area ;;
  }

  dimension: business_function_100143 {
    label: "Business Function"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.business_function ;;
  }

  dimension: business_group_region_100143 {
    label: "Business Group Region"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.business_group_region ;;
  }

  dimension: business_type_100143 {
    label: "Business Type"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.business_type ;;
  }

  dimension: country_100143 {
    label: "Country"
    required_access_grants: [hmgroup]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_store_100143 {
    label: "Department"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.department_store ;;
  }

  dimension: employee_class_100143 {
    label: "Employee Class"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.employee_class ;;
  }

  dimension: grow_id_100143 {
    label: "Grow ID"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.grow_id ;;
  }

  dimension: job_role_100143 {
    label: "Job Role"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.job_role ;;
  }

  dimension: location_100143 {
    label: "Location"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: original_start_date_100143 {
    label: "Orginal Start Date"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.original_start_date ;;
  }

  dimension: position_entry_date_100143 {
    label: "Position Entry Date"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.position_entry_date ;;
  }

  dimension: termination_date_100143 {
    label: "Termination Date"
    required_access_grants: [hmgroup]
    type: string
    sql: ${TABLE}.termination_date ;;
  }

  dimension: user_id_100143 {
    label: "User ID"
    required_access_grants: [hmgroup]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_100143 {
    label: "Count"
    required_access_grants: [hmgroup]
    type: count
    drill_fields: []
  }
}
