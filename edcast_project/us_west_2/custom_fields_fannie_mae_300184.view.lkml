  include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: Fannie_Mae_300184 {
  allowed_values: ["edc_prod_analytics_customer_300184"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all custom fields by appending org_id to avoid overlap issues
  dimension: cost_center_id_300184 {
    label: "Cost Center Id"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.cost_center_id ;;
  }

  dimension: cost_center_name_300184 {
    label: "Cost Center Name"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.cost_center_name ;;
  }

  dimension: current_hire_date_300184 {
    label: "Current Hire Date"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.current_hire_date ;;
  }

  dimension: employer_partner_300184 {
    label: "Employer Partner"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.employer_partner ;;
  }

  dimension: federation_id_300184 {
    label: "Federation Id"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.federation_id ;;
  }

  dimension: gender_300184 {
    label: "Gender"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: is_contractor_300184 {
    label: "Is Contractor?"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.is_contractor ;;
  }

  dimension: is_fhfa_300184 {
    label: "Is FHFA?"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.is_fhfa ;;
  }

  dimension: is_fhl_300184 {
    label: "Is FHL"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.is_fhl ;;
  }

  dimension: is_sf_300184 {
    label: "Is SF?"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.is_sf ;;
  }

  dimension: manager_email_300184 {
    label: "Manager Email"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_user_id_custom_field_300184 {
    label: "Manager User Id Custom Field"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.manager_user_id_custom_field ;;
  }

  dimension: middle_initial_300184 {
    label: "Middle Initial"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.middle_initial ;;
  }

  dimension: original_hire_date_300184 {
    label: "Original Hire Date"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.original_hire_date ;;
  }

  dimension: phone_300184 {
    label: "Phone"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: street1_300184 {
    label: "Street 1"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.street1 ;;
  }

  dimension: teleworker_300184 {
    label: "Teleworker"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.teleworker ;;
  }

  dimension: user_id_300184 {
    label: "User Id"
    required_access_grants: [Fannie_Mae_300184]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_id_custom_field_300184 {
    label: "User Id Custom Field"
    required_access_grants: [Fannie_Mae_300184]
    type: string
    sql: ${TABLE}.user_id_custom_field ;;
  }

  measure: count_300184 {
    label: "Count"
    required_access_grants: [Fannie_Mae_300184]
    type: count
    drill_fields: []
  }
}
