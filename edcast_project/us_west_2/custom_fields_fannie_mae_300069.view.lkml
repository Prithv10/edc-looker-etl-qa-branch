  include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: Fannie_Mae_300069 {
  allowed_values: ["edc_prod_analytics_customer_300069"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: business_unit_name_300069 {
    label: "Business Unit Name"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.business_unit_name ;;
  }

  dimension: cost_center_id_300069 {
    label: "Cost Center Id"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.cost_center_id ;;
  }

  dimension: cost_center_name_300069 {
    label: "Cost Center Name"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.cost_center_name ;;
  }

  dimension: current_hire_date_300069 {
    label: "Current Hire Date"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.current_hire_date ;;
  }

  dimension: day_phone_300069 {
    label: "Day Phone"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.day_phone ;;
  }

  dimension: department_name_300069 {
    label: "Department Name"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.department_name ;;
  }

  dimension: division_name_300069 {
    label: "Division Name"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.division_name ;;
  }

  dimension: federation_id_300069 {
    label: "Federation Id"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.federation_id ;;
  }

  dimension: is_manager_300069 {
    label: "Is Manager?"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_code_300069 {
    label: "Job Code"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_family_300069 {
    label: "Job Family"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_family_cluster_300069 {
    label: "Job Family Cluster"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.job_family_cluster ;;
  }

  dimension: job_function_300069 {
    label: "Job Function"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.job_function ;;
  }

  dimension: job_function_cluster_300069 {
    label: "Job Function Cluster"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.job_function_cluster ;;
  }

  dimension: job_title_300069 {
    label: "Job Title"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: last_date_of_employee_300069 {
    label: "Last Date of Employee"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.last_date_of_employee ;;
  }

  dimension: manager_email_300069 {
    label: "Manager Email"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_id_300069 {
    label: "Manager Id"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: manager_level_300069 {
    label: "Manager Level"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.manager_level ;;
  }

  dimension: matrix_manager_300069 {
    label: "Matrix Manager"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.matrix_manager ;;
  }

  dimension: middle_initial_300069 {
    label: "Middle Initial"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.middle_initial ;;
  }

  dimension: original_hire_date_300069 {
    label: "Original Hire Date"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.original_hire_date ;;
  }

  dimension: street1_300069 {
    label: "Street 1"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.street1 ;;
  }

  dimension: super_division_name_300069 {
    label: "Super Division Name"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.super_division_name ;;
  }

  dimension: teleworker_300069 {
    label: "Teleworker"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.teleworker ;;
  }

  dimension: user_id_300069 {
    label: "User Id"
    required_access_grants: [Fannie_Mae_300069]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_id_custom_field_300069 {
    label: "User id Custom Field"
    required_access_grants: [Fannie_Mae_300069]
    type: string
    sql: ${TABLE}.user_id_custom_field ;;
  }

  dimension: individual_contributor_vs_people_manager {
    type: string
    sql: CASE WHEN ${manager_level_300069} IN ('Associate', 'Senior Associate' , 'Lead Associate','Advisor', 'Fellow', 'Principal') THEN 'INDIVIDUAL CONTRIBUTOR'
            WHEN ${manager_level_300069} IN ('Director', 'Senior Director', 'Manager', 'Senior Manager', 'Vice President', 'Vice President(VP)', 'Senior Vice President', 'Executive Vice President', 'Chairman', 'Chief Executive Officer', 'President')
            THEN 'PEOPLE MANAGER'
END ;;
  }

  measure: count_300069 {
    label: "Count"
    required_access_grants: [Fannie_Mae_300069]
    type: count
    drill_fields: []
  }
}
