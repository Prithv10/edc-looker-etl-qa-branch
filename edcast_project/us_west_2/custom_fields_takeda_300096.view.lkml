include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/us_west_2/*.view.lkml"


  access_grant: takeda {
    allowed_values: ["edc_prod_analytics_customer_300096"]
    user_attribute: database
  }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_2 {

  dimension: bu_name_300096 {
    label: "Business Unit Name"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.bu_name ;;
  }

  dimension: career_band_300096 {
    label: "Career Band"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.career_band ;;
  }

  dimension: cc_email_address_300096 {
    label: "CC Email Address"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.cc_email_address ;;
  }

  dimension: city_300096 {
    label: "City"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company_reference_id_300096 {
    label: "Company Reference Id"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.company_reference_id ;;
  }

  dimension: country_300096 {
    label: "Country"
    required_access_grants: [takeda]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: cw_supplier_300096 {
    label: "CW Supplier"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.cw_supplier ;;
  }

  dimension: department_300096 {
    label: "Department"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: emp_typ_id_300096 {
    label: "Employee Type Id"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.emp_typ_id ;;
  }

  dimension: employee_type_300096 {
    label: "Employee Type"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: first_name_300096 {
    label: "First Name"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: franchise_300096 {
    label: "Franchise"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.franchise ;;
  }

  dimension: functional_area_300096 {
    label: "Functional Area"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.functional_area ;;
  }

  dimension: gmsgq_group_300096 {
    label: "GMSGQ Group"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.gmsgq_group ;;
  }

  dimension: hire_date_300096 {
    label: "Hire Date"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: is_international_assignee_300096 {
    label: "Is International Assignee?"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.is_international_assignee ;;
  }

  dimension: is_manager_300096 {
    label: "Is Manager?"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.is_manager ;;
  }

  dimension: job_family_300096 {
    label: "Job Family"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_family_group_300096 {
    label: "Job Family Group"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.job_family_group ;;
  }

  dimension: job_location_description_300096 {
    label: "Job Location Description"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.job_location_description ;;
  }

  dimension: job_profile_id_300096 {
    label: "Job Profile Id"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.job_profile_id ;;
  }

  dimension: job_title_300096 {
    label: "Job Title"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: language_300096 {
    label: "Language"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: last_name_300096 {
    label: "Last Name"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: leave_end_date_300096 {
    label: "Leave End Date"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.leave_end_date ;;
  }

  dimension: leave_start_date_300096 {
    label: "Leave Start Date"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.leave_start_date ;;
  }

  dimension: location_type_300096 {
    label: "Location Type"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.location_type ;;
  }

  dimension: management_level_300096 {
    label: "Management Level"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.management_level ;;
  }

  dimension: manager_email_300096 {
    label: "Manager Email"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_email_id_300096 {
    label: "Manager Email Id"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.manager_email_id ;;
  }

  dimension: manager_id_300096 {
    label: "Manager Id"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: manager_name_300096 {
    label: "Manager Name"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: manager_type_300096 {
    label: "Manager Type"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.manager_type ;;
  }

  dimension: managers_name_300096 {
    label: "Manager's Name"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.managers_name ;;
  }

  dimension: opex_function_300096 {
    label: "Opex Function"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.opex_function ;;
  }

  dimension: region_id_300096 {
    label: "Region Id"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.region_id ;;
  }

  dimension: role_300096 {
    label: "Role"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: sales_area_300096 {
    label: "Sales Area"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.sales_area ;;
  }

  dimension: sales_district_300096 {
    label: "Sales District"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.sales_district ;;
  }

  dimension: sales_region_300096 {
    label: "Sales Region"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.sales_region ;;
  }

  dimension: sales_territory_300096 {
    label: "Sales Territory"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.sales_territory ;;
  }

  dimension: state_300096 {
    label: "State"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: supervisory_organization_300096 {
    label: "Supervisory Organization"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.supervisory_organization ;;
  }

  dimension: term_date_300096 {
    label: "Term Date"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.term_date ;;
  }

  dimension: tet_300096 {
    label: "TET"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.tet ;;
  }

  dimension: tet_1_300096 {
    label: "TET 1"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.tet_1 ;;
  }

  dimension: tet_2_300096 {
    label: "TET 2"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.tet_2 ;;
  }

  dimension: tet_3_300096 {
    label: "TET 3"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.tet_3 ;;
  }

  dimension: tet_4_300096 {
    label: "TET 4"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.tet_4 ;;
  }

  dimension: tet_5_300096 {
    label: "TET 5"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.tet_5 ;;
  }

  dimension: tet_6_300096 {
    label: "TET 6"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.tet_6 ;;
  }

  dimension: time_zone_300096 {
    label: "Time Zone"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: title_300096 {
    label: "Title"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: user_id_300096 {
    label: "User Id"
    required_access_grants: [takeda]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name_300096 {
    label: "User Name"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: worker_status_300096 {
    label: "Worker Status"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.worker_status ;;
  }

  dimension: worker_type_300096 {
    label: "Worker Type"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.worker_type ;;
  }

  dimension: workshift_300096 {
    label: "Workshift"
    required_access_grants: [takeda]
    type: string
    sql: ${TABLE}.workshift ;;
  }

  measure: count {
    required_access_grants: [takeda]
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: []
  }
}
