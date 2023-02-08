include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: hkex {
  allowed_values: ["edc_prod_analytics_customer_100086"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {

  dimension: manager_email_100086 {
    label: "Manager Email"
    required_access_grants: [hkex]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_name_100086 {
    label: "Manager Name"
    required_access_grants: [hkex]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: user_id_100086 {
    label: "User ID"
    required_access_grants: [hkex]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_100086 {
    label: "Count"
    required_access_grants: [hkex]
    type: count
    drill_fields: [manager_name_100086]
  }
}
