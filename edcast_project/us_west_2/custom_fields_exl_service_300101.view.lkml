include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


access_grant: exl_service {
  allowed_values: ["edc_prod_analytics_customer_300101"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {


  dimension: band_300101 {
    label: "Band"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.band ;;
  }

  dimension: center_300101 {
    label: "Center"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.center ;;
  }

  dimension: city_300101 {
    label: "City"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: corp_id_300101 {
    label: "Corp Id"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.corp_id ;;
  }

  dimension: country_300101 {
    label: "Country"
    required_access_grants: [exl_service]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_300101 {
    label: "Department"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: designation_300101 {
    label: "Designation"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.designation ;;
  }

  dimension: emp_id_300101 {
    label: "Employee Id"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.emp_id ;;
  }

  dimension: employee_manager_300101 {
    label: "Employee Manager"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.employee_manager ;;
  }

  dimension: geo_300101 {
    label: "Geo"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.geo ;;
  }

  dimension: location_300101 {
    label: "Location"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_department_300101 {
    label: "Manager Department"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.manager_department ;;
  }

  dimension: manager_email_300101 {
    label: "Manager Email"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: user_id_300101 {
    label: "User Id"
    required_access_grants: [exl_service]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: vertical_300101 {
    label: "Vertical"
    required_access_grants: [exl_service]
    type: string
    sql: ${TABLE}.vertical ;;
  }

  measure: count {
    required_access_grants: [exl_service]
    type: count
    drill_fields: []
  }
}
