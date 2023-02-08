  include: "/edcast_project/views/original_views/*.view.lkml"
  include: "/edcast_project/us_west_2/*.view.lkml"
#include: "/edcast_project/us_west_2/cf_0_latest_user_details_vw_2.view.lkml"

access_grant: WBA_Learning {
  allowed_values: ["edc_prod_analytics_customer_300113"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: division_300113 {
    label: "Division"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: employee_type_300113 {
    label: "Employee Type"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: entity_300113 {
    label: "Entity"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.entity ;;
  }

  dimension: gb_function_300113 {
    label: "GB Function"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.gb_function ;;
  }

  dimension: global_academy_300113 {
    label: "Global Academy"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.global_academy ;;
  }

  dimension: grade_300113 {
    label: "Grade"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: location_300113 {
    label: "Location"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: reporting_staff_number_300113 {
    label: "Reporting Staff Number"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.reporting_staff_number ;;
  }

  dimension: sub_function_300113 {
    label: "Sub Function"
    required_access_grants: [WBA_Learning]
    type: string
    sql: ${TABLE}.sub_function ;;
  }

  dimension: user_id_300113 {
    label: "User ID"
    required_access_grants: [WBA_Learning]
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300113 {
    label: "Count"
    required_access_grants: [WBA_Learning]
    type: count
    drill_fields: []
  }
}
