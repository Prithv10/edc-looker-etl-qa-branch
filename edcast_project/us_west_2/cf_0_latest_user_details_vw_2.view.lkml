view: cf_0_latest_user_details_vw_2{
  view_label: "Org Custom Fields"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.cf_0_latest_user_details_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.cf_0_latest_user_details_vw` ;;



  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }


}
