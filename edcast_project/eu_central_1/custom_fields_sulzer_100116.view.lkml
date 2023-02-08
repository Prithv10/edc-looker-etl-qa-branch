include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

  access_grant: sulzer {
    allowed_values: ["edc_prod_analytics_customer_100116"]
    user_attribute: database
  }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_1 {

  dimension: business_unit_100116 {
    label: "Business Unit"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: country_100116 {
    label: "Country"
    required_access_grants: [sulzer]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_100116 {
    label: "Department"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: division_100116 {
    label: "Division"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: divison_100116 {
    label: "Divison"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.divison ;;
  }

  dimension: employee_id_100116 {
    label: "Employee ID"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: function_100116 {
    label: "Function"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: job_role_100116 {
    label: "Job Role"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.job_role ;;
  }

  dimension: job_title_100116 {
    label: "Job Title"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: legal_entity_100116 {
    label: "Legal Entity"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.legal_entity ;;
  }

  dimension: manager_id_100116 {
    label: "Manager ID"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: physical_location_100116 {
    label: "Physical Location"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.physical_location ;;
  }

  dimension: role_name_100116 {
    label: "Role Name"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.role_name ;;
  }

  dimension: sulzer_level_100116 {
    label: "Sulzer Level"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.sulzer_level ;;
  }

  dimension: user_id_100116 {
    label: "User ID"
    required_access_grants: [sulzer]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: welcome_email_100116 {
    label: "Welcome Email"
    required_access_grants: [sulzer]
    type: string
    sql: ${TABLE}.welcome_email ;;
  }

  measure: count_100116 {
    label: "Count"
    required_access_grants: [sulzer]
    type: count
    drill_fields: [role_name_100116]
  }
}
