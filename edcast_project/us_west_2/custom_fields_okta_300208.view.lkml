include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


access_grant: okta {
  allowed_values: ["edc_prod_analytics_customer_300208"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {


  dimension: acquisition_company_300208 {
    label: "Acquisition Company"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.acquisition_company ;;
  }

  dimension: business_unit_300208 {
    label: "Business Unit"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: cost_center_300208 {
    label: "Cost Center"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: cost_center_hierarchy_300208 {
    label: "Cost Center Hierarchy"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.cost_center_hierarchy ;;
  }

  dimension: fte_count_300208 {
    label: "FTE Count"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.fte_count ;;
  }

  dimension: geo_300208 {
    label: "Geo"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.geo ;;
  }

  dimension: hire_date_300208 {
    label: "Hire Date"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: is_manager_300208 {
    label: "Is Manager?"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: management_level_300208 {
    label: "Manager Level"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.management_level ;;
  }

  dimension: total_worker_count_300208 {
    label: "Total Worker Count"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.total_worker_count ;;
  }

  dimension: user_id_300208 {
    label: "User Id"
    required_access_grants: [okta]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: worker_hire_date_300208 {
    label: "Worker Hire Date"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.worker_hire_date ;;
  }

  dimension: worker_type_300208 {
    label: "Worker Type"
    required_access_grants: [okta]
    type: string
    sql: ${TABLE}.worker_type ;;
  }

  measure: count {
    required_access_grants: [okta]
    type: count
    drill_fields: []
  }
}
