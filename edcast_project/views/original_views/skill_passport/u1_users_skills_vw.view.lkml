# The name of this view in Looker is "U1 Users Skills Vw"
view: u1_users_skills_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u1_users_skills_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.u1_users_skills_vw`
  ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
    drill_fields: [details*]
    html: {{ rendered_value | date: "%D %r" }};;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    drill_fields: [details*]
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
    drill_fields: [details*]
  }

  dimension: experience {
    type: string
    sql: ${TABLE}.experience ;;
    drill_fields: [details*]
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
    drill_fields: [details*]
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
    drill_fields: [details*]
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sign_in_count {
    type: sum
    sql: ${sign_in_count} ;;
    drill_fields: [details*]
  }

  measure: average_sign_in_count {
    type: average
    sql: ${sign_in_count} ;;
    drill_fields: [details*]
  }

  dimension: skill_id {
    type: number
    sql: ${TABLE}.skill_id ;;
    drill_fields: [details*]
  }

  dimension: skill_level {
    type: string
    sql: ${TABLE}.skill_level ;;
    drill_fields: [details*]
  }

  dimension: skill_name {
    type: string
    sql: ${TABLE}.skill_name ;;
    drill_fields: [details*]
  }

  dimension: skill_type {
    type: string
    sql: ${TABLE}.skill_type ;;
    drill_fields: [details*]
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
    sql: ${TABLE}.time_account_created ;;
    drill_fields: [details*]
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
    drill_fields: [details*]
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
    drill_fields: [details*]
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
    drill_fields: [details*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    drill_fields: [details*]
  }
#'Advanced', 'Beginner', 'Intermediate', 'Undeclared'
  measure: advanced{
    type: count
      filters: {
      field: skill_level
      value: "Advanced"
    }
    drill_fields: [details*]
  }

  measure: beginner{
    type: count
       filters: {
      field: skill_level
      value: "Beginner"
    }
    drill_fields: [details*]
  }

   measure: intermediate{
    type: count
     filters: {
      field: skill_level
      value: "Intermediate"
    }
    drill_fields: [details*]
  }

  measure: undeclared{
    type: count
    filters: {
      field: skill_level
      value: "Undeclared"
    }
    drill_fields: [details*]
  }

  measure: total_levels{
    type: number
    sql: ${advanced}+${beginner}+${undeclared}+${intermediate};;
    drill_fields: [details*]
  }

  measure: count {
    type: count
   drill_fields: [details*]

  }

  #created measure for count of skill ID
  measure:skill_id_count {
    type: count_distinct
    sql: ${TABLE}.skill_id ;;
    drill_fields: [details*]
  }

  #created measure for count of user ID

measure: count_of_user_id{
  type: count_distinct
  sql: ${TABLE}.user_id ;;
  drill_fields: [details*]
}

measure: avg_skills_added_by_user {
  type: number
  sql: ${skill_id_count}/${count_of_user_id} ;;
  value_format: "0"
  drill_fields: [details*]
}

set: details {

  fields: [skill_name,skill_id,user_id,created_time,experience,
           skill_level,skill_type,user_full_name,user_account_status,
             excluded_from_leaderboard,email,time_account_created_time,sign_in_count,
                time_account_suspended_time,external_id]
}


}
