# The name of this view in Looker is "Mock U2 User Performance"
view: mock_u2_user_performance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.mock_u2_user_performance`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assignment Progression" in Explore.

  dimension: assignment_progression {
    type: string
    sql: ${TABLE}.Assignment_Progression ;;
  }

  dimension: assignment_state {
    type: string
    sql: ${TABLE}.Assignment_State ;;
  }

  dimension: assignment_type {
    type: string
    sql: ${TABLE}.Assignment_Type ;;
  }

  dimension: assignor_full_name {
    type: string
    sql: ${TABLE}.Assignor_Full_Name ;;
  }

  dimension: assignor_id {
    type: number
    sql: ${TABLE}.Assignor_ID ;;
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.Average_Rating ;;
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.Card_Author_Full_Name ;;
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.Card_Author_ID ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.Card_ID ;;
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.Card_Level ;;
  }

  dimension: card_resource_url {
    type: string
    sql: ${TABLE}.Card_Resource_URL ;;
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.Card_State ;;
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.Card_Subtype ;;
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.Card_Title ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.Card_Type ;;
  }

  dimension: content_status {
    type: string
    sql: ${TABLE}.Content_Status ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.Content_Structure ;;
  }

  dimension: current_content_owner_full_name {
    type: string
    sql: ${TABLE}.Current_Content_Owner_Full_Name ;;
  }

  dimension: duration__hh_mm_ {
    type: string
    sql: ${TABLE}.Duration__HH_MM_ ;;
  }

  dimension: duration__seconds_ {
    type: number
    sql: ${TABLE}.Duration__seconds_ ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration__seconds_ {
    type: sum
    sql: ${duration__seconds_} ;;
  }

  measure: average_duration__seconds_ {
    type: average
    sql: ${duration__seconds_} ;;
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ECL_ID ;;
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ECL_Source_Name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.External_ID ;;
  }

  dimension: group_assignment_association {
    type: string
    sql: ${TABLE}.Group_Assignment_Association ;;
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

  dimension: group_user_role {
    type: string
    sql: ${TABLE}.Group_User_Role ;;
  }

  dimension: is_card_promoted {
    type: number
    sql: ${TABLE}.Is_Card_Promoted ;;
  }

  dimension: is_live_stream {
    type: number
    sql: ${TABLE}.Is_Live_Stream ;;
  }

  dimension: is_public_ {
    type: yesno
    sql: ${TABLE}.Is_Public_ ;;
  }

  dimension: is_user_generated {
    type: number
    sql: ${TABLE}.Is_User_Generated ;;
  }

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
    sql: ${TABLE}.Published_At ;;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.Standard_Card_Type ;;
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
  }

  dimension_group: time_group__assignment_created {
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
    sql: ${TABLE}.Time_Group__Assignment_Created ;;
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
    sql: ${TABLE}.User_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      card_author_full_name,
      ecl_source_name,
      current_content_owner_full_name,
      assignor_full_name,
      group_name,
      user_full_name
    ]
  }
}
