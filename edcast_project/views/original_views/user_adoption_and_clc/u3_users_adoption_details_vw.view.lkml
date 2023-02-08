# The name of this view in Looker is "U3 Users Adoption Details Vw"
view: u3_users_adoption_details_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `spark_edcast_qa.u3_users_adoption_details_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.u3_users_adoption_details_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Adoption Metric" in Explore.

  dimension: adoption_metric {
    type: string
    sql: ${TABLE}.adoption_metric ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: etl_record_created {
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
    sql: ${TABLE}.etl_record_created_time ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
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

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Time ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

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
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

#Custom Measures

measure: count_adoption_metric {
  type: number
  sql: count(${adoption_metric}) ;;
  drill_fields: [details*]
}
#count(DISTINCT `User ID`)

measure: distinct_user_account {
  type: count_distinct
  sql: ${TABLE}.user_id;;
  drill_fields: [details*]
}


#Case when `Adoption Metric` = 'Monthly Active Users' then count(distinct `User ID`) End

measure: distinct_monthly_active_users{
  type: count_distinct
  sql: case when ${adoption_metric}="Monthly Active Users" then ${user_id} end;;
  drill_fields: [details*]
}

#case when `Adoption Metric` = 'Total Registered Users' then count(distinct `User ID`) End

measure: total_registered_users {
  type: count_distinct
  sql: case when ${adoption_metric}= "Total Registered Users" then ${user_id} end;;
  drill_fields: [details*]
}


#count(distinct Case when `Adoption Metric` = 'Monthly Active Users' and `User ID` is not null then `User ID` End)
#-count(Case when `Adoption Metric` = 'Active Users (New)'  and `User ID` is not null then `User ID` End)

measure: monthly_active_users {
  type: count_distinct
  sql: case when ${adoption_metric}="Monthly Active Users" and ${user_id} IS NOT NULL then ${user_id}  end;;
drill_fields: [details*]
}

  measure: new_active_users {
    type: count_distinct
    sql: case when ${adoption_metric}="Active Users (New)" and ${user_id} IS NOT NULL then ${user_id}  end;;
    drill_fields: [details*]
  }
measure: repeat_active_users {
  type: number
  sql: ${monthly_active_users} - ${new_active_users} ;;
  drill_fields: [details*]
}

  measure: count_of_external_ids {
    type: number
    sql: count(${external_id}) ;;
    drill_fields: [details*]
  }

  measure: count {
    type: count
    drill_fields: [details*]
    }
    set: details {
      fields: [user_id,time_raw,adoption_metric,user_full_name,user_account_status,excluded_from_leaderboard,email]

    }

}
