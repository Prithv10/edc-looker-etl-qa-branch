include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/south_east_2/*.view.lkml"

access_grant: NSW {
  allowed_values: ["edc_prod_analytics_customer_600018"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_4 {


  dimension: business_unit_600018 {
    label: "Business Unit"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: csod_user_id_600018 {
    label: "CSOD User Id"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.csod_user_id ;;
  }

  dimension: department_600018 {
    label: "Department"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: division_600018 {
    label: "Division"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: grade_600018 {
    label: "Grade"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: location_600018 {
    label: "Location"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager_email_600018 {
    label: "Manager Email"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_name_600018 {
    label: "Manager Name"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: position_title_600018 {
    label: "Position Title"
    required_access_grants: [NSW]
    type: string
    sql: ${TABLE}.position_title ;;
  }

  dimension: user_id_600018 {
    label: "User Id"
    required_access_grants: [NSW]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_600018 {
    label: "Count"
    required_access_grants: [NSW]
    type: count
    drill_fields: []
  }
}
