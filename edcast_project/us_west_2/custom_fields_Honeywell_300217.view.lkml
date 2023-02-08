  include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: Honeywell_300217 {
  allowed_values: ["edc_prod_analytics_customer_300217"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all cust

  dimension: city_300217 {
    label: "City"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country_300217 {
    label: "Country"
    required_access_grants: [Honeywell_300217]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_300217 {
    label: "Department"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: employee_type_300217 {
    label: "Employee Type"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: fbg_300217 {
    label: "FBG"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.fbg ;;
  }

  dimension: global_job_code_300217 {
    label: "Global Job Code"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.global_job_code ;;
  }

  dimension: global_job_title_300217 {
    label: "Global Job Title"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.global_job_title ;;
  }

  dimension: hire_date_300217 {
    label: "Hire Date"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_code_300217 {
    label: "Job Code"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_function_description_300217 {
    label: "Job Function Description"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.job_function_description ;;
  }

  dimension: job_subfunction_description_300217 {
    label: "Job Subfunction Description"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.job_subfunction_description ;;
  }

  dimension: job_title_300217 {
    label: "Job Title"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: location_300217 {
    label: "Location"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_id_300217 {
    label: "Manager Id"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: manager_indicator_300217 {
    label: "Manager Indicator"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.manager_indicator ;;
  }

  dimension: preferred_name_300217 {
    label: "Preferred Name"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.preferred_name ;;
  }

  dimension: region_300217 {
    label: "Region"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: salary_band_300217 {
    label: "Salary band"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.salary_band ;;
  }

  dimension: sbe_300217 {
    label: "SBE"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.sbe ;;
  }

  dimension: sbg_300217 {
    label: "SBG"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.sbg ;;
  }

  dimension: sbu_300217 {
    label: "SBU"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.sbu ;;
  }

  dimension: sbx_300217 {
    label: "SBX"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.sbx ;;
  }

  dimension: state_300217 {
    label: "State"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: term_date_300217 {
    label: "Term Date"
    required_access_grants: [Honeywell_300217]
    type: string
    sql: ${TABLE}.term_date ;;
  }

  dimension: user_id_300217 {
    label: "User Id"
    required_access_grants: [Honeywell_300217]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: zip_300217 {
    label: "ZIP"
    required_access_grants: [Honeywell_300217]
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count_300217 {
    label: "Count"
    required_access_grants: [Honeywell_300217]
    type: count
    drill_fields: []
  }
}
