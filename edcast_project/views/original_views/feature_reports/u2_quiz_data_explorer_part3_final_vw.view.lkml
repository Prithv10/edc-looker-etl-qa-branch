# The name of this view in Looker is "U2 Quiz Data Explorer Part3 Final Vw"
view: u2_quiz_data_explorer_part3_final_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u2_quiz_data_explorer_part3_final_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.u2_quiz_data_explorer_part3_final_vw`
  ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average Rating" in Explore.

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
    sql: ${TABLE}.card_id ;;
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
    type: string
    sql: ${TABLE}.card_subtype ;;
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  dimension: current_content_owner_full_name {
    type: string
    sql: ${TABLE}.current_content_owner_full_name ;;
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
    sql: ${TABLE}.email ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: quiz_attempt_id {
    type: string
    sql: ${TABLE}.quiz_attempt_id ;;
  }

  dimension: quiz_attempt_passed {
    type: string
    sql: ${TABLE}.quiz_attempt_passed ;;
  }

  dimension: quiz_id {
    type: string
    sql: ${TABLE}.quiz_id ;;
  }

  dimension: quiz_option_id {
    type: string
    sql: ${TABLE}.quiz_option_id ;;
  }

  dimension: quiz_option_is_correct {
    type: string
    sql: ${TABLE}.quiz_option_is_correct ;;
  }

  dimension: quiz_option_label {
    type: string
    sql: ${TABLE}.quiz_option_label ;;
  }

  dimension: quiz_passing_criteria {
    type: string
    sql: ${TABLE}.quiz_passing_criteria ;;
  }

  dimension: quiz_question_id {
    type: string
    sql: ${TABLE}.quiz_question_id ;;
  }

  dimension: quiz_question_label {
    type: string
    sql: ${TABLE}.quiz_question_label ;;
  }

  dimension: quiz_questions_passed {
    type: string
    sql: ${TABLE}.quiz_questions_passed ;;
  }

  dimension: quiz_reanswerable {
    type: string
    sql: ${TABLE}.quiz_reanswerable ;;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
  }

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
    sql: ${TABLE}.time_account_created ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: total_quiz_attempts {
    type: number
    sql: ${TABLE}.total_quiz_attempts ;;
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

#*************************************************************************************************

# Created Count Distinct Measure for User ID

  measure: distinct_count_user_id{
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [details*]
  }
#*********************************************************************************************

# (CASE WHEN (`Quiz Option Is Correct` = 'Y') THEN Count(`User ID`) END)



  #********************************************************************************************************
  #created the dimension for concatenation
  dimension: count_user_card_id {
    type: number
    sql: concat(${TABLE}.user_id,${TABLE}.card_id) ;;
    drill_fields: [details*]
  }
  #Measures created for Users Passed
  measure: users_passed {
    type: count_distinct
    sql: case
      WHEN ${quiz_attempt_passed}="Passed" then ${count_user_card_id}  end;;
    drill_fields: [details*]
  }
  #Measures created for Users Failed
  measure: users_failed {
    type: count_distinct
    sql: case
      WHEN ${quiz_attempt_passed}="Failed" then ${count_user_card_id} end;;
    drill_fields: [details*]
  }

  #*********************************************************************************************************
  measure: total_questions {
    type: count_distinct
    sql: ${TABLE}.quiz_question_id;;
    drill_fields: [details*]
    }

 #*******************************************************************************************************

    #created measures for Total Attempts,Total Unique Attempts,Users Passed,User Failed
    measure: Total_attempts {
      type: sum
      sql: ${TABLE}.total_quiz_attempts ;;
      drill_fields: [details*]
    }

#this is the same measure as 'Total Quiz Question Attempts' used in MultiQuiz Card - Report
  measure: Total_unique_attempts {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [details*]
  }

  #*********************************************************************************************************
  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_rating {
    type: sum
    sql: ${average_rating} ;;
    drill_fields: [details*]
  }

  measure: average_average_rating {
    type: average
    sql: ${average_rating} ;;
    drill_fields: [details*]
  }

#This measure is the same as 'Correct Answers' used in MultiQuiz Card - GradeBook
measure: total_correct {
  type: sum
  sql: case when ${quiz_option_is_correct} = 'Y' then 1 else 0 end;;
  drill_fields: [details*]
}

#Case when `Quiz Option Is Correct` = 'N' then Count(`User ID`) End

  measure: total_incorrect {
    type: sum
    sql: case when ${quiz_option_is_correct} = 'N' then 1 else 0 end;;
    drill_fields: [details*]
  }

measure: result {
  type: string
  sql: case when ${quiz_option_is_correct} = 'Y' then "Passed"  else "Failed" end;;
}

  measure: count {
    type: count
    drill_fields: [details*]
  }
set: details {
  fields: [ecl_source_name, current_content_owner_full_name, card_author_full_name, user_full_name]
}

}
