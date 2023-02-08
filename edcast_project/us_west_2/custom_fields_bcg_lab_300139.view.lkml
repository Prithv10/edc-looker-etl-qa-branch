include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


access_grant: bcg {
  allowed_values: ["edc_prod_analytics_customer_300139"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {


  dimension: hire_date_300139 {
    label: "Hire Date"
    required_access_grants: [bcg]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: host_office_system_300139 {
    label: "Host Office System"
    required_access_grants: [bcg]
    type: string
    sql: ${TABLE}.host_office_system ;;
  }

  dimension: job_title_300139 {
    label: "Job Title"
    required_access_grants: [bcg]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: office_location_300139 {
    label: "Office Location"
    required_access_grants: [bcg]
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: organization_name_300139 {
    label: "Organization Name"
    required_access_grants: [bcg]
    type: string
    sql: ${TABLE}.organization_name ;;
  }

  dimension: region_300139 {
    label: "Region"
    required_access_grants: [bcg]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: team_type_300139 {
    label: "Team Type"
    required_access_grants: [bcg]
    type: string
    sql: ${TABLE}.team_type ;;
  }

  dimension: user_id_300139 {
    label: "User Id"
    required_access_grants: [bcg]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    required_access_grants: [bcg]
    type: count
    drill_fields: []
  }
}
