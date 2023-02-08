include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: J&J {
  allowed_values: ["edc_prod_analytics_customer_300276"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"

view: +cf_0_latest_user_details_vw_2 {

  dimension: city_300276 {
    label: "City"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cost_center_300276 {
    label: "Cost Center"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: ec_member_300276 {
    label: "EC Member"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.ec_member ;;
  }

  dimension: grade_group_300276 {
    label: "Grade Group"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.grade_group ;;
  }

  dimension: hr_sector_300276 {
    label: "HR Sector"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.hr_sector ;;
  }

  dimension: is_manager_300276 {
    label: "Is Manager?"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: is_managerofmanagers_300276 {
    label: "Is Manager of Managers?"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.is_managerofmanagers ;;
  }

  dimension: job_function_300276 {
    label: "Job Function"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.job_function ;;
  }

  dimension: job_id_300276 {
    label: "Job Id"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_subfunction_300276 {
    label: "Job Subfunction"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.job_subfunction ;;
  }

  dimension: legal_entity_300276 {
    label: "Legal Entity"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.legal_entity ;;
  }

  dimension: level_02_name_wwid_300276 {
    label: "Level 02 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_02_name_wwid ;;
  }

  dimension: level_02_wwid_300276 {
    label: "Level 02 WWID"
    required_access_grants: [J&J]
    type: string
    sql: (CASE when LENGTH(${TABLE}.level_02_name_wwid)>1 then 'Populated Level 02 WWID' else 'Blank Level 02 WWID' end) ;;
  }

  dimension: level_03_name_wwid_300276 {
    label: "Level 03 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_03_name_wwid ;;
  }

  dimension: level_04_name_wwid_300276 {
    label: "Level 04 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_04_name_wwid ;;
  }

  dimension: level_05_name_wwid_300276 {
    label: "Level 05 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_05_name_wwid ;;
  }

  dimension: level_06_name_wwid_300276 {
    label: "Level 06 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_06_name_wwid ;;
  }

  dimension: level_07_name_wwid_300276 {
    label: "Level 07 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_07_name_wwid ;;
  }

  dimension: level_08_name_wwid_300276 {
    label: "Level 08 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_08_name_wwid ;;
  }

  dimension: level_09_name_wwid_300276 {
    label: "Level 09 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_09_name_wwid ;;
  }

  dimension: level_10_name_wwid_300276 {
    label: "Level 10 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_10_name_wwid ;;
  }

  dimension: level_11_name_wwid_300276 {
    label: "Level 11 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_11_name_wwid ;;
  }

  dimension: level_12_name_wwid_300276{
    label: "Level 12 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_12_name_wwid ;;
  }

  dimension: level_13_name_wwid_300276 {
    label: "Level 13 Name WWID"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.level_13_name_wwid ;;
  }

  dimension: most_recent_hire_date_300276 {
    label: "Most Recent Hire Date"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.most_recent_hire_date ;;
  }

  dimension: mrc_300276 {
    label: "MRC"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.mrc ;;
  }

  dimension: number_directreports_300276 {
    label: "Number Direct Reports"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.number_directreports ;;
  }

  dimension: OneHR_300276 {
    label: "OneHR"
    required_access_grants: [J&J]
    #(CASE when `Level 03 Name WWID`='Fasolo, Peter (338435)' or `Level 05 Name WWID`='DUCKWORTH, PATRICE (1011760)' then 'OneHR' else 'Others' end)
    type: string
    sql: (CASE when ${level_05_name_wwid_300276}='Fasolo, Peter (338435)' or ${level_05_name_wwid_300276}='Duckworth, Patrice (1011760)' then 'OneHR' else 'Others' end) ;;
  }
  dimension: Org_300276 {
    label: "Org"
    required_access_grants: [J&J]
    #(CASE when `Level 03 Name WWID`='Fasolo, Peter (338435)' then 'Peter' when `Level 05 Name WWID`='Duckworth, Patrice (1011760)' then 'Patrice' else 'other' end)
    type: string
    sql:  (CASE when ${level_03_name_wwid_300276}='Fasolo, Peter (338435)' then 'Peter' when ${level_05_name_wwid_300276}='Duckworth, Patrice (1011760)' then 'Patrice' else 'other' end);;
  }

  dimension: Supervisory_Org_300276 {
    label: "Supervisory Org"
    required_access_grants: [J&J]
    #(CASE when `Level 03 Name WWID`='Fasolo, Peter (338435)' then 'Peter Fasolo' when `Level 05 Name WWID`='Duckworth, Patrice (1011760)' then 'Patrice Duckworth' else 'Other' end)
    type: string
    sql: (CASE when ${level_03_name_wwid_300276}='Fasolo, Peter (338435)' then 'Peter Fasolo' when ${level_05_name_wwid_300276}='Duckworth, Patrice (1011760)' then 'Patrice Duckworth' else 'Other' end) ;;
  }
  measure: count_OneHR_300276 {
    label: "Count OneHR"
    required_access_grants: [J&J]
    type: number
    sql: count(${OneHR_300276}) ;;

  }
  dimension: original_hire_date_300276 {
    label: "Original Hire Date"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.original_hire_date ;;
  }

  dimension: sector_code_300276 {
    label: "Sector Code"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.sector_code ;;
  }

  dimension: state_300276 {
    label: "State"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: time_in_current_job_profile_300276 {
    label: "Time In Current Job Profile"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.time_in_current_job_profile ;;
  }

  dimension: time_in_current_position_300276 {
    label: "Time In Current Position"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.time_in_current_position ;;
  }

  dimension: time_since_most_recent_hire_date_300276 {
    label: "Time Since Most Recent Hire Date"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.time_since_most_recent_hire_date ;;
  }

  dimension: user_id_300276 {
    label: "User Id"
    required_access_grants: [J&J]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: work_country_300276 {
    map_layer_name: "countries"
    label: "Work Country"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.work_country ;;
  }

  dimension: work_country_location_300276 {
    map_layer_name: "countries"
    label: "Work Country Location"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.work_country_location ;;
  }

  dimension: work_region_code_300276 {
    label: "Work Region Code"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.work_region_code ;;
  }

  dimension: workday_location_code_300276 {
    label: "Workday Location Code"
    required_access_grants: [J&J]
    type: string
    sql: ${TABLE}.workday_location_code ;;
  }

  measure: count_300276 {
    label: "Count"
    required_access_grants: [J&J]
    type: count
    drill_fields: []
  }
}
