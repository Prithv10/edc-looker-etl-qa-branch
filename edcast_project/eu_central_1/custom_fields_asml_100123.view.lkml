include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: asml{
  allowed_values: ["edc_prod_analytics_customer_100123"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {

  dimension: cost_centre_100123 {
    label: "Cost Centre"
    required_access_grants: [asml]
    type: string
    sql: ${TABLE}.cost_centre ;;

  }

  dimension: department_100123 {
    label: "Department"
    required_access_grants: [asml]
    type: string
    sql: ${TABLE}.department ;;

  }

  dimension: employee_type_100123 {
    label: "Employee Type"
    required_access_grants: [asml]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: employeenumber_100123 {
    label: "Employeenumber"
    required_access_grants: [asml]
    type: string
    sql: ${TABLE}.employeenumber ;;
  }

  dimension: region_100123 {
    label: "Region"
    required_access_grants: [asml]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: user_id_100123 {
    label: "User ID"
    required_access_grants: [asml]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_id_custom_field_100123 {
    label: "User Id Custom Field"
    required_access_grants: [asml]
    type: string
    sql: ${TABLE}.user_id_custom_field ;;
  }

  dimension: work_country_100123 {
    label: "Work Country"
    required_access_grants: [asml]
    type: string
    sql: ${TABLE}.work_country ;;
  }

  dimension: workcountry_100123 {
    label: "Workcountry"
    required_access_grants: [asml]
    type: string
    sql: ${TABLE}.workcountry ;;
  }

  measure: count_100123 {
    label: "Count"
    required_access_grants: [asml]
    type: count
    drill_fields: []
  }
}
