# The name of this view in Looker is "U3 Users User Metrics Data Explorer Vw"
view: u3_users_user_metrics_data_explorer_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
 # sql_table_name: `aws-us-west-2-prod-03.edc_prod_analytics_customer_300089.u3_users_user_metrics_data_explorer_vw`
   # ;;


  sql_table_name: `{{_user_attributes['database']}}.u3_users_user_metrics_data_explorer_vw`
  ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Badge ID" in Explore.

  dimension: badge_id {
    type: string
    sql: ${TABLE}.badge_id ;;
  }

  dimension: badge_title {
    type: string
    sql: ${TABLE}.badge_title ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: metrics {
    type: string
    sql: ${TABLE}.metrics ;;
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.User_Account_Status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count

   # drill_fields: [details*]

  }

  measure: count_of_user_id {
    type: number
    sql: count(${user_id}) ;;

   # drill_fields: [details*]
  }






}
