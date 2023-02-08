include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/south_east_2/*.view.lkml"

access_grant: LEXI_SRO {
  allowed_values: ["edc_prod_analytics_customer_600003"]
  user_attribute: database
}

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
view: +cf_0_latest_user_details_vw_4 {

  dimension: division_name_600003 {
    label: "Division Name"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.division_name ;;
  }

  dimension: external_id_600003 {
    label: "External ID"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: go1_id_600003 {
    label: "Go1 Id"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.go1_id ;;
  }

  dimension: grade_level_600003 {
    label: "Grade Level"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.grade_level ;;
  }

  dimension: manager_email_600003 {
    label: "Manager Email"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: manager_id_600003 {
    label: "Manager Id"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: on_leave_600003 {
    label: "On Leave"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.on_leave ;;
  }

  dimension: position_id_600003 {
    label: "Position Id"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.position_id ;;
  }

  dimension: position_name_600003 {
    label: "Position Name"
    required_access_grants: [LEXI_SRO]
    type: string
    sql: ${TABLE}.position_name ;;
  }

  dimension: user_id_600003 {
    label: "User Id"
    required_access_grants: [LEXI_SRO]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: employee_or_contractor {
    type: string
    sql: CASE
             when ${position_name_600003} like 'Contractor' then 'Contractor'
             When ${division_name_600003} like 'contractor' then 'Contractor'
             Else 'Employee'
        END ;;
  }

  measure: count_600003 {
    label: "Count"
    required_access_grants: [LEXI_SRO]
    type: count
    drill_fields: []
  }
}
