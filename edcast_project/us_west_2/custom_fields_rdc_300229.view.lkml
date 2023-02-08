include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


  access_grant: rdc {
    allowed_values: ["edc_prod_analytics_customer_300229"]
    user_attribute: database
  }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_2 {

  dimension: cost_center_code_300229 {
    label: "Cost Center Code"
    required_access_grants: [rdc]
    type: string
    sql: ${TABLE}.cost_center_code ;;
  }

  dimension: hire_date_300229 {
    label: "Hire Date"
    required_access_grants: [rdc]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_role_300229 {
    label: "Job Role"
    required_access_grants: [rdc]
    type: string
    sql: ${TABLE}.job_role ;;
  }

  dimension: manager_name_300229 {
    label: "Manager Name"
    required_access_grants: [rdc]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: user_id_300229 {
    label: "User Id"
    required_access_grants: [rdc]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  # dimension: userid_300229 {
  #   label: "UserId"
  #   required_access_grants: [rdc]
  #   type: string
  #   sql: ${TABLE}.userid ;;
  # }

  measure: count_300229 {
    label: "Count"
    required_access_grants: [rdc]
    type: count
    drill_fields: []
  }
}
