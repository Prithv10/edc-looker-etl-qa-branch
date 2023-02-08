include: "/edcast_project/views/original_views/*.view.lkml"

access_grant: bankofcanada {
  allowed_values: ["bank_of_canada_dataset"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw {



  dimension: consultant {
    required_access_grants: [bankofcanada]
    type: string
    sql: ${TABLE}.consultant ;;
  }

  dimension: department {
    required_access_grants: [bankofcanada]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: user_id {
    required_access_grants: [bankofcanada]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    required_access_grants: [bankofcanada]
    type: count
    drill_fields: []
  }
}
