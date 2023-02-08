# The name of this view in Looker is "U2 Users Assignment Status Vw"
view: u2_users_assignment_status_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `{{_user_attributes['database']}}.u2_users_assignment_status_vw`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

# created primary key dimension
  dimension: primary_key {
    primary_key: yes
    sql: concat(${TABLE}.assignor_id,${TABLE}.card_id,${TABLE}.external_id) ;;
  }


  dimension_group: assignment_due {
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
    sql: ${TABLE}.Assignment_Due_Date ;;
# <<<<<<< HEAD
   ## html: {{ rendered_value | date: "%D %r" }};;
 #   drill_fields: [detail*]
# =======
    html: {{ rendered_value | date: "%D %r" }};;
   # drill_fields: [detail*]
# >>>>>>> branch 'master' of git@github.com:edcast/edc-looker.git
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assignment Progression" in Explore.

  dimension: assignment_progression {
    type: string
    sql: ${TABLE}.Assignment_Progression ;;
  #  drill_fields: [detail*]
  }

  dimension: assignment_state {
    type: string
    sql: ${TABLE}.Assignment_State ;;
  #  drill_fields: [detail*]
  }

  dimension: assignment_type {
    type: string
    sql: ${TABLE}.Assignment_Type ;;
 #   drill_fields: [detail*]
  }

  dimension: assignor_full_name {
    type: string
    sql: ${TABLE}.Assignor_Full_Name ;;
#    drill_fields: [detail*]
  }

  dimension: assignor_id {
    type: number
    sql: ${TABLE}.Assignor_ID ;;
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.Card_ID ;;
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
  }

  dimension: card_resource_url {
    type: number
    sql: ${TABLE}.card_resource_url ;;
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
  }

  dimension: card_subtype {
    type: number
    sql: ${TABLE}.card_subtype ;;
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
 #   drill_fields: [detail*]
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

 # dimension: content_status {
#    type: number
#    sql: ${TABLE}.content_status ;;
#  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  dimension: current_content_owner_full_name {
    type: number
    sql: ${TABLE}.current_content_owner_full_name ;;
  }

  dimension: duration_hhmm {
    type: number
    sql: ${TABLE}.Duration_HHMM ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  #  drill_fields: [detail*]
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.External_ID ;;
  }

#  dimension: is_card_promoted {
#    type: number
#    sql: ${TABLE}.is_card_promoted ;;
#  }

#  dimension: is_live_stream {
#   type: number
#    sql: ${TABLE}.is_live_stream ;;
#  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

#  dimension: is_user_generated {
#    type: number
##    sql: ${TABLE}.is_user_generated ;;
#  }

  dimension_group: published {
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
    sql: ${TABLE}.published_at ;;
   ## html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
  }

  dimension_group: time_assignment_created {
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
    sql: ${TABLE}.Time_Assignment_Created ;;
   ## html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: time_assignment_started {
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
    sql: ${TABLE}.Time_Assignment_Started ;;
# <<<<<<< HEAD
   ## html: {{ rendered_value | date: "%D %r" }};;
  #  drill_fields: [detail*]
# =======
    html: {{ rendered_value | date: "%D %r" }};;
  #  drill_fields: [detail*]
# >>>>>>> branch 'master' of git@github.com:edcast/edc-looker.git
  }

  dimension_group: time_completed {
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
    sql: ${TABLE}.Time_Completed ;;
# <<<<<<< HEAD
    ## html: {{ rendered_value | date: "%D %r" }};;
  #  drill_fields: [detail*]
# =======
    html: {{ rendered_value | date: "%D %r" }};;
  #  drill_fields: [detail*]
# >>>>>>> branch 'master' of git@github.com:edcast/edc-looker.git
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.User_Account_Status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
  #  drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.User_ID ;;
  }

dimension: days_assigned {
  type: number
  #DATEDIFF(CURRENT_DATE(),`Time Assignment Created`)
  sql: DATETIME_DIFF(timestamp(CURRENT_DATE()),timestamp(${time_assignment_created_date}),DAY) ;;
}
  measure: count_of_email {
   type: number
  sql: count(${email}) ;;
      drill_fields: [detail*]
  }

  measure: count_of_user_id {
    type: number
    sql: count(${user_id}) ;;
       drill_fields: [detail*]
  }

  measure: count_of_user_names {
    type: number
    sql: count(${user_full_name}) ;;
    drill_fields: [detail*]
  }


measure: count_of_assignment_state  {
  type: number
  sql: count(${assignment_state} );;
  drill_fields: [detail*]
}

measure: count_of_time_completed {
  type: number
  sql: count(${time_completed_date} );;
  drill_fields: [detail*]
}
measure: distinct_count_of_assignment_progression  {
  type: count_distinct
  sql: ${assignment_progression} ;;
  drill_fields: [detail*]
}

  measure: count_of_assignment_progression  {
    type: number
    sql: count(${assignment_progression}) ;;
    drill_fields: [detail*]
  }

  measure: count_of_card_title {
    type: number
    sql: count(${card_title}) ;;
    drill_fields: [detail*]
  }

  measure: count_of_card_ids {
    type: number
    sql: count(${card_id}) ;;
    drill_fields: [detail*]
  }

  #*********************************************************************************************************
# A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.
#measure: overdue {
#  case when `Time Completed`>`Assignment Due Date` then 'Overdue'
#when DATEDIFF(CURRENT_DATE(), `Assignment Due Date`)>0 and `Time Completed` is null  then 'Overdue'
#else 'On Time'
#end

# type: string
# sql: case when ${time_assignment_created_date} > ${assignment_due_date} then "Overdue"
# when DIFF_DAYS(CURRENT_DATE(), ${assignment_due_date})>0 and ${time_completed_date} is null  then 'Overdue'
# else 'On Time'
# end ;;
# }

  measure: total_duration_hhmm {
    type: sum
    sql: ${duration_hhmm} ;;
    drill_fields: [detail*]
  }
dimension: hours_completed {
  #COUNT(`Card ID`)*(`Duration (seconds)`)/60/60
  type: number
  sql:${duration_seconds}/60/60 ;;
}
  measure: average_duration_hhmm {
    type: average
    sql: ${duration_hhmm} ;;
    drill_fields: [detail*]
  }
dimension: assignment_due_date_string {
  type: string
  #cast(${card_resource_url} as string)
  sql: cast(${assignment_due_date} as string) ;;
}
dimension: assignment_reason {
  #case when `Assignment Due Date` LIKE '%2%' then 'All SRO' else 'Induction' end
  type: string
  sql: case when ${assignment_due_date_string} LIKE '%2%' then 'All SRO' else 'Induction' end ;;
}
dimension: compulsory {
  #CASE when `Card Title` LIKE 'Compulsory%' then '1' when `Card Title` LIKE '*%' then '2' when `Card Title` LIKE '%P |%' then '3'when `Card Title` LIKE 'refresher' then '4'else '0' end
type: string
sql: CASE when ${card_title} LIKE 'Compulsory%' then '1'
          when ${card_title} LIKE '*%' then '2'
          when ${card_title} LIKE '%P |%' then '3'
          when ${card_title} LIKE 'refresher' then '4'
          else '0' end ;;
}
#************************************************************************************************************
  measure: count {
    type: count
    drill_fields: [detail*]
  }

measure: Distinct_Active_users {
  type: count_distinct
  sql:${user_id}  ;;
}
  set:detail
  {
    fields:[assignment_state,user_full_name,assignor_full_name,time_assignment_started_raw,time_completed_raw,assignment_due_raw,card_title,assignment_type,
      assignment_progression,email,user_id,assignor_id, time_assignment_created_raw,card_id,card_state,card_type,
      #is_user_generated,
      content_structure,
      card_author_id,card_author_full_name,card_resource_url,
      #is_live_stream,
      card_subtype,ecl_id,ecl_source_name,
      #is_card_promoted,
      is_public,
      #content_status,
      duration_seconds,duration_hhmm,user_account_status,excluded_from_leaderboard,card_level,average_rating,standard_card_type,
      published_raw,external_id,current_content_owner_full_name]
}
}
