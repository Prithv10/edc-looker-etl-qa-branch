 include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant: SalesU{
  allowed_values: ["edc_prod_analytics_customer_2155"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {

  dimension: badge_id_2155 {
    label: "Badge Id"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.badge_id ;;
  }

  dimension: business_unit_2155 {
    label: "Business Unit"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: design_plan_2155 {
    label: "Design Plan"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.design_plan ;;
  }

  dimension: employment_class_2155 {
    label: "Employment Class"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.employment_class ;;
  }

  dimension: exempt_2155 {
    label: "Exempt"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.exempt ;;
  }

  dimension: guest_2155 {
    label: "Guest"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.guest ;;
  }

  dimension: has_direct_reports_2155 {
    label: "Has Direct Reports"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.has_direct_reports ;;
  }

  dimension: hr_job_title_2155 {
    label: "HR Job Title"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.hr_job_title ;;
  }

  dimension: is_manager_2155 {
    label: "Is Manager?"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: is_new_hire_2155 {
    label: "Is New Hire?"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.is_new_hire ;;
  }

  dimension: is_on_leave_of_absence_2155 {
    label: "Is On Leave Of Absence?"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.is_on_leave_of_absence ;;
  }

  dimension: job_function_2155 {
    label: "Job Function"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.job_function ;;
  }

  dimension: l2_manager_2155 {
    label: "L2 Manager"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.l2_manager ;;
  }

  dimension: l3_manager_2155 {
    label: "L3 Manager"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.l3_manager ;;
  }

  dimension: l4_manager_2155 {
    label: "L4 Manager"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.l4_manager ;;
  }

  dimension: l5_manager_2155 {
    label: "L5 Manager"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.l5_manager ;;
  }

  dimension: l6_manager_2155 {
    label: "L6 Manager"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.l6_manager ;;
  }

  dimension: l7_manager_2155 {
    label: "L7 Manager"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.l7_manager ;;
  }

  dimension: l8_manager_2155 {
    label: "L8 Manager"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.l8_manager ;;
  }

  dimension: last_hire_date_2155 {
    label: "Last Hire Date"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.last_hire_date ;;
  }

  dimension: manager_2155 {
    label: "Manager"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.manager ;;
  }

  dimension: manager_email_2155 {
    label: "Manager Email"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: reinforcement_role_2155 {
    label: "Reinforcement Role"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.reinforcement_role ;;
  }

  dimension: sales_flag_2155 {
    label: "Sales Flag"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.sales_flag ;;
  }

  dimension: sales_role_2155 {
    label: "Sales Role"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.sales_role ;;
  }

  dimension: sales_u_start_role_2155 {
    label: "Sales U Start Role"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.sales_u_start_role ;;
  }

  dimension: segment_2155 {
    label: "Segment"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension: support_country_2155 {
    label: "Support Country"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.support_country ;;
  }

  dimension: support_region_2155 {
    label: "Support Region"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.support_region ;;
  }

  dimension: trained_status_2155 {
    label: "Trained Status"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.trained_status ;;
  }

  dimension: user_id_2155 {
    label: "User Id"
    required_access_grants: [SalesU]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: work_country_2155 {
    label: "Work Country"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.work_country ;;
  }

  dimension: work_location_2155 {
    label: "Work Location"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.work_location ;;
  }

  dimension: work_region_2155 {
    label: "Work Region"
    required_access_grants: [SalesU]
    type: string
    sql: ${TABLE}.work_region ;;
  }

  measure: count_2155 {
    label: "Count"
    required_access_grants: [SalesU]
    type: count
    drill_fields: []
  }

  measure: count_of_L6_Manager_2155 {
    label: "count_of_L6_Manager"
    required_access_grants: [SalesU]
    type: number
    sql: count(${l6_manager_2155}) ;;
    drill_fields: []
  }
}
