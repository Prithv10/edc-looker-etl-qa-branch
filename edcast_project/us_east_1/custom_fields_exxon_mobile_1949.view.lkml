include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant:exxon_mobile{
  allowed_values: ["edc_prod_analytics_customer_1949"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {
# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: career_community_1949 {
    label: "Career Community"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.career_community ;;
  }

  dimension: current_job_family_1949 {
    label: "Current Job Family"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.current_job_family ;;
  }

  dimension: department_1949 {
    label: "Department"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: division_1949 {
    label: "Division"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: edguid_1949 {
    label: "Edguid"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.edguid ;;
  }

  dimension: emp_group_1949 {
    label: "Emp Group"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.emp_group ;;
  }

  dimension: function_1949 {
    label: "Function"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: job_role_name_1949 {
    label: "Job Role Name"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.job_role_name ;;
  }

  dimension: primary_job_family_1949 {
    label: "Primary Job Family"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.primary_job_family ;;
  }

  dimension: region_1949 {
    label: "Region"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: source_1949 {
    label: "Source"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: sub_department_1949 {
    label: "Sub Department"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.sub_department ;;
  }

  dimension: subfunction_1949 {
    label: "Subfunction"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.subfunction ;;
  }

  dimension: user_id_1949 {
    label: "User Id"
    required_access_grants: [exxon_mobile]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name_1949 {
    label: "User Name"
    required_access_grants: [exxon_mobile]
    type: string
    sql: ${TABLE}.user_name ;;
  }

  measure: count_1949 {
    label: "Count"
    required_access_grants: [exxon_mobile]
    type: count
    drill_fields: []
  }
}
