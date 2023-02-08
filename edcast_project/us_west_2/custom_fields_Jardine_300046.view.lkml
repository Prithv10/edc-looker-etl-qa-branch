  include: "/edcast_project/views/original_views/*.view.lkml"
  include: "/edcast_project/us_west_2/*.view.lkml"

  access_grant: Jardine {
    allowed_values: ["edc_prod_analytics_customer_300046"]
    user_attribute: database
  }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_2 {

    # Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: account_expiration_date_300046 {
    label: "Account Expiration"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.account_expiration_date ;;
  }

  dimension: business_unit_300046 {
    label: "Business Unit"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: company_300046 {
    label: "Company"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: country_300046 {
    label: "Country"
    required_access_grants: [Jardine]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_300046 {
    label: "Department"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: employee_id_300046 {
    label: "Employee Id"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: go1_id_300046 {
    label: "Go1 ID"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.go1_id ;;
  }

  dimension: job_role_300046 {
    label: "Job Role"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.job_role ;;
  }

  dimension: manager_email_300046 {
    label: "Manager Email"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_name_300046 {
    label: "Manager Name"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: office_location_300046 {
    label: "Office Location"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: staff_grade_300046 {
    label: "Staff Grade"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.staff_grade ;;
  }

  dimension: sub_department_300046 {
    label: "Sub Department"
    required_access_grants: [Jardine]
    type: string
    sql: ${TABLE}.sub_department ;;
  }

  dimension: user_id_300046 {
    hidden: yes
    label: "User ID"
    required_access_grants: [Jardine]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300046 {
    label: "Count"
    required_access_grants: [Jardine]
    type: count
    drill_fields: [manager_name_300046]
  }
}
