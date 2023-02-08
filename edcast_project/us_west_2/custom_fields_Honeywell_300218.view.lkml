include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: Honeywell_300218 {
  allowed_values: ["edc_prod_analytics_customer_300218"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all cust

  dimension: city_300218 {
    label: "City"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country_300218 {
    label: "Country"
    required_access_grants: [Honeywell_300218]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_300218 {
    label: "Department"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: employee_type_300218 {
    label: "Employee Type"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: fbg_300218 {
    label: "FBG"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.fbg ;;
  }

  dimension: global_job_code_300218 {
    label: "Global Job Code"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.global_job_code ;;
  }

  dimension: global_job_title_300218 {
    label: "Global Job Title"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.global_job_title ;;
  }

  dimension: hire_date_300218 {
    label: "Hire Date"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_code_300218 {
    label: "Job Code"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_function_description_300218 {
    label: "Job Function Description"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.job_function_description ;;
  }

  dimension: job_subfunction_description_300218 {
    label: "Job Subfunction Description"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.job_subfunction_description ;;
  }

  dimension: job_title_300218 {
    label: "Job Title"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: location_300218 {
    label: "Location"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_id_300218 {
    label: "Manager Id"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: manager_indicator_300218 {
    label: "Manager Indicator"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.manager_indicator ;;
  }

  dimension: preferred_name_300218 {
    label: "Preferred Name"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.preferred_name ;;
  }

  dimension: region_300218 {
    label: "Region"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: rehire_date_300218 {
    label: "Rehire Date"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.rehire_date ;;
  }

  dimension: salary_band_300218 {
    label: "Salary Band"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.salary_band ;;
  }

  dimension: sbe_300218 {
    label: "SBE"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.sbe ;;
  }

  dimension: sbg_300218 {
    label: "SBG"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.sbg ;;
  }

  dimension: sbu_300218 {
    label: "SBU"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.sbu ;;
  }

  dimension: sbx_300218 {
    label: "SBX"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.sbx ;;
  }

  dimension: service_date_300218 {
    label: "Service Date"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.service_date ;;
  }

  dimension: state_300218 {
    label: "State"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: term_date_300218 {
    label: "Term Date"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.term_date ;;
  }

  dimension: test_date_300218 {
    label: "Test Date"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.test_date ;;
  }

  dimension: test_integer_300218 {
    label: "Test Integer"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.test_integer ;;
  }

  dimension: tier2_eid_300218 {
    label: "Tier 2 EID"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.tier2_eid ;;
  }

  dimension: tier_2_300218 {
    label: "Tier 2"
    required_access_grants: [Honeywell_300218]
    type: string
    sql: ${TABLE}.tier_2 ;;
  }

  dimension: user_id_300218 {
    label: "User Id"
    required_access_grants: [Honeywell_300218]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: zip_300218{
    label: "ZIP"
    required_access_grants: [Honeywell_300218]
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count_300218 {
    label: "Count"
    required_access_grants: [Honeywell_300218]
    type: count
    drill_fields: []
  }
}
