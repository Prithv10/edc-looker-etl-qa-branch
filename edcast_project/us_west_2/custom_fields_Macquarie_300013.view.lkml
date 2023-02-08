include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: Macquarie {
  allowed_values: ["edc_prod_analytics_customer_300013"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: cost_center_300013 {
    label: "Cost Center"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: country_300013 {
    label: "Country"
    required_access_grants: [Macquarie]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_300013 {
    label: "Department"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: division_300013 {
    label: "Division"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: doj_in_300013 {
    label: "Doj In"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.doj_in ;;
  }

  dimension: emp_category_300013 {
    label: "Emp Category"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.emp_category ;;
  }

  dimension: employee_id_300013 {
    label: "Employee Id"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: group_300013 {
    label: "Group"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.`group` ;;
  }

  dimension: last_working_day_300013 {
    label: "Last Working Day"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.last_working_day ;;
  }

  dimension: level_300013 {
    label: "Level"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.level ;;
  }

  dimension: location_300013 {
    label: "Location"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_email_300013 {
    label: "Manager Email"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: region_300013 {
    label: "Region"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: reporting_manager_300013 {
    label: "Reporting Manager"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.reporting_manager ;;
  }

  dimension: second_manger_email_300013 {
    label: "Second Manager Email"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.second_manger_email ;;
  }

  dimension: second_manger_name_300013 {
    label: "Second Manager Name"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.second_manger_name ;;
  }

  dimension: sub_division_300013 {
    label: "Sub Division"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.sub_division ;;
  }

  dimension: user_id_300013 {
    label: "User Id"
    hidden: yes
    required_access_grants: [Macquarie]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: username_300013 {
    label: "User Name"
    required_access_grants: [Macquarie]
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count_300013 {
    label: "Count"
    required_access_grants: [Macquarie]
    type: count
    drill_fields: []
  }
}
