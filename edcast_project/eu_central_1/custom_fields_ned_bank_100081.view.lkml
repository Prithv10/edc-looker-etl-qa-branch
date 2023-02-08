include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: ned_bank {
  allowed_values: ["edc_prod_analytics_customer_100081"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {

  dimension: area_10081 {
    label: "Area"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: city_10081 {
    label: "City"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cluster_10081 {
    label: "Cluster"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.cluster ;;
  }

  dimension: consolidate_10081 {
    label: "Consolidate"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.consolidate ;;
  }

  dimension: cost_center_name_10081 {
    label: "Cost Center Name"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.cost_center_name ;;
  }

  dimension: cost_center_number_10081 {
    label: "Cost Center Number"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.cost_center_number ;;
  }

  dimension: country_10081 {
    label: "Country"
    required_access_grants: [ned_bank]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: cp_number_10081 {
    label: "CP Number"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.cp_number ;;
  }

  dimension: employee_number_10081 {
    label: "Employee Number"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.employee_number ;;
  }

  dimension: employee_sub_group_10081 {
    label: "Employee Sub Group"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.employee_sub_group ;;
  }

  dimension: fais_affected_role_10081 {
    label: "Fais Affected Role"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.fais_affected_role ;;
  }

  dimension: gender_10081 {
    label: "Gender"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: job_family_10081 {
    label: "Job Family"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_profile_number_10081 {
    label: "Job Profile Number"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.job_profile_number ;;
  }

  dimension: job_role_level_10081 {
    label: "Job Role Level"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.job_role_level ;;
  }

  dimension: job_title_10081 {
    label: "Job Title"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: learning_manager_10081 {
    label: "Learning Manager"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.learning_manager ;;
  }

  dimension: new_joiner_10081 {
    label: "New Joiner"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.new_joiner ;;
  }

  dimension: org_unit_name_10081 {
    label: "Org Unit Name"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.org_unit_name ;;
  }

  dimension: org_unit_number_10081 {
    label: "Org Unit Number"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.org_unit_number ;;
  }

  dimension: position_title_10081 {
    label: "Position Title"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.position_title ;;
  }

  dimension: province_10081 {
    label: "Province"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: race_10081 {
    label: "Race"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.race ;;
  }

  dimension: region_10081 {
    label: "Region"
    required_access_grants: [ned_bank]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: user_id_10081 {
    label: "User ID"
    required_access_grants: [ned_bank]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_10081 {
    label: "Count"
    required_access_grants: [ned_bank]
    type: count
    drill_fields: [org_unit_name_10081, cost_center_name_10081]
  }
}
