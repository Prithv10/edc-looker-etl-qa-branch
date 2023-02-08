include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: mlh_connect {
  allowed_values: ["edc_prod_analytics_customer_100092"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {
  dimension: country_100092 {
    label: "Country"
    required_access_grants: [mlh_connect]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: diageo_external_id_100092 {
    label: "Diageo External Id"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.diageo_external_id ;;
  }

  dimension: function_100092 {
    label: "Function"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: job_role_100092 {
    label: "Job Role"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.job_role ;;
  }

  dimension: location_100092 {
    label: "Location"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_100092 {
    label: "Manager"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.manager ;;
  }

  dimension: org_level_1_100092 {
    label: "Org Level 1"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.org_level_1 ;;
  }

  dimension: org_level_2_100092 {
    label: "Org Level 2"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.org_level_2 ;;
  }

  dimension: org_level_3_100092 {
    label: "Org Level 3"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.org_level_3 ;;
  }

  dimension: org_level_4_100092 {
    label: "Org Level 4"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.org_level_4 ;;
  }

  dimension: returning_user_100092 {
    label: "Returning User"
    required_access_grants: [mlh_connect]
    type: string
    sql: ${TABLE}.returning_user ;;
  }

  dimension: user_id_100092 {
    label: "User Id"
    required_access_grants: [mlh_connect]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_100092 {
    label: "Count"
    required_access_grants: [mlh_connect]
    type: count
    drill_fields: []
  }
}
