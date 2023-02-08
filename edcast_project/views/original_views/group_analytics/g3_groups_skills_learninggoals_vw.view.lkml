# The name of this view in Looker is "G3 Groups Skills Learninggoals Vw"
view: g3_groups_skills_learninggoals_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_skills_learninggoals_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.g3_groups_skills_learninggoals_vw`
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

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.Group_ID ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.Group_Name ;;
  }

  dimension: group_status {
    type: string
    sql: ${TABLE}.Group_Status ;;
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

  dimension_group: time {
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

  dimension: topic_label {
    type: string
    sql: ${TABLE}.topic_label ;;
#    drill_fields: [detail*]
  }

  dimension: topic_type {
    type: string
    sql: ${TABLE}.topic_type ;;
 #   drill_fields: [detail*]
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


#Start - MEASURES for Top 20 Skills and Learning Goals- Group Analytics


  #'Learning Goals', 'Skills'
  measure: learning_goals{
    type: count
    #  sql: case when ${topic_type} ='Learning Goals' then 1 else 0 end ;;
    filters: {
      field: topic_type
      value: "Learning Goals"
    }
    drill_fields: [detail*]
  }

  measure: skills{
    type: count
    #  sql: case when ${topic_type} ='Skills' then 1 else 0 end ;;
    filters: {
      field: topic_type
      value: "Skills"
    }
    drill_fields: [detail*]
  }

  measure: total_types{
    type: number
    sql: ${learning_goals}+${skills};;
    drill_fields: [detail*]
  }
#   measure: learning_goals{
#     type: sum
#     sql: case when ${topic_type} ='Learning Goals' then 1 else 0 end ;;
#     drill_fields: [detail*]
# }
#   measure: skills{
#     type: sum
#     sql: case when ${topic_type} ='Skills'then 1 else 0 end ;;
#     drill_fields: [detail*]
# }

#   measure: total_types{
#     type: sum
#     sql: (case when ${topic_type} in('Learning Goals', 'Skills' ) then 1 else 0 end) ;;
#     drill_fields: [detail*]
#   }

  #End - MEASURES for Top 20 Skills and Learning Goals- Group Analytics

  measure: count_of_topic_label {
    type: number
    sql: count(${topic_label}) ;;
    drill_fields: [detail*]
    }

  measure: distinct_group_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [detail*]
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  set: detail {
    fields: [topic_label,topic_type,user_id,user_full_name,email,time_account_created_raw,user_account_status,time_raw,event, group_id,group_name,
      group_status,excluded_from_leaderboard,external_id, sign_in_count,time_account_suspended_raw]
  }
}
