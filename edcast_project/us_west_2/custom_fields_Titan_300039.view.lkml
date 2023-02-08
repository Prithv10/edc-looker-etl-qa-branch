include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"
#include: "/edcast_project/us_west_2/cf_0_latest_user_details_vw_2.view.lkml"

access_grant: titan {
  allowed_values: ["edc_prod_analytics_customer_300039"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: city_name_300039 {
    label: "City Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: company_name_300039 {
    label: "Company Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: cost_centre_code_300039 {
    label: "Cost Centre Code"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.cost_centre_code ;;
  }

  dimension: department_name_300039 {
    label: "Department Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.department_name ;;
  }

  dimension: designation_name_300039 {
    label: "Designation Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.designation_name ;;
  }

  dimension: display_name_300039 {
    label: "Display Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: division_name_300039 {
    label: "Division Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.division_name ;;
  }

  dimension: employment_details_recruit_date_300039 {
    label: "Employment Details Recruit Date"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.employment_details_recruit_date ;;
  }

  dimension: gender_300039 {
    label: "Gender"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: grade_300039 {
    label: "Grade"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: hr_job_relationships_email_address_300039 {
    label: "Hr Job Relationships Email Address"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.hr_job_relationships_email_address ;;
  }

  dimension: hr_job_relationships_id_300039 {
    label: "Hr Job Relationships Id"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.hr_job_relationships_id ;;
  }

  dimension: hr_job_relationships_name_300039 {
    label: "Hr Job Relationships Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.hr_job_relationships_name ;;
  }

  dimension: level_employee_sub_group_name_300039 {
    label: "Level Employee Sub Group Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.level_employee_sub_group_name ;;
  }

  dimension: manager_employee_id_300039 {
    label: "Manager Employee Id"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.manager_employee_id ;;
  }

  dimension: manager_name_300039 {
    label: "Manager Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: manager_s_email_id_300039 {
    label: "Manager S Email Id"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.manager_s_email_id ;;
  }

  dimension: org_unit_name_300039 {
    label: "Org Unit Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.org_unit_name ;;
  }

  dimension: sbu_name_300039 {
    label: "Sbu Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.sbu_name ;;
  }

  dimension: sf_id_300039 {
    label: "Sf Id"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.sf_id ;;
  }

  dimension: state_name_300039 {
    label: "State Name"
    required_access_grants: [titan]
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: user_id_300039 {
    label: "User Id"
    primary_key: yes
    required_access_grants: [titan]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300039 {
    label: "Count"
    required_access_grants: [titan]
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: []
  }
}
