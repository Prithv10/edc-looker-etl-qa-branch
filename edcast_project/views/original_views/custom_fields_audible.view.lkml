include: "/edcast_project/views/original_views/*.view.lkml"

access_grant: audible {
  allowed_values: ["audible_dataset"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw {

  dimension: amazon_email {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.amazon_email ;;
  }

  dimension: bob_s_direct {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.bob_s_direct ;;
  }

  dimension: business_title {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.business_title ;;
  }

  dimension: cost_center {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: cost_center_hierarchy {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.cost_center_hierarchy ;;
  }

  dimension: email_primary_work {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.email_primary_work ;;
  }

  dimension: hire_date {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: is_people_manager_intern {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.is_people_manager_intern ;;
  }

  dimension: is_people_manager_regular_or_ftc {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.is_people_manager_regular_or_ftc ;;
  }

  dimension: job_level {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.job_level ;;
  }

  dimension: job_profile {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.job_profile ;;
  }

  dimension: location_city {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.location_city ;;
  }

  dimension: location_country {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.location_country ;;
  }

  dimension: management_chain_level_02 {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.management_chain_level_02 ;;
  }

  dimension: management_chain_level_03 {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.management_chain_level_03 ;;
  }

  dimension: management_chain_level_04 {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.management_chain_level_04 ;;
  }

  dimension: management_chain_level_05 {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.management_chain_level_05 ;;
  }

  dimension: management_chain_level_06 {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.management_chain_level_06 ;;
  }

  dimension: management_chain_level_07 {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.management_chain_level_07 ;;
  }

  dimension: manager_of_managers_regular_or_ftc {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.manager_of_managers_regular_or_ftc ;;
  }

  dimension: ps_employee_id {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.ps_employee_id ;;
  }

  dimension: tech_quick_role {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.tech_quick_role ;;
  }

  dimension: tenure_group {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.tenure_group ;;
  }

  dimension: time_at_audible {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.time_at_audible ;;
  }

  dimension: time_in_job_profile {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.time_in_job_profile ;;
  }

  dimension: time_in_level {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.time_in_level ;;
  }

  dimension: user_id {
    required_access_grants: [audible]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: wd_employee_id {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.wd_employee_id ;;
  }

  dimension: worker_s_manager_psid {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.worker_s_manager_psid ;;
  }

  dimension: worker_type {
    required_access_grants: [audible]
    type: string
    sql: ${TABLE}.worker_type ;;
  }

  measure: count {
    required_access_grants: [audible]
    type: count
    drill_fields: []
  }
}
