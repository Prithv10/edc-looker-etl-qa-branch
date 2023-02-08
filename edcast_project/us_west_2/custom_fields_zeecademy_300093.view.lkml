include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


access_grant: zeecademy {
  allowed_values: ["edc_prod_analytics_customer_300093"]
  user_attribute: database
}
  # The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {


  dimension: business_unit_300093 {
    label: "Business Unit"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: company_300093 {
    label: "Company"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: department_300093 {
    label: "Department"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: designation_300093 {
    label: "Designation"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.designation ;;
  }

  dimension: display_name_300093 {
    label: "Display Name"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: division_300093 {
    label: "Division"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: employee_class_300093 {
    label: "Employee Class"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.employee_class ;;
  }

  dimension: employee_id_300093 {
    label: "Employee Id"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: function_300093 {
    label: "Function"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: gender_300093 {
    label: "Gender"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: go1_id_300093 {
    label: "Go1 Id"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.go1_id ;;
  }

  dimension: hire_date_300093 {
    label: "Hire Date"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: hrbp_email_300093 {
    label: "HRBP Email"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.hrbp_email ;;
  }

  dimension: hrbp_id_300093 {
    label: "HRBP Id"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.hrbp_id ;;
  }

  dimension: hrbp_name_300093 {
    label: "HRBP Name"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.hrbp_name ;;
  }

  dimension: hrm_email_300093 {
    label: "HRM Email"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.hrm_email ;;
  }

  dimension: hrm_id_300093{
    label: "HRM Id"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.hrm_id ;;
  }

  dimension: hrm_name_300093 {
    label: "HRM Name"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.hrm_name ;;
  }

  dimension: is_manager_300093 {
    label: "Is Manager?"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_band_300093 {
    label: "Job Band"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.job_band ;;
  }

  dimension: location_300093 {
    label: "Location"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_email_id_300093 {
    label: "Manager Email Id"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.manager_email_id ;;
  }

  dimension: manager_employee_id_300093 {
    label: "Manager Employee Id"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.manager_employee_id ;;
  }

  dimension: manager_name_300093 {
    label: "Manager Name"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: sap_id_300093 {
    label: "SAP Id"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.sap_id ;;
  }

  dimension: sub_division_300093 {
    label: "Sub Division"
    required_access_grants: [zeecademy]
    type: string
    sql: ${TABLE}.sub_division ;;
  }

  dimension: user_id_300093 {
    label: "User Id"
    required_access_grants: [zeecademy]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    required_access_grants: [zeecademy]
    type: count
    drill_fields: []
  }

  measure: count_sap_id {
    required_access_grants: [zeecademy]
    type: number
    sql: count(${sap_id_300093}) ;;
    drill_fields: []
  }

}
