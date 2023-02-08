include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant:ABG{
  allowed_values: ["edc_prod_analytics_customer_1603"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {


  dimension: business_ho_1603 {
    label: "Business HO"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.business_ho ;;
  }

  dimension: business_unit_1603 {
    label: "Business Unit"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: cadre_1603 {
    label: "Cadre"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.cadre ;;
  }

  dimension: country_1603 {
    label: "Country"
    required_access_grants: [ABG]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: date_of_joining_1603 {
    label: "Date Of Joining"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.date_of_joining ;;
  }

  dimension: department_1603 {
    label: "Department"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: designation_1603 {
    label: "Designation"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.designation ;;
  }

  dimension: employee_status_1603 {
    label: "Employee Status"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.employee_status ;;
  }

  dimension: functional_designation_1603 {
    label: "Functional Designationt"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.functional_designation ;;
  }

  dimension: job_band_1603 {
    label: "Job Band"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.job_band ;;
  }

  dimension: job_function_1603 {
    label: "Job Function"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.job_function ;;
  }

  dimension: l1_manager_code_1603 {
    label: "L1 Manager Code"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.l1_manager_code ;;
  }

  dimension: l1_manager_email_id_1603 {
    label: "L1 Manager Email ID"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.l1_manager_email_id ;;
  }

  dimension: l1_manager_name_1603 {
    label: "L1 Manager Name"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.l1_manager_name ;;
  }

  dimension: poornata_id_1603 {
    label: "Poornata ID"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.poornata_id ;;
  }

  dimension: sub_job_function_1603 {
    label: "Sub Job Function"
    required_access_grants: [ABG]
    type: string
    sql: ${TABLE}.sub_job_function ;;
  }

  dimension: user_id_1603 {
    label: "User ID"
    required_access_grants: [ABG]
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count_1603 {
    label: "Count"
    required_access_grants: [ABG]
    type: count
    drill_fields: [l1_manager_name_1603]
  }
}
