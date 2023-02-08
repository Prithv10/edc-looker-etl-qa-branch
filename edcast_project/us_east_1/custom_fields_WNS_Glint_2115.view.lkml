  include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_east_1/*.view.lkml"

access_grant:WNSGlint{
  allowed_values: ["edc_prod_analytics_customer_2115"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {

  dimension: bcsla_2115 {
    label: "BCSLA"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.bcsla ;;
  }

  dimension: billability_2115 {
    label: "Billability"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.billability ;;
  }

  dimension: category_2115 {
    label: "Category"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: client_2115 {
    label: "Client"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: company_2115 {
    label: "Company"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: country_2115 {
    label: "Country"
    required_access_grants: [WNSGlint]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: date_of_birth_2115 {
    label: "Date of Birth"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: delivery_location_2115 {
    label: "Delivery Location"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.delivery_location ;;
  }

  dimension: delivery_model_2115 {
    label: "Delivery Mode"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.delivery_model ;;
  }

  dimension: delivery_organization_2115 {
    label: "Delivery Organization"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.delivery_organization ;;
  }

  dimension: department_2115 {
    label: "Department"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: department_description_2115 {
    label: "Department Description"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.department_description ;;
  }

  dimension: division_2115 {
    label: "Division"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: employee_id_2115 {
    label: "Employee Id"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: employee_status_2115 {
    label: "Employee Status"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.employee_status ;;
  }

  dimension: establishment_2115 {
    label: "Establishment"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.establishment ;;
  }

  dimension: full_part_time_2115 {
    label: "Full Part Time"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.full_part_time ;;
  }

  dimension: gender_2115 {
    label: "Gender"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: grade_2115 {
    label: "Grade"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: hire_date_2115 {
    label: "Hire Date"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_code_2115 {
    label: "Job Code"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_description_2115 {
    label: "Job Description"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.job_description ;;
  }

  dimension: last_working_day_2115 {
    label: "Last Working Day"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.last_working_day ;;
  }

  dimension: location_2115 {
    label: "Location"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: location_description_2115 {
    label: "Location Description"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.location_description ;;
  }

  dimension: manager_email_2115 {
    label: "Manager Email"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: middle_name_2115 {
    label: "Middle Name"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: model_code_2115 {
    label: "Model Code"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.model_code ;;
  }

  dimension: name_prefix_2115 {
    label: "Name Prefix"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.name_prefix ;;
  }

  dimension: new_joiner_2115 {
    label: "New Joiner"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.new_joiner ;;
  }

  dimension: organizational_relationship_2115 {
    label: "Organizational Relationship"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.organizational_relationship ;;
  }

  dimension: supervisor_id_2115 {
    label: "Supervisor Id"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.supervisor_id ;;
  }

  dimension: supervisor_name_2115 {
    label: "Supervisor Name"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.supervisor_name ;;
  }

  dimension: team_group_2115 {
    label: "Team Group"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.team_group ;;
  }

  dimension: user_id_2115 {
    label: "User Id"
    required_access_grants: [WNSGlint]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_id_custom_field_2115 {
    label: "User Id Custom Field"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.user_id_custom_field ;;
  }

  dimension: vertical_2115 {
    label: "Vertical"
    required_access_grants: [WNSGlint]
    type: string
    sql: ${TABLE}.vertical ;;
  }

  measure: count_2115 {
    label: "Count"
    required_access_grants: [WNSGlint]
    type: count
    drill_fields: []
  }
}
