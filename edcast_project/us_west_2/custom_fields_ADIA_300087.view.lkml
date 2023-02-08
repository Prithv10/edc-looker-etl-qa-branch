  include: "/edcast_project/views/original_views/*.view.lkml"
  include: "/edcast_project/us_west_2/*.view.lkml"

  access_grant: ADIA {
    allowed_values: ["edc_prod_analytics_customer_300087"]
    user_attribute: database
  }
# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_2 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: approval_level_300087 {
    label: "Approval Level"
    required_access_grants: [ADIA]
    type: string
    sql: ${TABLE}.approval_level ;;
  }

  dimension: date_of_joining_300087 {
    label: "Date Of Joining"
    required_access_grants: [ADIA]
    type: string
    sql: ${TABLE}.date_of_joining ;;
  }

  dimension: department_300087 {
    label: "Department"
    required_access_grants: [ADIA]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: division_300087 {
    label: "Division"
    required_access_grants: [ADIA]
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: file_number_300087 {
    label: "File_number"
    required_access_grants: [ADIA]
    type: string
    sql: ${TABLE}.file_number ;;
  }

  dimension: grade_300087 {
    label: "Grade"
    required_access_grants: [ADIA]
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: position_300087 {
    label: "Position"
    required_access_grants: [ADIA]
    type: string
    sql: ${TABLE}.position ;;
  }

  dimension: section_300087 {
    label: "Section"
    required_access_grants: [ADIA]
    type: string
    sql: ${TABLE}.section ;;
  }

  dimension: user_id_300087 {
    label: "User Id"
    required_access_grants: [ADIA]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_300087 {
    label: "Count"
    required_access_grants: [ADIA]
    type: count
    drill_fields: []
  }
}
