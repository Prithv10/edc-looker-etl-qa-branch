include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: mylo {
  allowed_values: ["edc_prod_analytics_customer_100074"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {

  dimension: campaign_10074 {
    label: "Campaign"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: cell_number_10074 {
    label: "CELL Number"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.cell_number ;;
  }

  dimension: department_10074 {
    label: "Department"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: employee_no_10074 {
    label: "Employee"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.employee_no ;;
  }

  dimension: gender_10074 {
    label: "Gender"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: id_no_10074 {
    label: "ID No"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.id_no ;;
  }

  dimension: junior_manager_10074 {
    label: "Junior Manager"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.junior_manager ;;
  }

  dimension: location_10074 {
    label: "Location"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: occupational_level_10074 {
    label: "Occupational Level"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.occupational_level ;;
  }

  dimension: race_group_10074 {
    label: "Race Group"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.race_group ;;
  }

  dimension: skill_level_10074 {
    label: "Occupational Level"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.skill_level ;;
  }

  dimension: start_date_10074 {
    label: "Start Date"
    required_access_grants: [mylo]
    type: string
    sql: ${TABLE}.start_date ;;
  }

  dimension: user_id_10074 {
    label: "User ID"
    required_access_grants: [mylo]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_10074 {
    label: "Count"
    required_access_grants: [mylo]
    type: count
    drill_fields: []
  }
}
