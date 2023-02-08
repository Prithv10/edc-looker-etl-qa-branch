include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: tetrapaktraining {
  allowed_values: ["edc_prod_analytics_customer_100067"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {

  dimension: customer_name_100067 {
    label: "Customer Name"
    required_access_grants: [tetrapaktraining]
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_number_100067 {
    label: "Customer Number"
    required_access_grants: [tetrapaktraining]
    type: string
    sql: ${TABLE}.customer_number ;;
  }

  dimension: user_id_100067 {
    label: "User ID"
    required_access_grants: [tetrapaktraining]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_100067 {
    label: "Count"
    required_access_grants: [tetrapaktraining]
    type: count
    drill_fields: [customer_name_100067]
  }
}
