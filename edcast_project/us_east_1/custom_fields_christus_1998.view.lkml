include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant: christus {
  allowed_values: ["edc_prod_analytics_customer_1998"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: action_reason_1998 {
    label: "Action Reason"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.action_reason ;;
  }

  dimension: action_reason_eff_date_1998 {
    label: "Action Reason Eff Date"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.action_reason_eff_date ;;
  }

  dimension: badge_number_1998 {
    label: "Badge Number"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.badge_number ;;
  }

  dimension: birthdate_1998 {
    label: "Birthdate"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.birthdate ;;
  }

  dimension: department_id_1998 {
    label: "Department Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.department_id ;;
  }

  dimension: department_name_1998 {
    label: "Department Name"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.department_name ;;
  }

  dimension: department_number_1998 {
    label: "Department Number"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.department_number ;;
  }

  dimension: employee_id_1998 {
    label: "Employee Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: employment_status_1998 {
    label: "Employment Status"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.employment_status ;;
  }

  dimension: entity_1998 {
    label: "Entity"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.entity ;;
  }

  dimension: entity_name_1998 {
    label: "Entity Name"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.entity_name ;;
  }

  dimension: flsa_1998 {
    label: "Flsa"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.flsa ;;
  }

  dimension: fte_1998 {
    label: "Fte"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.fte ;;
  }

  dimension: gender_1998 {
    label: "Gender"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: healthstream_id_1998 {
    label: "Healthstream Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.healthstream_id ;;
  }

  dimension: home_phone_1998 {
    label: "Home Phone"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: initial_hire_date_1998 {
    label: "Initial Hire Date"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.initial_hire_date ;;
  }

  dimension: is_manager_1998 {
    label: "Is Manager"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_code_1998 {
    label: "Job Code"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_code_descr_1998 {
    label: "Job Code Descr"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.job_code_descr ;;
  }

  dimension: job_family_1998 {
    label: "Job Family"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: manager_email_1998 {
    label: "Manager Email"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_id_1998 {
    label: "Manager Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: middle_name_1998 {
    label: "Middle Name"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: ministry_1998 {
    label: "Ministry"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.ministry ;;
  }

  dimension: network_id_1998 {
    label: "Network Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.network_id ;;
  }

  dimension: paygroup_1998 {
    label: "Paygroup"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.paygroup ;;
  }

  dimension: position_category_1998 {
    label: "Position Category"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.position_category ;;
  }

  dimension: position_family_1998 {
    label: "Position Family"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.position_family ;;
  }

  dimension: position_id_1998 {
    label: "Position Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.position_id ;;
  }

  dimension: position_level_1998 {
    label: "Position Level"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.position_level ;;
  }

  dimension: position_name_1998 {
    label: "Position Name"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.position_name ;;
  }

  dimension: position_sub_category_1998 {
    label: "Position Sub Category"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.position_sub_category ;;
  }

  dimension: preferred_full_name_1998 {
   label:"Preferred Full Name"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.preferred_full_name ;;
  }

  dimension: race_ethnicity_1998 {
    label: "Race Ethnicity"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.race_ethnicity ;;
  }

  dimension: rehire_date_1998 {
    label: "Rehire Date"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.rehire_date ;;
  }

  dimension: relationship_to_org_1998 {
    label: "Relationship To Org"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.relationship_to_org ;;
  }

  dimension: reporting_location_id_1998 {
    label: "Reporting Location Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.reporting_location_id ;;
  }

  dimension: reporting_location_name_1998 {
    label: "Reporting Location Name"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.reporting_location_name ;;
  }

  dimension: reports_to_healthstream_id_1998 {
    label: "Reports To Healthstream Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.reports_to_healthstream_id ;;
  }

  dimension: reports_to_network_id_1998 {
    label: "Reports To Network Id"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.reports_to_network_id ;;
  }

  dimension: termination_date_1998 {
    label: "Termination Date"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.termination_date ;;
  }

  dimension: user_id_1998 {
    label: "User Id"
    required_access_grants: [christus]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: work_schedule_1998 {
    label: "Work Schedule"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.work_schedule ;;
  }

  dimension: years_service_1998 {
    label: "Years Service"
    required_access_grants: [christus]
    type: string
    sql: ${TABLE}.years_service ;;
  }

  measure: count_1998 {
    label: "Count"
    required_access_grants: [christus]
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: []
  }
}
