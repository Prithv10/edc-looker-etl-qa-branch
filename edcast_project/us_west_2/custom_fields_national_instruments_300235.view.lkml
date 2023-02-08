include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


access_grant: national_instruments {
  allowed_values: ["edc_prod_analytics_customer_300235"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {

  dimension: assignment_category_300235 {
    label: "Assignment Category"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.assignment_category ;;
  }

  dimension: assignment_status_300235 {
    label: "Assignment Status"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.assignment_status ;;
  }

  dimension: business_unit_300235 {
    label: "Business Unit"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: company_code_300235 {
    label: "Company Code"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension: cost_center_300235 {
    label: "Cost Center"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: department_300235 {
    label: "Department"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: eeo_category_300235 {
    label: "EEO Category"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.eeo_category ;;
  }

  dimension: frequency_300235 {
    label: "Frequency"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.frequency ;;
  }

  dimension: grade_300235 {
    label: "Grade"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: hours_300235 {
    label: "Hours"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.hours ;;
  }

  dimension: hr_job_title_300235 {
    label: "HR Job Title"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.hr_job_title ;;
  }

  dimension: job_family_300235 {
    label: "Job Family"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_level_300235 {
    label: "Job Level"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.job_level ;;
  }

  dimension: job_title_300235 {
    label: "Job Title"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: legal_employer_300235 {
    label: "Legal Employer"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.legal_employer ;;
  }

  dimension: legal_employer_hire_date_300235 {
    label: "Legal Employer Hire Date"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.legal_employer_hire_date ;;
  }

  dimension: line_manager_email_300235 {
    label: "Line Manager Email"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.line_manager_email ;;
  }

  dimension: location_300235 {
    label: "Location"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_300235 {
    label: "Manager"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.manager ;;
  }

  dimension: manager_flag_300235 {
    label: "Manager Flag"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.manager_flag ;;
  }

  dimension: original_date_of_hire_300235 {
    label: "Original Date of Hire"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.original_date_of_hire ;;
  }

  dimension: person_type_300235 {
    label: "Person Type"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.person_type ;;
  }

  dimension: preferred_first_name_300235 {
    label: "Preferred First Name"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.preferred_first_name ;;
  }

  dimension: status_300235 {
    label: "Status"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id_300235 {
    label: "User Id"
    required_access_grants: [national_instruments]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: worker_type_300235 {
    label: "Worker Type"
    required_access_grants: [national_instruments]
    type: string
    sql: ${TABLE}.worker_type ;;
  }

  measure: count {
    required_access_grants: [national_instruments]
    type: count
    drill_fields: []
  }
}
