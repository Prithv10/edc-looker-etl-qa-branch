
include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

  access_grant: aflac {
    allowed_values: ["edc_prod_analytics_customer_300137"]
    user_attribute: database
  }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all custom fields by appending org_id to avoid overlap issues


  dimension: is_manager_300137 {
    label: "Is Manager"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_type_300137 {
    label: "Job Type"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: manager_id_300137 {
    label: "Manager Id"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: mgr_username_300137 {
    label: "Mgr Username"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.mgr_username ;;
  }

  dimension: middle_name_300137 {
    label: "Middle Name"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: new_associate_300137 {
    label: "New Associate"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.new_associate ;;
  }

  dimension: organization_300137 {
    label: "Organization"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.organization ;;
  }

  dimension: status_300137 {
    label: "Status"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: territory_300137 {
    label: "Territory"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.territory ;;
  }

  dimension: user_id_300137 {
    label: "User Id"
    required_access_grants: [aflac]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: username_300137 {
    label: "Username"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: veteran_associate_300137 {
    label: "Veteran Associate"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.veteran_associate ;;
  }

  dimension: writing_number_300137 {
    label: "Writing Number"
    required_access_grants: [aflac]
    type: string
    sql: ${TABLE}.writing_number ;;
  }

  measure: count_300137 {
    label: "Count"
    required_access_grants: [aflac]
    type: count
    drill_fields: []
  }
}
