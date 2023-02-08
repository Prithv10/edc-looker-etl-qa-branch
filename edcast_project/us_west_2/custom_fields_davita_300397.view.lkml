include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


access_grant: davita {
  allowed_values: ["edc_prod_analytics_customer_300397"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {

  dimension: cost_center_300397 {
    label: "Cost Center"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: days_in_profile_300397 {
    label: "Days In Profile"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.days_in_profile ;;
  }

  dimension: days_of_service_300397 {
    label: "Days Of Service"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.days_of_service ;;
  }

  dimension: dialysis_experience_300397 {
    label: "Dialysis Experience"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.dialysis_experience ;;
  }

  dimension: division_300397 {
    label: "Division"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: fa_emerge_300397 {
    label: "FA Emerge"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.fa_emerge ;;
  }

  dimension: group_da_vita_300397 {
    label: "Group Da Vita"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.group_da_vita ;;
  }

  dimension: hire_date_300397 {
    label: "Hire Date"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: ichd_fa_300397 {
    label: "ICHD FA"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.ichd_fa ;;
  }

  dimension: job_300397 {
    label: "Job"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.job ;;
  }

  dimension: job_category_300397 {
    label: "Job Category"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.job_category ;;
  }

  dimension: job_family_300397 {
    label: "Job Family"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: linked_in_learning_300397 {
    label: "Linked In Learning"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.linked_in_learning ;;
  }

  dimension: location_300397 {
    label: "Location"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: management_level_300397 {
    label: "Management Level"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.management_level ;;
  }

  dimension: modality_300397 {
    label: "Modality"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.modality ;;
  }

  dimension: preceptor_300397 {
    label: "Preceptor"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.preceptor ;;
  }

  dimension: recent_rehire_300397{
    label: "Recent Rehire"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.recent_rehire ;;
  }

  dimension: region_300397 {
    label: "Region"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: user_id_300397 {
    label: "User Id"
    required_access_grants: [davita]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: work_state_300397 {
    label: "Work State"
    required_access_grants: [davita]
    type: string
    sql: ${TABLE}.work_state ;;
  }

  measure: count {
    required_access_grants: [davita]
    type: count
    drill_fields: []
  }
}
