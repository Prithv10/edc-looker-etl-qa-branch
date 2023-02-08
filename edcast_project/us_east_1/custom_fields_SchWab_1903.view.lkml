  include: "/edcast_project/views/original_views/*.view.lkml"
  include: "/edcast_project/us_east_1/*.view.lkml"

access_grant:SchWab{
  allowed_values: ["edc_prod_analytics_customer_1903"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_3 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: company_1903 {
    label: "Company"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: company_code_1903 {
    label: "Company Code"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension: cost_center_1903 {
    label: "Cost Cente"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: cost_center_code_1903 {
    label: "Cost Center Code"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.cost_center_code ;;
  }

  dimension: domain_code_1903 {
    label: "Domain Code"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.domain_code ;;
  }

  dimension: email_1903 {
    label: "Email"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: enterprise_1903 {
    label: "Enterprise"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.enterprise ;;
  }

  dimension: enterprise_code_1903 {
    label: "Enterprise Code"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.enterprise_code ;;
  }

  dimension: external_id_1903 {
    label: "External ID"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: hire_date_1903 {
    label: "Hire Date"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_code_1903 {
    label: "Job Code"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_level_1903 {
    label: "Job Level"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.job_level ;;
  }

  dimension: job_profile_1903 {
    label: "Job Profile"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.job_profile ;;
  }

  dimension: linked_in_learning_1903 {
    label: "Linked In Learning"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.linked_in_learning ;;
  }

  dimension: mail_drop_1903 {
    label: "Mail Drop"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.mail_drop ;;
  }

  dimension: management_chain_01_1903 {
    label: "Management Chain 01"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_01 ;;
  }

  dimension: management_chain_02_1903 {
    label: "Management Chain 02"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_02 ;;
  }

  dimension: management_chain_03_1903 {
    label: "Management Chain 03"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_03 ;;
  }

  dimension: management_chain_04_1903 {
    label: "Management Chain 04"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_04 ;;
  }

  dimension: management_chain_05_1903 {
    label: "Management Chain 05"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_05 ;;
  }

  dimension: management_chain_06_1903 {
    label: "Management Chain 06"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_06 ;;
  }

  dimension: management_chain_07_1903 {
    label: "Management Chain 07"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_07 ;;
  }

  dimension: management_chain_08_1903 {
    label: "Management Chain 09"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_08 ;;
  }

  dimension: management_chain_09_1903 {
    label: "Management Chain 09"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_09 ;;
  }

  dimension: management_chain_10_1903 {
    label: "Management Chain 10"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.management_chain_10 ;;
  }

  dimension: manager_schwab_id_1903 {
    label: "Manager Schwab ID"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.manager_schwab_id ;;
  }

  dimension: name_1903 {
    label: "Name"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: reporting_region_1903 {
    label: "Reporting Region"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.reporting_region ;;
  }

  dimension: rescinded_hire_1903 {
    label: "Rescinded Hire"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.rescinded_hire ;;
  }

  dimension: safari_user_1903 {
    label: "Safari User"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.safari_user ;;
  }

  dimension: schwab_id_1903 {
    label: "Schwab ID"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.schwab_id ;;
  }

  dimension: status_1903 {
    label: "Status"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sub_function_1903 {
    label: "Sub Function"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.sub_function ;;
  }

  dimension: sub_function_code_1903 {
    label: "Sub Function Code"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.sub_function_code ;;
  }

  dimension: sumtotal_pk_1903 {
    label: "Sumtotal PK"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.sumtotal_pk ;;
  }

  dimension: supervisory_org_id_1903 {
    label: "Supervisory Org ID"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.supervisory_org_id ;;
  }

  dimension: supervisory_organization_1903 {
    label: "Supervisory Organization"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.supervisory_organization ;;
  }

  dimension: term_date_1903 {
    label: "Term Date"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.term_date ;;
  }

  dimension: udemy_user_1903 {
    label: "Udemy User"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.udemy_user ;;
  }

  dimension: user_id_1903 {
    label: "User ID"
    required_access_grants: [SchWab]
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: work_address_1903 {
    label: "Work Address"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.work_address ;;
  }

  dimension: work_city_1903 {
    label: "Work City"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.work_city ;;
  }

  dimension: work_country_1903 {
    label: "Work Country"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.work_country ;;
  }

  dimension: work_location_1903 {
    label: "Work Location"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.work_location ;;
  }

  dimension: work_phone_1903 {
    label: "Work Phone"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.work_phone ;;
  }

  dimension: work_state_1903 {
    label: "Work State"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.work_state ;;
  }

  dimension: work_zip_code_1903 {
    label: "Work Zip Code"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.work_zip_code ;;
  }

  dimension: worker_type_1903 {
    label: "Worker Type"
    required_access_grants: [SchWab]
    type: string
    sql: ${TABLE}.worker_type ;;
  }

  measure: count_1903 {
    label: "Count"
    required_access_grants: [SchWab]
    type: count
    drill_fields: [name_1903]
  }
}
