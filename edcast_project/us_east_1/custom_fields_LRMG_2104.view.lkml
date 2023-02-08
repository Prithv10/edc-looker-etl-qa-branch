include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant:LRMG{
  allowed_values: ["edc_prod_analytics_customer_2104"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {

  dimension: business_unit_2104 {
    label: "Business Unit"
    required_access_grants: [LRMG]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: contract_type_2104 {
    label: "Contract Type"
    required_access_grants: [LRMG]
    type: string
    sql: ${TABLE}.contract_type ;;
  }

  dimension: employee_code_2104 {
    label: "Employee Code"
    required_access_grants: [LRMG]
    type: string
    sql: ${TABLE}.employee_code ;;
  }

  dimension: gender_2104 {
    label: "Gender"
    required_access_grants: [LRMG]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: location_2104 {
    label: "Location"
    required_access_grants: [LRMG]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_direct_first_line_2104 {
    label: "Manager Direct First Line"
    required_access_grants: [LRMG]
    type: string
    sql: ${TABLE}.manager_direct_first_line ;;
  }

  dimension: race_2104 {
    label: "Race"
    required_access_grants: [LRMG]
    type: string
    sql: ${TABLE}.race ;;
  }

  dimension: user_id_2104 {
    label: "User Id"
    required_access_grants: [LRMG]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_2104 {
    label: "Count"
    required_access_grants: [LRMG]
    type: count
    drill_fields: []
  }
}
