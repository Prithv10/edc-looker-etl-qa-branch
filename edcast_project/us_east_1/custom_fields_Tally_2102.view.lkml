include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant:tally{
  allowed_values: ["edc_prod_analytics_customer_2102"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: user_id_2102 {
    label: "User Id"
    required_access_grants: [tally]
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: department_2102 {
    label: "Department"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: designation_2102 {
    label: "Designation"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.designation ;;
  }

  dimension: employee_type_2102 {
    label: "Employee Type"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: external_id_2102 {
    label: "External Id"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: function_2102 {
    label: "Function"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: gender_2102 {
    label: "Gender"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: location_2102 {
    label: "Location"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: mobile_2102 {
    label: "Mobile"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.mobile ;;
  }

  dimension: new_joinee_2102 {
    label: "New Joinee"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.new_joinee ;;
  }

  dimension: reporting_manager_2102 {
    label: "Reporting Manager"
    required_access_grants: [tally]
    type: string
    sql: ${TABLE}.reporting_manager ;;
  }

  measure: count_2102 {
    label: "Count"
    required_access_grants: [tally]
    type: count
    drill_fields: []
  }
}
