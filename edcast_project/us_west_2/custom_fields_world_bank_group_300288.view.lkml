include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


access_grant: world_bank_group {
  allowed_values: ["edc_prod_analytics_customer_300288"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {


  dimension: appointment_type_300288 {
    label: "Appointment Type"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.appointment_type ;;
  }

  dimension: country_300288 {
    label: "Country"
    required_access_grants: [world_bank_group]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: functional_mapping_division_stream_300288 {
    label: "Functional Mapping Division Stream"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.functional_mapping_division_stream ;;
  }

  dimension: gender_300288 {
    label: "Gender"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: grade_300288 {
    label: "Grade"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: grade_group_300288 {
    label: "Grade Group"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.grade_group ;;
  }

  dimension: hq_co_flag_300288 {
    label: "HQ CO Flag"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.hq_co_flag ;;
  }

  dimension: location_duty_station_300288 {
    label: "Location Duty Station"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.location_duty_station ;;
  }

  dimension: manager_id_300288 {
    label: "Manager Id"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: official_oui_300288 {
    label: "Official OUI"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.official_oui ;;
  }

  dimension: official_unit_300288 {
    label: "Official Unit"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.official_unit ;;
  }

  dimension: organization_300288 {
    label: "Organization"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: pmu_300288 {
    label: "PMU"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.pmu ;;
  }

  dimension: professional_family_mapping_300288 {
    label: "Professional Family Mapping"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.professional_family_mapping ;;
  }

  dimension: professional_mapping_300288 {
    label: "Professional Mapping"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.professional_mapping ;;
  }

  dimension: region_300288 {
    label: "Region"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: ssa_cr_300288 {
    label: "SSA_CR"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.ssa_cr ;;
  }

  dimension: tier_300288 {
    label: "Tier"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.tier ;;
  }

  dimension: time_in_current_pmu_years_x_10_300288 {
    label: "Time In Current PMU Years x 10"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.time_in_current_pmu_years_x_10 ;;
  }

  dimension: time_in_wbg_years_x_10_300288 {
    label: "Time In WBG Years x 10"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.time_in_wbg_years_x_10 ;;
  }

  dimension: time_zone_300288 {
    label: "Time Zone"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: ttl_status_dpf_300288 {
    label: "TTL Status DPF"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.ttl_status_dpf ;;
  }

  dimension: ttl_status_ipf_300288 {
    label: "TTL Status IPF"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.ttl_status_ipf ;;
  }

  dimension: user_id_300288 {
    label: "User Id"
    required_access_grants: [world_bank_group]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_s_official_job_300288 {
    label: "User's Official Job"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.user_s_official_job ;;
  }

  dimension: user_type_300288 {
    label: "User Type"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: working_oui_300288 {
    label: "Working OUI"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.working_oui ;;
  }

  dimension: working_unit_300288 {
    label: "Working Unit"
    required_access_grants: [world_bank_group]
    type: string
    sql: ${TABLE}.working_unit ;;
  }

  measure: count {
    required_access_grants: [world_bank_group]
    type: count
    drill_fields: []
  }
}
