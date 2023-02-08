include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: tetrapak{
  allowed_values: ["edc_prod_analytics_customer_100058"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {

  dimension: business_unit_l1_100058 {
    label: "Business Unit L1"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.business_unit_l1 ;;
  }

  dimension: business_unit_l1_id_100058 {
    label: "Business Unit L1 ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.business_unit_l1_id ;;
  }

  dimension: category_0_to_30_100058 {
    label: "Category 0 to 30"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.category_0_to_30 ;;
  }

  dimension: category_181_to_365_100058 {
    label: "Category 181 to 365"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.category_181_to_365 ;;
  }

  dimension: category_31_to_90_100058 {
    label: "Category 31 to 90"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.category_31_to_90 ;;
  }

  dimension: category_91_to_180_100058 {
    label: "Category 91 to 180"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.category_91_to_180 ;;
  }

  dimension: country_100058 {
    label: "Country"
    required_access_grants: [tetrapak]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_l2_100058 {
    label: "Department L2"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.department_l2 ;;
  }

  dimension: department_l2_id_100058 {
    label: "Department L2 ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.department_l2_id ;;
  }

  dimension: department_l3_100058 {
    label: "Department L3"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.department_l3 ;;
  }

  dimension: department_l3_id_100058 {
    label: "Department L3 ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.department_l3_id ;;
  }

  dimension: division_l3_100058 {
    label: "Division L3"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.division_l3 ;;
  }

  dimension: division_l3_id_100058 {
    label: "Division L3 ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.division_l3_id ;;
  }

  dimension: ec_employee_status_100058 {
    label: "Ec Employee Status"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.ec_employee_status ;;
  }

  dimension: employee_class_100058 {
    label: "Employee Class"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.employee_class ;;
  }

  dimension: employee_id_100058 {
    label: "Employee ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: employee_type_100058 {
    label: "Employee Type"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: first_name_100058 {
    label: "First Name"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender_100058 {
    label: "Gender"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: hire_date_100058 {
    label: "Hire Date"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: hire_date_difference_100058 {
    label: "Hire Date Difference"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.hire_date_difference ;;
  }

  dimension: is_manager_100058 {
    label: "Is Manager"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_function_100058 {
    label: "Job Function"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.job_function ;;
  }

  dimension: job_id_100058 {
    label: "Job ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_level_100058 {
    label: "Job Level"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.job_level ;;
  }

  dimension: last_name_100058 {
    label: "Last Name"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: lms_service_centre_code_100058 {
    label: "Lms Service Centre Code"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.lms_service_centre_code ;;
  }

  dimension: location_id_100058 {
    label: "Location ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: manager_email_100058 {
    label: "Manager Email"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_first_name_100058 {
    label: "Manager First Name"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.manager_first_name ;;
  }

  dimension: manager_last_name_100058 {
    label: "Manager Last Name"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.manager_last_name ;;
  }

  dimension: organisation_l2_100058 {
    label: "Organisation L2"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.organisation_l2 ;;
  }

  dimension: organisation_l2_id_100058 {
    label: "Organisation L2 ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.organisation_l2_id ;;
  }

  dimension: organisation_l4_100058 {
    label: "Organisation L4"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.organisation_l4 ;;
  }

  dimension: organisation_l4_id_100058 {
    label: "Organisation L4 ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.organisation_l4_id ;;
  }

  dimension: position_code_100058 {
    label: "Position Code"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.position_code ;;
  }

  dimension: position_title_100058 {
    label: "Position Title"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.position_title ;;
  }

  dimension: top_organisation_l1_100058 {
    label: "Top Organisation L1"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.top_organisation_l1 ;;
  }

  dimension: top_organisation_l1_id_100058 {
    label: "Top Organisation L1 ID"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.top_organisation_l1_id ;;
  }

  dimension: user_id_100058 {
    label: "User ID"
    required_access_grants: [tetrapak]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: username_100058 {
    label: "Username"
    required_access_grants: [tetrapak]
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count_100058 {
    label: "Count"
    required_access_grants: [tetrapak]
    type: count

  }
}
