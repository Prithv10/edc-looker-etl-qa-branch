# The name of this view in Looker is "Leaderboard User Agg Score Vw"
view: leaderboard_user_agg_score_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.leaderboard_user_agg_score_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.leaderboard_user_agg_score_vw`
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

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: score_total {
    type: number
    sql: ${TABLE}.score_total ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_score_total {
    type: sum
    sql: ${score_total} ;;
  }

  measure: average_score_total {
    type: average
    sql: ${score_total} ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
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
    sql: ${TABLE}.time_account_created ;;
    html: {{ rendered_value | date: "%D %r" }};;
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
    sql: ${TABLE}.time_account_suspended ;;
    html: {{ rendered_value | date: "%D %r" }};;
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
  dimension: is_org_email {
    type: string
    sql:  CASE WHEN INSTR(${TABLE}.email,'@edcast.com')>0 THEN 'Yes' ELSE 'No' END ;;
  }

#Custom Dimension
  #CONCAT(`User Full Name`,' (',`User ID`,')')
  dimension: user_name_and_id{
    type: string
    sql: concat(${user_full_name},' (',${user_id},')') ;;
  }

  measure: count {
    type: count
    drill_fields: [details*]
    }

    set: details {
      fields: [is_org_email,excluded_from_leaderboard,user_account_status,
        score_total,user_id,user_full_name,time_account_created_time,
        sign_in_count,time_account_suspended_time
  ]
    }



 #   drill_fields: [user_full_name]


}
