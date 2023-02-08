include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: itc {
  allowed_values: ["edc_prod_analytics_customer_300281"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: business_unit_300281 {
    label: "Business Unit"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: city_300281 {
    label: "City"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country_300281 {
    label: "Country"
    required_access_grants: [itc]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: designation_description_300281 {
    label: "Designation Description"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.designation_description ;;
  }

  dimension: effective_date_300281 {
    label: "Effective Date"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.effective_date ;;
  }

  dimension: employment_status_300281 {
    label: "Employment Status"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.employment_status ;;
  }

  dimension: grade_300281 {
    label: "Grade"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: hire_date_300281 {
    label: "Hire Date"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_role_300281{
    label: "Job Role"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.job_role ;;
  }

  dimension: pool_description_300281 {
    label: "Pool Description"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.pool_description ;;
  }

  dimension: ps_id_300281 {
    label: "Ps Id"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.ps_id ;;
  }

  dimension: rsl_300281 {
    label: "Rsl"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.rsl ;;
  }

  dimension: service_line_300281 {
    label: "Service Line"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.service_line ;;
  }

  dimension: sub_service_line_300281 {
    label: "Sub Service Line"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.sub_service_line ;;
  }

  dimension: supervisor_id_300281 {
    label: "Supervisor Id"
    required_access_grants: [itc]
    type: string
    sql: ${TABLE}.supervisor_id ;;
  }

  dimension: user_id_300281 {
    label: "User Id"
    required_access_grants: [itc]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300281 {
    label: "Count"
    required_access_grants: [itc]
    type: count
    drill_fields: []
  }
}
