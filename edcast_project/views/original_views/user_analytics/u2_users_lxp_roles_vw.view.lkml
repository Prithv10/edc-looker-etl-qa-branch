# The name of this view in Looker is "U2 Users Lxp Roles Vw"
view: u2_users_lxp_roles_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u2_users_lxp_roles_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.u2_users_lxp_roles_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
#    drill_fields: [detail*]
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: lxp_role {
    type: string
    sql: ${TABLE}.LXP_Role ;;
  #  drill_fields: [detail*]
  }

  dimension: lxp_role_new {
    type: string
    sql: ${TABLE}.LXP_ROLE_NEW ;;
  }

  dimension: org_id_s {
    type: number
    value_format_name: id
    sql: ${TABLE}.org_id_s ;;
  }

  dimension: role_id {
    type: number
    sql: ${TABLE}.Role_ID ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sign_in_count {
    type: sum
    sql: ${sign_in_count} ;;
  }

  measure: average_sign_in_count {
    type: average
    sql: ${sign_in_count} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: time_account_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Time_Account_Created ;;
    html: {{ rendered_value | date: "%D %r" }};;
#   drill_fields: [detail*]
  }

  dimension_group: time_account_suspended {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Time_Account_Suspended ;;
    html: {{ rendered_value | date: "%D %r" }};;

  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.User_Account_Status ;;
 #   drill_fields: [detail*]
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
 #   drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.User_ID ;;
 #   drill_fields: [detail*]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

measure: count_user_IDs {
  type: number
  sql: count(${user_id});;
  drill_fields: [detail*]
}

  measure: count_distinct_user_IDs {
    type: count_distinct
    sql: ${user_id};;
    drill_fields: [detail*]
  }
  set: detail {
    fields: [lxp_role,user_full_name,email,user_id,user_account_status,time_account_created_raw,role_id,excluded_from_leaderboard,sign_in_count,
      time_account_suspended_raw,external_id,lxp_role_new]
  }
}
