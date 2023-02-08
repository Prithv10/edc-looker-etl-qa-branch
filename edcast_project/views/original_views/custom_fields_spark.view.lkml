include: "/edcast_project/views/original_views/*.view.lkml"

access_grant: spark {
  allowed_values: ["spark_edcast_qa"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw {


  dimension: business_unit {
    required_access_grants: [spark]
    type: string
    sql: ${TABLE}.business_unit;;
  }

  dimension: go1_id {
    required_access_grants: [spark]
    type: string
    sql: ${TABLE}.go1_id ;;
  }

  dimension: hiring_year {
    required_access_grants: [spark]
    type: string
    sql: ${TABLE}.hiring_year ;;
  }

  dimension: l1_manager {
    required_access_grants: [spark]
    type: string
    sql: ${TABLE}.l1_manager ;;
  }

  dimension: manager_email {
    required_access_grants: [spark]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: office_location {
    required_access_grants: [spark]
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: phone_number {
    required_access_grants: [spark]
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: region {
    required_access_grants: [spark]
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: count {
    required_access_grants: [spark]
    type: count
    drill_fields: []
  }
}
