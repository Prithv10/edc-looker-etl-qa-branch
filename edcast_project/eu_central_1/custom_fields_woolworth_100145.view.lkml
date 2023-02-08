include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: woolworth {
  allowed_values: ["edc_prod_analytics_customer_100145"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {

  dimension: benefit_service_date_100145 {
    label: "Benefit Service Date"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.benefit_service_date ;;
  }

  dimension: company_100145 {
    label: "Company"
    required_access_grants: [woolworth]
    sql: ${TABLE}.company ;;
  }

  dimension: department_description_100145 {
    label: "Department Description"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.department_description ;;
  }

  dimension: department_id_100145 {
    label: "Department"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.department_id ;;
  }

  dimension: disability_100145 {
    label: "Disability"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.disability ;;
  }

  dimension: disability_status_y_n_100145 {
    label: "Disability Status Y/N"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.disability_status_y_n ;;
  }

  dimension: empl_class_100145 {
    label: "Empl Class"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.empl_class ;;
  }

  dimension: empl_id_100145 {
    label: "Empl Id"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.empl_id ;;
  }

  dimension: empl_sub_class_100145 {
    label: "Empl Sub Class"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.empl_sub_class ;;
  }

  dimension: everyone_100145 {
    label: "Everyone"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.everyone ;;
  }

  dimension: gender_100145 {
    label: "Gender"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: job_code_100145 {
    label: "Job Code"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_description_100145 {
    label: "Job Description"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.job_description ;;
  }

  dimension: level_3_100145 {
    label: "Level 3"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.level_3 ;;
  }

  dimension: level_4_100145 {
    label: "Level 4"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.level_4 ;;
  }

  dimension: level_5_100145 {
    label: "Level 5"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.level_5 ;;
  }

  dimension: level_of_work_100145 {
    label: "Level Of Work"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.level_of_work ;;
  }

  dimension: location_100145 {
    label: "Location"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: national_id_100145 {
    label: "National Id"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.national_id ;;
  }

  dimension: race_100145 {
    label: "Race"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.race ;;
  }

  dimension: race_revised_ethnicity_100145 {
    label: "Race Revised Ethnicity"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.race_revised_ethnicity ;;
  }

  dimension: time_in_job_100145 {
    label: "Time In Job"
    required_access_grants: [woolworth]
    type: string
    sql: ${TABLE}.time_in_job ;;
  }

  dimension: user_id_100145 {
    label: "User Id"
    required_access_grants: [woolworth]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_100145 {
    label: "Count"
    required_access_grants: [woolworth]
    type: count
    drill_fields: []
  }
}
