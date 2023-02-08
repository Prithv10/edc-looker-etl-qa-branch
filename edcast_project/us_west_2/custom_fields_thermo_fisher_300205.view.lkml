include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

#include: "/edcast_project/us_west_2/cf_0_latest_user_details_vw_2.view.lkml"


access_grant: thermo_fisher {
  allowed_values: ["edc_prod_analytics_customer_300205"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {

  dimension: band_300205 {
    label: "Band"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.band ;;
  }

  dimension: business_group_300205 {
    label: "Business Group"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.business_group ;;
  }

  dimension: business_unit_300205 {
    label: "Business Unit"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: cost_center_300205 {
    label: "Cost Center"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: country_300205 {
    label: "Country"
    required_access_grants: [thermo_fisher]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: division_300205 {
    label: "Division"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: hire_date_300205 {
    label: "Hire Date"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: is_manager_300205 {
    label: "Is Manager?"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: is_new_manager_300205 {
    label: "Is New Manager?"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.is_new_manager ;;
  }

  dimension: job_family_300205 {
    label: "Job Family"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_family_group_300205 {
    label: "Job Family Group"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.job_family_group ;;
  }

  dimension: job_location_300205 {
    label: "Job Location"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.job_location ;;
  }

  dimension: lms_id_300205 {
    label: "LMS Id"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.lms_id ;;
  }

  dimension: region_300205 {
    label: "Region"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: status_300205 {
    label: "Status"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: time_in_job_profile_300205 {
    label: "Time In Job Profile"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.time_in_job_profile ;;
  }

  dimension: time_in_position_300205 {
    label: "Time In Position"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.time_in_position ;;
  }

  dimension: track_300205 {
    label: "Track"
    required_access_grants: [thermo_fisher]
    type: string
    sql: ${TABLE}.track ;;
  }

  dimension: user_id_300205 {
    label: "User Id"
    required_access_grants: [thermo_fisher]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    required_access_grants: [thermo_fisher]
    type: count
    drill_fields: []
  }
}
