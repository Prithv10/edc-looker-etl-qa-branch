include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: bain {
  allowed_values: ["edc_prod_analytics_customer_300225"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"

view: +cf_0_latest_user_details_vw_2 {

  dimension: department_300225 {
    label: "Department"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: external_id_300225 {
    label: "External Id"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: gender_300225 {
    label: "Gender"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: group_name_300225 {
    label: "Group Name"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: hire_source_300225 {
    label: "Hire Source"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.hire_source ;;
  }

  dimension: is_contingent_worker_300225 {
    label: "Is Contingent Worker?"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.is_contingent_worker ;;
  }

  dimension: is_people_manager_300225 {
    label: "Is People Manager?"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.is_people_manager ;;
  }

  dimension: job_category_300225 {
    label: "Job Category"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.job_category ;;
  }

  dimension: length_of_service_300225 {
    label: "Length of Service"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.length_of_service ;;
  }

  dimension: length_of_service_group_300225 {
    label: "Length of Service Group"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.length_of_service_group ;;
  }

  dimension: manager_id_300225 {
    label: "Manager Id"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: office_name_300225 {
    label: "Office Name"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.office_name ;;
  }

  dimension: pd_grade_code_300225 {
    label: "PD Grade Code"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.pd_grade_code ;;
  }

  dimension: pd_level_code_300225 {
    label: "PD Level Code"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.pd_level_code ;;
  }

  dimension: pd_level_grade_300225 {
    label: "PD Level Grade"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.pd_level_grade ;;
  }

  dimension: promotion_date_300225 {
    label: "Promotion Date"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.promotion_date ;;
  }

  dimension: region_300225 {
    label: "Region"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: resource_pool_300225 {
    label: "Resource Pool"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.resource_pool ;;
  }

  dimension: service_line_300225 {
    label: "Service Line"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.service_line ;;
  }

  dimension: start_date_300225 {
    label: "Start Date"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.start_date ;;
  }

  dimension: talent_community_300225 {
    label: "Talent Community"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.talent_community ;;
  }

  dimension: tenure_group_300225 {
    label: "Tenure Group"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.tenure_group ;;
  }

  dimension: time_in_job_300225 {
    label: "Time In Job"
    required_access_grants: [bain]
    type: string
    sql: ${TABLE}.time_in_job ;;
  }

  dimension: user_id_300225 {
    label: "User Id"
    required_access_grants: [bain]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300225 {
    label: "Count"
    required_access_grants: [bain]
    type: count
    drill_fields: []
  }
}
