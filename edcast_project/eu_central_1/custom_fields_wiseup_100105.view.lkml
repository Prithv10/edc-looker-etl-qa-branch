include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

  access_grant: wiseup {
    allowed_values: ["edc_prod_analytics_customer_100105"]
    user_attribute: database
  }

  view: +cf_0_latest_user_details_vw_1 {

  dimension: abteilung_100105 {
    label: "Abteilung"
    required_access_grants: [wiseup]
    type: string
    sql: ${TABLE}.abteilung ;;
  }

  dimension: abteilung_id_100105 {
    label: "Abteilung ID"
    required_access_grants: [wiseup]
    type: string
    sql: ${TABLE}.abteilung_id ;;
  }

  dimension: amm_100105 {
    label: "AMM"
    required_access_grants: [wiseup]
    type: string
    sql: ${TABLE}.amm ;;
  }

  dimension: company_100105 {
    label: "Company"
    required_access_grants: [wiseup]
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: organisation_100105 {
    label: "Organisation"
    required_access_grants: [wiseup]
    type: string
    sql: ${TABLE}.organisation ;;
  }

  dimension: organisation_id_100105 {
    label: "Organisation ID"
    required_access_grants: [wiseup]
    type: string
    sql: ${TABLE}.organisation_id ;;
  }

  dimension: user_id_100105 {
    label: "User ID"
    required_access_grants: [wiseup]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_100105 {
    label: "Count"
    required_access_grants: [wiseup]
    type: count
    drill_fields: []
  }
}
