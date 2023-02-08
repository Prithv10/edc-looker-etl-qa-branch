include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"


access_grant: nationwide {
  allowed_values: ["edc_prod_analytics_customer_100121"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_1 {

  dimension: area_100121 {
    label: "Area"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: department_100121 {
    label: "Department"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: deptid_100121 {
    label: "Deptid"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.deptid ;;
  }

  dimension: district_100121 {
    label: "District"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: division_100121 {
    label: "Division"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: external_id_100121 {
    label: "External ID"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: given_name_100121 {
    label: "Given Name"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.given_name ;;
  }

  dimension: job_code_100121 {
    label: "Job Code"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: job_title_100121 {
    label: "Job Title"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: location_code_100121 {
    label: "Location Code"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.location_code ;;
  }

  dimension: manager_email_100121 {
    label: "Manager Email"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_id_100121 {
    label: "Manager ID"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: manager_name_100121 {
    label: "Manager Name"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: region_100121 {
    label: "Region"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: status_100121 {
    label: "Status"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id_100121 {
    label: "User ID"
    required_access_grants: [nationwide]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_person_type_100121 {
    label: "User Person Type"
    required_access_grants: [nationwide]
    type: string
    sql: ${TABLE}.user_person_type ;;
  }

  measure: count_100121 {
    label: "Count"
    required_access_grants: [nationwide]
    type: count
    drill_fields: [given_name_100121, manager_name_100121]
  }
}
