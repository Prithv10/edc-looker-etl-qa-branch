include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/south_east_2/*.view.lkml"

access_grant: bendigo {
  allowed_values: ["edc_prod_analytics_customer_600016"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_4 {

  dimension: company_grouping_600016 {
    label: "Company Grouping"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.company_grouping ;;
  }

  dimension: cost_centre_code_600016 {
    label: "Cost Centre Code"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.cost_centre_code_600016 ;;
  }

  dimension: cost_centre_description_600016 {
    label: "Cost Centre Description"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.cost_centre_description ;;
  }

  dimension: department_ml2_600016 {
    label: "Department ML2"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.department_ml2 ;;
  }

  dimension: division_ml1_600016 {
    label: "Division ML1"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.division_ml1 ;;
  }

  dimension: manager_email_600016 {
    label: "Manager Email"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_id_600016 {
    label: "Manager Id"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: ml1_code_600016 {
    label: "ML1 Code"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.ml1_code ;;
  }

  dimension: ml2_code_600016 {
    label: "ML2 Code"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.ml2_code ;;
  }

  dimension: ml3_code_600016 {
    label: "ML3 Code"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.ml3_code ;;
  }

  dimension: ml3_description_600016 {
    label: "ML3 Description"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.ml3_description ;;
  }

  dimension: ml4_code_600016 {
    label: "ML4 Code"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.ml4_code ;;
  }

  dimension: ml4_description_600016 {
    label: "ML4 Description"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.ml4_description ;;
  }

  dimension: ml5_code_600016 {
    label: "ML5 Code"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.ml5_code ;;
  }

  dimension: ml5_description_600016 {
    label: "ML5 Description"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.ml5_description ;;
  }

  dimension: new_starter_600016 {
    label: "New Starter"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.new_starter ;;
  }

  dimension: people_leader_600016 {
    label: "People Leader"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.people_leader ;;
  }

  dimension: position_ext_cust_600016 {
    label: "Position Ext Cust"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.position_ext_cust ;;
  }

  dimension: position_lend_resp_600016 {
    label: "Position Lend Resp"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.position_lend_resp ;;
  }

  dimension: position_role_base_600016 {
    label: "Position Role Base"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.position_role_base ;;
  }

  dimension: position_sales_role_600016 {
    label: "Position Sales Role"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.position_sales_role ;;
  }

  dimension: position_title_600016 {
    label: "Position Title"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.position_title ;;
  }

  dimension: start_date_date_hired_600016 {
    label: "Start Date (Date) Hired"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.start_date_date_hired ;;
  }

  dimension: user_id_600016 {
    label: "User Id"
    required_access_grants: [bendigo]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: work_location_600016 {
    label: "Work Location"
    required_access_grants: [bendigo]
    type: string
    sql: ${TABLE}.work_location ;;
  }

  measure: count_600016 {
    label: "Count"
    required_access_grants: [bendigo]
    type: count
    drill_fields: []
  }
}
