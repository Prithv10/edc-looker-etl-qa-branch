include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


  access_grant: etisalat {
    allowed_values: ["edc_prod_analytics_customer_300005"]
    user_attribute: database
  }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_2 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: employee_no_300005 {
    label: "Employee No"
    required_access_grants: [etisalat]
    type: string
    sql: ${TABLE}.employee_no ;;
  }

  dimension: location_300005 {
    label: "Location"
    required_access_grants: [etisalat]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: login_name_300005 {
    label: "Login Name"
    required_access_grants: [etisalat]
    type: string
    sql: ${TABLE}.login_name ;;
  }

  dimension: manager_email_id_300005 {
    label: "Manager Email Id"
    required_access_grants: [etisalat]
    type: string
    sql: ${TABLE}.manager_email_id ;;
  }

  dimension: manager_name_300005 {
    label: "Manager Name"
    required_access_grants: [etisalat]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: organization_300005 {
    label: "Organization"
    required_access_grants: [etisalat]
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: user_id_300005 {
    label: "User Id"
    required_access_grants: [etisalat]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300005 {
    label: "Count"
    required_access_grants: [etisalat]
    type: count
    drill_fields: []
  }
}
