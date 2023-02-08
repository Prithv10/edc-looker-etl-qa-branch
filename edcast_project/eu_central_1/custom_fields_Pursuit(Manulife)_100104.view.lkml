  include: "/edcast_project/views/original_views/*.view.lkml"
  include: "/edcast_project/eu_central_1/*.view.lkml"

  access_grant: Pursuit(Manulife) {
    allowed_values: ["edc_prod_analytics_customer_100104"]
    user_attribute: database
  }

  view: +cf_0_latest_user_details_vw_1 {

  dimension: business_unit_level_2_100104 {
    label: "Business Unit Level 2"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.business_unit_level_2 ;;
  }

  dimension: business_unit_level_3_100104 {
    label: "Business Unit Level 3"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.business_unit_level_3 ;;
  }

  dimension: business_unit_level_4_100104 {
    label: "Business Unit Level 4"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.business_unit_level_4 ;;
  }

  dimension: business_unit_level_5_100104 {
    label: "Business Unit Level 5"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.business_unit_level_5 ;;
  }

  dimension: business_unit_level_6_100104 {
    label: "Business Unit Level 6"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.business_unit_level_6 ;;
  }

  dimension: company_100104 {
    label: "Company"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: continuous_service_date_100104 {
    label: "Continuous Service Date"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.continuous_service_date ;;
  }

  dimension: cost_center_id_100104 {
    label: "Cost Center ID"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.cost_center_id ;;
  }

  dimension: cost_center_name_100104 {
    label: "Cost Center Name"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.cost_center_name ;;
  }

  dimension: csod_user_id_100104 {
    label: "CSOD User ID"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.csod_user_id ;;
  }

  dimension: global_grade_100104 {
    label: "Global Grade"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.global_grade ;;
  }

  dimension: job_code_100104 {
    label: "Job Code"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_family_100104 {
    label: "Job Family"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: manager_last_name_100104 {
    label: "Manager Last Name"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_last_name ;;
  }

  dimension: manager_level_02_100104 {
    label: "Manager Level 02"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_level_02 ;;
  }

  dimension: manager_level_03_100104 {
    label: "Manager Level 03"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_level_03 ;;
  }

  dimension: manager_level_04_100104 {
    label: "Manager Level 04"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_level_04 ;;
  }

  dimension: manager_level_05_100104 {
    label: "Manager Level 05"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_level_05 ;;
  }

  dimension: manager_level_06_100104 {
    label: "Manager Level 06"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_level_06 ;;
  }

  dimension: manager_level_07_100104 {
    label: "Manager Level 07"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_level_07 ;;
  }

  dimension: manager_level_08_100104 {
    label: "Manager Level 08"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_level_08 ;;
  }

  dimension: manager_name_100104 {
    label: "Manager Name"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: new_hire_100104 {
    label: "New Hire"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.new_hire ;;
  }

  dimension: od_function_100104 {
    label: "OD Functionn"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.od_function ;;
  }

  dimension: people_leader_100104 {
    label: "People Leader"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.people_leader ;;
  }

  dimension: ps_user_id_100104 {
    label: "PS User ID"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.ps_user_id ;;
  }

  dimension: segment_grouping_cf_100104 {
    label: "Segment Grouping CF"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.segment_grouping_cf ;;
  }

  dimension: state_province_100104 {
    label: "State Province"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.state_province ;;
  }

  dimension: user_id_100104 {
    label: "User ID"
    required_access_grants: [Pursuit(Manulife)]
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name_100104 {
    label: "User Name"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: work_location_address_country_100104 {
    label: "Work Location Address Country"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.work_location_address_country ;;
  }

  dimension: work_location_city_100104 {
    label: "Work Location City"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.work_location_city ;;
  }

  dimension: work_location_name_100104 {
    label: "Work Location Name"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.work_location_name ;;
  }

  dimension: worker_type_100104 {
    label: "Worker Type"
    required_access_grants: [Pursuit(Manulife)]
    type: string
    sql: ${TABLE}.worker_type ;;
  }

  measure: count_100104 {
    label: "Count"
    required_access_grants: [Pursuit(Manulife)]
    type: count
    drill_fields: [user_name_100104, manager_last_name_100104, cost_center_name_100104, work_location_name_100104, manager_name_100104]
  }
}
