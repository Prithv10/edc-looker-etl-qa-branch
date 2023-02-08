include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: bytedance {
  allowed_values: ["edc_prod_analytics_customer_300089"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"

view: +cf_0_latest_user_details_vw_2 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: country_300089 {
    label: "Country"
    required_access_grants: [bytedance]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_300089 {
    label: "Department"
    required_access_grants: [bytedance]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: go1_id_300089 {
    label: "Go1 Id"
    required_access_grants: [bytedance]
    type: string
    sql: ${TABLE}.go1_id ;;
  }

  dimension: user_id_300089 {
    label: "User Id"
    required_access_grants: [bytedance]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300089 {
    label: "Count"
    required_access_grants: [bytedance]
    type: count
    drill_fields: []
  }

  measure: count_go1_id_300089 {
    label: "Count Of Go1 Id"
    required_access_grants: [bytedance]
    type: number
    sql: count(${TABLE}.go1_id);;
    drill_fields: []
  }

  measure: count_of_department_300089 {
    label: "Count of Department"
    required_access_grants: [bytedance]
    type: number
    sql: count(${TABLE}.department);;
    drill_fields: []
  }


}
