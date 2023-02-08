include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: ubs {
  allowed_values: ["edc_prod_analytics_customer_100128"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {


  dimension: business_title_100128{
    label: "Business Title"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.business_title ;;
  }

  dimension: city_100128  {
    label: "City"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country_100128  {
    label: "Country"
    required_access_grants: [ubs]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: department_100128  {
    label: "Department"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: gcrs_business_area_100128  {
    label: "Gcrs Business Area"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_area ;;
  }

  dimension: gcrs_business_area_code_100128  {
    label: "Gcrs Business Area Code"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_area_code ;;
  }

  dimension: gcrs_business_division_100128  {
    label: "Gcrs Business Division"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_division ;;
  }

  dimension: gcrs_business_division_code_100128  {
    label: "Gcrs Business Division Code"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_division_code ;;
  }

  dimension: gcrs_business_sector_100128  {
    label: "Gcrs Business Sector"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_sector ;;
  }

  dimension: gcrs_business_sector_code_100128  {
    label: "Gcrs Business Sector Code"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_sector_code ;;
  }

  dimension: gcrs_business_segment_100128  {
    label: "Gcrs Business Segment"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_segment ;;
  }

  dimension: gcrs_business_segment_code_100128  {
    label: "Gcrs Business Segment Code"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_segment_code ;;
  }

  dimension: gcrs_business_unit_100128  {
    label: "Gcrs Business Unit"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_unit ;;
  }

  dimension: gcrs_business_unit_code_100128  {
    label: "Gcrs Business Unit Code"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.gcrs_business_unit_code ;;
  }

  dimension: grade_100128 {
    label: "Grade"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: hire_date_100128 {
    label: "Hire Date"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.hire_date ;;
  }

  dimension: job_code_100128 {
    label: "Job Code"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: manager_email_100128 {
    label: "Manager Email"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_external_id_100128  {
    label: "Manager External Id"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.manager_external_id ;;
  }

  dimension: manager_id_100128  {
    label: "Manager Id"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: manager_name_100128  {
    label: "Manager Name"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: rank_code_100128 {
    label: "Rank Code"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.rank_code ;;
  }

  dimension: rank_id_100128 {
    label: "Rank Id"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.rank_id ;;
  }

  dimension: region_100128 {
    label: "Region"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: region_code_100128 {
    label: "Region Code"
    required_access_grants: [ubs]
    type: string
    sql: ${TABLE}.region_code ;;
  }

  dimension: user_id_100128 {
    label: "User Id"
    required_access_grants: [ubs]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_100128 {
    label: "Count"
    required_access_grants: [ubs]
    type: count
    drill_fields: []
  }
}
