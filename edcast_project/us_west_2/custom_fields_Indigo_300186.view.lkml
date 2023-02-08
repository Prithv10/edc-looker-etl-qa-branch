    include: "/edcast_project/views/original_views/*.view.lkml"
    include: "/edcast_project/us_west_2/*.view.lkml"

    access_grant: Indigo {
      allowed_values: ["edc_prod_analytics_customer_300186"]
      user_attribute: database
    }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"

# Deleted the sql line

    view: +cf_0_latest_user_details_vw_2 {
  dimension: department_300186 {
    label: "Department"
    required_access_grants: [Indigo]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: division_300186 {
    label: "Division"
    required_access_grants: [Indigo]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: employee_type_300186 {
    label: "Employee Type"
    required_access_grants: [Indigo]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: user_id_300186 {
    hidden: yes
    label: "User ID"
    required_access_grants: [Indigo]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300186 {
    label: "Count"
    required_access_grants: [Indigo]
    type: count
    drill_fields: []
  }
}
