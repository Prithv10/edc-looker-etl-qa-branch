include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant: nse {
  allowed_values: ["edc_prod_analytics_customer_1985"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues
  dimension: mobile_number_1985 {
    label: "Mobile Number"
    required_access_grants: [nse]
    sql: ${TABLE}.mobile_number ;;
  }

  dimension: user_id_1985 {
    label: "User Id"
    required_access_grants: [nse]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_1985 {
    label: "Count"
    required_access_grants: [nse]
    type: count
    drill_fields: []
  }
}
