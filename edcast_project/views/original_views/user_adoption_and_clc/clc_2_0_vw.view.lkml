# The name of this view in Looker is "Clc 2 0 Vw"
view: clc_2_0_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.clc_2_0_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.clc_2_0_vw`
  ;;

  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Clc Name" in Explore.

  dimension: clc_name {
    type: string
    sql: ${TABLE}.clc_name ;;
  }

  dimension: clcstatus {
    type: string
    sql: ${TABLE}.CLCStatus ;;
    drill_fields: [duration_in_hours,completed_month,details*]

  }

  dimension: completable_id {
    type: number
    sql: ${TABLE}.completable_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: completed {
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
    sql: ${TABLE}.completed_at ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: completed_percentage {
    type: number
    sql: ${TABLE}.completed_percentage ;;
  }

  dimension_group: created_at {
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
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.



  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: entity_id {
    type: number
    sql: ${TABLE}.entity_id ;;
  }

  dimension: entity_type {
    type: string
    sql: ${TABLE}.entity_type ;;
  }

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
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension_group: from {
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
    sql: ${TABLE}.from_date ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: org_id_s {
    type: number
    value_format_name: id
    sql: ${TABLE}.org_id_s ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: target_score {
    type: number
    sql: ${TABLE}.target_score ;;
  }

  dimension: target_steps {
    type: string
    sql: ${TABLE}.target_steps ;;
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
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: to {
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
    sql: ${TABLE}.to_date ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
    drill_fields: [completed_month]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [details*]
  }


# Custom Measures

  measure: count_distinct_uid {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [details*]
  }

  measure: total_duration {
    type: sum
    sql: ${TABLE}.duration ;;
    drill_fields: [details*]
  }

  measure: average_duration {
    type: average
    sql: ${TABLE}.duration ;;
    drill_fields: [details*]
  }

  measure: duration_in_hours {
     type: number
     sql: ${total_duration}/3600 ;;
 value_format: "0.0#"

    drill_fields: [details*]

   }

# measure: sum_duration_in_hours {
#   type: number
#   sql: sum(${duration_in_hours}) ;;
#   drill_fields: [details*]
# }
  measure: CLC_Minutes {
    type: number
    sql: round((${duration}/60),0) ;;
    value_format: "0"
    drill_fields: [details*]
  }
  measure: sum_CLC_Minutes {
    type: number
    sql: sum(${CLC_Minutes}) ;;
    drill_fields: [details*]
  }

measure: CLC_Hours {
#CONCAT(Floor(Sum(`CLC (Minutes)`)/ 60),'.',MOD(sum(`CLC (Minutes)`),60))
type: number
sql:CONCAT(Floor(Sum(${CLC_Minutes})/ 60),'.',MOD(cast(sum(${CLC_Minutes}) as int),60))  ;;
drill_fields: [details*]
}
  set: details {
    fields: [completed_raw, id, entity_id, entity_type, from_raw, to_raw, target_score, target_steps,deleted_raw,
      created_at_raw, updated_raw, name,status, org_id_s, etl_record_created_raw, user_id, user_full_name,user_account_status,excluded_from_leaderboard,
      email, time_account_created_raw, completable_id, completed_percentage, duration, external_id,
      #card_id, card_type, occ,
      clcstatus, clc_name]
  }
}
