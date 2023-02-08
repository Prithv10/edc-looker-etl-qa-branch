include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"
#include: "/edcast_project/us_west_2/cf_0_latest_user_details_vw_2.view.lkml"


access_grant: jci_johnsoncontrols {
  allowed_values: ["edc_prod_analytics_customer_300181"]
  user_attribute: database
}
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_2 {
#final: yes
  dimension: address1_300181 {
    label: "Address 1"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2_300181 {
    label: "Address 2"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: bsna_domain_300181 {
    label: "BSNA Domain"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.bsna_domain ;;
  }

  dimension: business_name_300181 {
    label: "Business Name"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.business_name ;;
  }

  dimension: business_org_300181 {
    label: "Business Org"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.business_org ;;
  }

  dimension: business_org_1_300181 {
    label: "Business Org 1"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.business_org_1 ;;
  }

  dimension: business_org_2_300181 {
    label: "Business Org 2"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.business_org_2 ;;
  }

  dimension: business_title_300181 {
    label: "Business Title"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.business_title ;;
  }

  dimension: city_300181 {
    label: "City"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company_300181 {
    label: "Company"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: cost_center_300181 {
    label: "Cost Center"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: country_300181 {
    label: "Country"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: current_position_date_300181 {
    label: "Current Position Date"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.current_position_date ;;
  }

  dimension: department_300181 {
    label: "Department"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: employee_type_300181 {
    label: "Employee Type"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: end_date_300181 {
    label: "End Date"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.end_date ;;
  }

  dimension: fax_300181 {
    label: "Fax"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: gender_300181 {
    label: "Gender"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: hr_partner_email_300181 {
    label: "HR Partner Email"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.hr_partner_email ;;
  }

  dimension: hr_partner_id_300181 {
    label: "HR Partner Id"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.hr_partner_id ;;
  }

  dimension: hr_partner_name_300181 {
    label: "HR Partner Name"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.hr_partner_name ;;
  }

  dimension: is_manager_300181 {
    label: "Is Manager?"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: jci_id_300181 {
    label: "JCI Id"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.jci_id ;;
  }

  dimension: job_category_300181 {
    label: "Job Category"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.job_category ;;
  }

  dimension: job_family_300181 {
    label: "Job Family"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_family_group_300181 {
    label: "Job Family Group"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.job_family_group ;;
  }

  dimension: job_location_300181 {
    label: "Job Location"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.job_location ;;
  }

  dimension: job_location_code_300181 {
    label: "Job Location Code"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.job_location_code ;;
  }

  dimension: job_profile_300181 {
    label: "Job Profile"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.job_profile ;;
  }

  dimension: job_title_300181 {
    label: "Job Title"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: language_300181 {
    label: "Language"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: leader_level_2_300181 {
    label: "Leader Level 2"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.leader_level_2 ;;
  }

  dimension: leader_level_3_300181 {
    label: "Leader Level 3"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.leader_level_3 ;;
  }

  dimension: leader_level_4_300181 {
    label: "Leader Level 4"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.leader_level_4 ;;
  }

  dimension: leader_level_5_300181 {
    label: "Leader Level 5"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.leader_level_5 ;;
  }

  dimension: middle_name_300181 {
    label: "Middle Name"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: ml_code_300181 {
    label: "ML Code"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.ml_code ;;
  }

  dimension: name_prefix_300181 {
    label: "Name Prefix"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.name_prefix ;;
  }

  dimension: name_suffix_300181 {
    label: "Name Suffix"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.name_suffix ;;
  }

  dimension: phone1_300181 {
    label: "Phone 1"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.phone1 ;;
  }

  dimension: phone2_300181 {
    label: "Phone 2"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.phone2 ;;
  }

  dimension: region_300181 {
    label: "Region"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: start_date_300181 {
    label: "Start Date"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.start_date ;;
  }

  dimension: state_300181 {
    label: "State"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: sub_region_300181 {
    label: "Sub Region"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.sub_region ;;
  }

  dimension: sumtotal_pk_300181 {
    label: "Sumtotal PK"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.sumtotal_pk ;;
  }

  dimension: time_zone_300181 {
    label: "Time Zone"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: user_id_300181 {
    label: "User Id"
    required_access_grants: [jci_johnsoncontrols]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name_300181 {
    label: "User Name"
    required_access_grants: [jci_johnsoncontrols]
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: zip_300181 {
    label: "ZIP"
    required_access_grants: [jci_johnsoncontrols]
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count_300181 {
    label: "Count"
    required_access_grants: [jci_johnsoncontrols]
    type: count
    drill_fields: []
  }
}
