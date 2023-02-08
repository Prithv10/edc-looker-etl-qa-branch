include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant: Learning_Collective_ICONIC{
  allowed_values: ["edc_prod_analytics_customer_2073"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_3 {


  dimension: area_2073 {
    label: "Area"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: department_2073 {
    label: "Department"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: department_code_2073 {
    label: "Department Code"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.department_code ;;
  }

  dimension: employee_type_2073 {
    label: "Employee Type"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: full_name_2073 {
    label: "Full Name"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: guid_namely_2073 {
    label: "Guid Namely"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.guid_namely ;;
  }

  dimension: management_level_2073 {
    label: "Management Level"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.management_level ;;
  }

  dimension: manager_email_2073 {
    label: "Manager Email"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: office_location_2073 {
    label: "Office Location"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: position_title_2073 {
    label: "Position Title"
    required_access_grants: [Learning_Collective_ICONIC]
    type: string
    sql: ${TABLE}.position_title ;;
  }

  dimension: user_id_2073 {
    label: "User Id"
    required_access_grants: [Learning_Collective_ICONIC]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_2073 {
    label: "Count"
    required_access_grants: [Learning_Collective_ICONIC]
    type: count
    drill_fields: []
  }
}
