include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: Audible {
  allowed_values: ["edc_prod_analytics_customer_300255"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: amazon_email_300255 {
    label: "Amazon Email"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.amazon_email ;;
  }

  dimension: bob_s_direct_300255 {
    label: "Bob S Direct"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.bob_s_direct ;;
  }

  dimension: business_title_300255 {
    label: "Business Title"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.business_title ;;
  }

  dimension: cost_center_300255 {
    label: "Cost Center"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: cost_center_hierarchy_300255 {
    label: "Cost Center Hierarchy"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.cost_center_hierarchy ;;
  }

  dimension: email_primary_work_300255 {
    label: "Email Primary Work"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.email_primary_work ;;
  }

  dimension: hire_date_300255 {
    label: "Hire Date"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: is_people_manager_intern_300255 {
    label: "Is People Manager Intern"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.is_people_manager_intern ;;
  }

  dimension: is_people_manager_regular_or_ftc_300255 {
    label: "Is People Manager Regular Or Ftc"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.is_people_manager_regular_or_ftc ;;
  }

  dimension: job_level_300255 {
    label: "Job Level"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.job_level ;;
  }

  dimension: job_profile_300255 {
    label: "Job Profile"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.job_profile ;;
  }

  dimension: location_city_300255 {
    label: "Location City"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.location_city ;;
  }

  dimension: location_country_300255 {
    label: "Location Country"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.location_country ;;
  }

  dimension: management_chain_level_02_300255 {
    label: "Management Chain Level 02"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.management_chain_level_02 ;;
  }

  dimension: management_chain_level_03_300255 {
    label: "Management Chain Level 03"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.management_chain_level_03 ;;
  }

  dimension: management_chain_level_04_300255 {
    label: "Management Chain Level 04"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.management_chain_level_04 ;;
  }

  dimension: management_chain_level_05_300255 {
    label: "Management Chain Level 05"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.management_chain_level_05 ;;
  }

  dimension: management_chain_level_06_300255{
    label: "Management Chain Level 06"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.management_chain_level_06 ;;
  }

  dimension: management_chain_level_07_300255 {
    label: "Management Chain Level 07"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.management_chain_level_07 ;;
  }

  dimension: manager_of_managers_regular_or_ftc_300255 {
    label: "Manager Of Managers Regular Or Ftc"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.manager_of_managers_regular_or_ftc ;;
  }

  dimension: ps_employee_id_300255 {
    label: "Ps Employee Id"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.ps_employee_id ;;
  }

  dimension: tech_quick_role_300255 {
    label: "Tech Quick Role"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.tech_quick_role ;;
  }

  dimension: tenure_group_300255 {
    label: "Tenure Group"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.tenure_group ;;
  }

  dimension: time_at_audible_300255 {
    label: "Time At Audible"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.time_at_audible ;;
  }

  dimension: time_in_job_profile_300255 {
    label: "Time In Job Profile"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.time_in_job_profile ;;
  }

  dimension: time_in_level_300255 {
    label: "Time In Level"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.time_in_level ;;
  }

  dimension: user_id_300255 {
    label: "User Id"
    required_access_grants: [Audible]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: wd_employee_id_300255 {
    label: "Wd Employee Id"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.wd_employee_id ;;
  }

  dimension: worker_s_manager_psid_300255 {
    label: "Worker S Manager Psid"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.worker_s_manager_psid ;;
  }

  dimension: worker_type_300255 {
    label: "Worker Type"
    required_access_grants: [Audible]
    type: string
    sql: ${TABLE}.worker_type ;;
  }

  measure: count_300255 {
    label: "Count"
    required_access_grants: [Audible]
    type: count
    drill_fields: []
  }
}
