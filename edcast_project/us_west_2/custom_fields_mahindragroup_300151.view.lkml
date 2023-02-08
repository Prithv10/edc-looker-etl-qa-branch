
include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


  access_grant: mahindragroup {
    allowed_values: ["edc_prod_analytics_customer_300151"]
    user_attribute: database
  }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"

  view: +cf_0_latest_user_details_vw_2 {
  dimension: bhr_name_300151 {
    label: "BHR Name"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.bhr_name ;;
  }

  dimension: business_function_300151 {
    label: "Business Function"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.business_function ;;
  }

  dimension: business_unit_300151 {
    label: "Business Unit"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: company_code_300151 {
    label: "Company Code"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension: country_300151 {
    label: "Country"
    required_access_grants: [mahindragroup]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: date_of_joining_300151 {
    label: "Date of Joining"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.date_of_joining ;;
  }

  dimension: department_300151 {
    label: "Department"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: designation_300151 {
    label: "Designation"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.designation ;;
  }

  dimension: division_300151 {
    label: "Division"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: gender_300151 {
    label: "Gender"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: grade_300151 {
    label: "Grade"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: group_company_300151 {
    label: "Group Company"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.group_company ;;
  }

  dimension: human_resources_300151 {
    label: "Human Resources"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.human_resources ;;
  }

  dimension: job_code_300151 {
    label: "Job Code"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_family_300151 {
    label: "Job Family"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: location_300151 {
    label: "Location"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: mahindra_manager_id_300151 {
    label: "Mahindra Manager Id"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.mahindra_manager_id ;;
  }

  dimension: middle_name_300151 {
    label: "Middle Name"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: nickname_300151 {
    label: "Nickname"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: role_300151 {
    label: "Role"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: sector_300151 {
    label: "Sector"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.sector ;;
  }

  dimension: sf_id_300151 {
    label: "SF Id"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.sf_id ;;
  }

  dimension: sub_department_300151 {
    label: "Sub Department"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.sub_department ;;
  }

  dimension: sub_division_300151 {
    label: "Sub Division"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.sub_division ;;
  }

  dimension: token_id_300151 {
    label: "Token Id"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.token_id ;;
  }

  dimension: user_id_300151 {
    label: "User Id"
    required_access_grants: [mahindragroup]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: userid_300151 {
    label: "UserId"
    required_access_grants: [mahindragroup]
    type: string
    sql: ${TABLE}.userid ;;
  }

  measure: count {
    required_access_grants: [mahindragroup]
    type: count
    drill_fields: []
  }
}
