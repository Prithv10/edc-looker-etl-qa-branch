# The name of this view in Looker is "U3 Users User Funnel Data Explorer Vw"
view: u3_users_user_funnel_data_explorer_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

 #sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u3_users_user_funnel_data_explorer_vw` ;;

  sql_table_name: `{{_user_attributes['database']}}.u3_users_user_funnel_data_explorer_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: metrics {
    type: string
    sql: ${TABLE}.metrics ;;
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
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
        drill_fields: [details*]
  }

  set: details {
    fields: [user_id,user_full_name]
  }
}
