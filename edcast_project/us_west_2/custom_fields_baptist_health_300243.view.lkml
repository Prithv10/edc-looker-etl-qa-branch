include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: baptist_health {
  allowed_values: ["edc_prod_analytics_customer_300243"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {

  dimension: bu_description_300243 {
    label: "Business Unit Description"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.bu_description ;;
  }

  dimension: clinical_300243 {
    label: "Clinical"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.clinical ;;
  }

  dimension: company_300243 {
    label: "Company"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: dep_description_300243 {
    label: "Department Description"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.dep_description ;;
  }

  dimension: direct_patient_care_300243 {
    label: "Direct Patient Care"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.direct_patient_care ;;
  }

  dimension: employee_code_300243 {
    label: "Employee Code"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.employee_code ;;
  }

  dimension: employee_type_300243 {
    label: "Employee Type"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: ethnic_group_300243 {
    label: "Ethnic Group"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.ethnic_group ;;
  }

  dimension: gender_300243 {
    label: "Gender"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: generation_300243 {
    label: "Generation"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.generation ;;
  }

  dimension: hire_date_300243 {
    label: "Hire Date"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_code_300243 {
    label: "Job Code"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_family_300243 {
    label: "Job Family"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_role_300243 {
    label: "Job Role"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.job_role ;;
  }

  dimension: job_sub_function_descr_300243{
    label: "Job Sub Function Description"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.job_sub_function_descr ;;
  }

  dimension: location_300243 {
    label: "Location"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_id_300243 {
    label: "Manager Id"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: manager_level_300243 {
    label: "Manager Level"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.manager_level ;;
  }

  dimension: promotions_300243 {
    label: "Promotions"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.promotions ;;
  }

  dimension: pt_ft_pd_300243 {
    label: "Pt Ft Pd"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.pt_ft_pd ;;
  }

  dimension: shift_300243 {
    label: "Shift"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.shift ;;
  }

  dimension: supervisor_id_300243 {
    label: "Supervisor Id"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.supervisor_id ;;
  }

  dimension: supervisor_name_300243 {
    label: "Supervisor Name"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.supervisor_name ;;
  }

  dimension: user_id_300243 {
    label: "User Id"
    required_access_grants: [baptist_health]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: vp_id_300243 {
    label: "VP Id"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.vp_id ;;
  }

  dimension: vp_name_300243 {
    label: "VP Name"
    required_access_grants: [baptist_health]
    type: string
    sql: ${TABLE}.vp_name ;;
  }

  measure: count {
    required_access_grants: [baptist_health]
    type: count
    drill_fields: []
  }
}
