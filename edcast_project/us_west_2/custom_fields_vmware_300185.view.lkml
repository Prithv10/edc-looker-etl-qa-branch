include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"

access_grant: vmware {
  allowed_values: ["edc_prod_analytics_customer_300185"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_2 {

  dimension: acquired_company_name_300185 {
    label: "Acquired Company Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.acquired_company_name ;;
  }

  dimension: business_title_300185 {
    label: "Business Title"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.business_title ;;
  }

  dimension: company_id_300185 {
    label: "Company Id"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: company_name_300185 {
    label: "Company Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: email_primary_work_300185 {
    label: "Email Primary Work"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.email_primary_work ;;
  }

  dimension: employee_id_300185 {
    label: "Employee Id"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: employee_or_contingent_worker_type_300185 {
    label: "Employee Or Contingent Worker Type"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.employee_or_contingent_worker_type ;;
  }

  dimension: hire_date_300185 {
    label: "Hire Date"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: is_manager_300185 {
    label: "Is Manager?"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_code_300185 {
    label: "Job Code"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_family_group_name_300185 {
    label: "Job Family Group Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.job_family_group_name ;;
  }

  dimension: job_family_name_300185 {
    label: "Job Family Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.job_family_name ;;
  }

  dimension: job_profile_level_300185 {
    label: "Job Profile Level"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.job_profile_level ;;
  }

  dimension: job_profile_name_300185 {
    label: "Job Profile Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.job_profile_name ;;
  }

  dimension: location_300185 {
    label: "Location"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: location_country_name_300185 {
    label: "Location Country Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.location_country_name ;;
  }

  dimension: management_chain_level_01_preferred_name_300185 {
    label: "Management Chain Level 01 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_01_preferred_name ;;
  }

  dimension: management_chain_level_02_preferred_name_300185 {
    label: "Management Chain Level 02 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_02_preferred_name ;;
  }

  dimension: management_chain_level_03_preferred_name_300185 {
    label: "Management Chain Level 03 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_03_preferred_name ;;
  }

  dimension: management_chain_level_04_preferred_name_300185 {
    label: "Management Chain Level 04 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_04_preferred_name ;;
  }

  dimension: management_chain_level_05_preferred_name_300185 {
    label: "Management Chain Level 05 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_05_preferred_name ;;
  }

  dimension: management_chain_level_06_preferred_name_300185 {
    label: "Management Chain Level 06 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_06_preferred_name ;;
  }

  dimension: management_chain_level_07_preferred_name_300185 {
    label: "Management Chain Level 07 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_07_preferred_name ;;
  }

  dimension: management_chain_level_08_preferred_name_300185 {
    label: "Management Chain Level 08 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_08_preferred_name ;;
  }

  dimension: management_chain_level_09_preferred_name_300185 {
    label: "Management Chain Level 09 Preferred Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_chain_level_09_preferred_name ;;
  }

  dimension: management_level_300185 {
    label: "Management Level"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.management_level ;;
  }

  dimension: manager_id_300185 {
    label: "Manager Id"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: managers_primary_work_email_300185 {
    label: "Manager's Primary Work Email"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.managers_primary_work_email ;;
  }

  dimension: nle_flag_300185 {
    label: "NLE Flag"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.nle_flag ;;
  }

  dimension: preferred_name_first_name_300185 {
    label: "Preferred First Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.preferred_name_first_name ;;
  }

  dimension: preferred_name_last_name_300185 {
    label: "Preferred Last Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.preferred_name_last_name ;;
  }

  dimension: region_300185 {
    label: "Region"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: sup_org_l3_name_300185 {
    label: "Supervisory Organization 13 Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.sup_org_l3_name ;;
  }

  dimension: sup_org_l4_name_300185 {
    label: "Supervisory Organization 14 Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.sup_org_l4_name ;;
  }

  dimension: sup_org_l5_name_300185 {
    label: "Supervisory Organization 15 Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.sup_org_l5_name ;;
  }

  dimension: sup_org_l6_name_300185{
    label: "Supervisory Organization 16 Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.sup_org_l6_name ;;
  }

  dimension: sup_org_l7_name_300185 {
    label: "Supervisory Organization 17 Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.sup_org_l7_name ;;
  }

  dimension: sup_org_l8_name_300185 {
    label: "Supervisory Organization 18 Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.sup_org_l8_name ;;
  }

  dimension: sup_org_l9_name_300185 {
    label: "Supervisory Organization 19 Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.sup_org_l9_name ;;
  }

  dimension: supervisory_organization_300185 {
    label: "Supervisory Organization"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.supervisory_organization ;;
  }

  dimension: termination_date_300185 {
    label: "Termination Date"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.termination_date ;;
  }

  dimension: user_id_300185 {
    label: "User Id"
    required_access_grants: [vmware]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name_300185 {
    label: "User Name"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: worker_is_a_new_graduate_300185 {
    label: "Worker Is A New Graduate"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.worker_is_a_new_graduate ;;
  }

  dimension: worker_status_300185 {
    label: "Worker Status"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.worker_status ;;
  }

  dimension: wwrace_audience_300185 {
    label: "WWRace Audience"
    required_access_grants: [vmware]
    type: string
    sql: ${TABLE}.wwrace_audience ;;
  }

  measure: count {
    required_access_grants: [vmware]
    type: count
    drill_fields: []
  }

measure: count_regions {
  required_access_grants: [vmware]
  type: number
  sql: count(${region_300185}) ;;
  drill_fields: []
}

  # # ----- Sets of fields for drilling ------
  # set: detail {
  #   fields: [
  #     acquired_company_name,
  #     job_family_group_name,
  #     user_name,
  #     sup_org_l9_name,
  #     management_chain_level_06_preferred_name,
  #     preferred_name_first_name,
  #     sup_org_l6_name,
  #     sup_org_l3_name,
  #     job_family_name,
  #     management_chain_level_09_preferred_name,
  #     sup_org_l8_name,
  #     sup_org_l5_name,
  #     management_chain_level_01_preferred_name,
  #     location_country_name,
  #     job_profile_name,
  #     management_chain_level_05_preferred_name,
  #     management_chain_level_08_preferred_name,
  #     management_chain_level_02_preferred_name,
  #     management_chain_level_04_preferred_name,
  #     company_name,
  #     sup_org_l4_name,
  #     management_chain_level_07_preferred_name,
  #     preferred_name_last_name,
  #     sup_org_l7_name,
  #     management_chain_level_03_preferred_name
  #   ]
  # }
}
