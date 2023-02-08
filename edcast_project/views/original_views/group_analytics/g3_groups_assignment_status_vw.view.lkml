# The name of this view in Looker is "G3 Groups Assignment Status Vw"
view: g3_groups_assignment_status_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_assignment_status_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.g3_groups_assignment_status_vw`
  ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

# Created Primary Key Dimension
  dimension: primary_key {
    primary_key: yes
    sql: concat(${TABLE}.assignor_id,${TABLE}.card_id,${TABLE}.ecl_id,
          ${TABLE}.time_completed,
          ${TABLE}.card_title ,
          ${TABLE}.group_id,${TABLE}.user_id

      ) ;;
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
    html: {{ rendered_value | date: "%D %r" }};;
#    drill_fields: [detail*]
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
 #   drill_fields: [detail*]
  }

  dimension: assignment_type {
    type: string
    sql: ${TABLE}.Assignment_Type ;;
 #   drill_fields: [detail*]
  }

  dimension: assignor_full_name {
    type: string
    sql: ${TABLE}.Assignor_Full_Name ;;
 #   drill_fields: [detail*]
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
    type: number
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
#    drill_fields: [detail*]
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.Card_Type ;;
  }

  dimension: content_status {
    type: number
    sql: ${TABLE}.Content_Status ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.Content_Structure ;;
  }

  dimension: current_content_owner_full_name {
    type: number
    sql: ${TABLE}.Current_Content_Owner_Full_Name ;;
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.Duration_HHMM ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.Duration_seconds ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration_seconds {
    type: sum
    sql: ${duration_seconds} ;;
  }

  measure: average_duration_seconds {
    type: average
    sql: ${duration_seconds} ;;
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

  dimension: group_assignment_association {
    type: string
    sql: ${TABLE}.Group_Assignment_Association ;;
#    drill_fields: [detail*]
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.Group_ID ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.Group_Name ;;
#    drill_fields: [detail*]
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

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.Is_Public ;;
  }

  dimension: is_user_generated {
    type: number
    sql: ${TABLE}.Is_User_Generated ;;
  }

  dimension: org_id_s {
    type: number
    value_format_name: id
    sql: ${TABLE}.org_id_s ;;
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
    html: {{ rendered_value | date: "%D %r" }};;
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
    html: {{ rendered_value | date: "%D %r" }};;
#    drill_fields: [detail*]
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
    html: {{ rendered_value | date: "%D %r" }};;
 #   drill_fields: [detail*]
  }

  dimension_group: time_group_assignment_created {
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
    sql: ${TABLE}.Time_Group_Assignment_Created ;;
    html: {{ rendered_value | date: "%D %r" }};;
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

dimension: title_clean {
  type: string
  sql: UPPER(SUBSTRING(${card_title},22)) ;;
}

dimension: compulsory {
  type: string
  sql: CASE
when ${card_title} LIKE 'Compulsory%' then '1'
when ${card_title} LIKE '*%' then '2'
when ${card_title} LIKE '%P |%' then '3'
when ${card_title} LIKE 'refresher' then '4'
else '0'
end ;;
}
measure: percentage_not_started {
  #((COUNT(CASE when `Assignment Progression` = '1. Not Started' then `User ID` end))/COUNT(`Assignment Progression`))*100

  type: number
  sql: ((COUNT(CASE when ${assignment_progression} = '1. Not Started' then ${user_id} end)
)
/
COUNT(${assignment_progression}))*100
 ;;
value_format: "0.00"
}

  measure: percentage_in_progress {

    type: number
    sql: ((COUNT(CASE when ${assignment_progression} = '2. Started' then ${user_id} end)
      )
      /
      COUNT(${assignment_progression}))*100
       ;;
    value_format: "0"
  }

  measure: percentage_completed {

    type: number
    sql: ((COUNT(CASE when ${assignment_progression} = '3. Completed' then ${user_id} end)
      )
      /
      COUNT(${assignment_progression}))*100
       ;;
    value_format: "0"
  }


  measure: count {
    type: number
    sql: count(${user_id}) ;;
   drill_fields: [detail*]
  }

  measure: count_card_title {
    type: number
    sql: count(${card_title}) ;;
    drill_fields: [detail*]
  }

  measure: count_of_group_assignment_association {
    type: count_distinct
    sql: ${TABLE}.group_assignment_association;;
    drill_fields: [detail*]
  }

  measure: count_of_email {
    type: count_distinct
    sql: ${email};;
       drill_fields: [detail*]
  }

measure: count_of_assignment_progression{
  type: number
  sql: count(${assignment_progression}) ;;
  drill_fields: [detail*]
}

measure: count_user_id {
  type: number
  sql: count(${user_id}) ;;
  drill_fields: [detail*]
}

measure: count_content_structure {
  type: number
  sql: count(${content_structure}) ;;
  drill_fields: [detail*]
}

measure: distinct_active_users {
  type: count_distinct
  sql: ${user_id} ;;
}

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      group_name,
      user_full_name,
      assignor_full_name,
      assignment_state,
      time_assignment_started_raw,time_completed_raw,assignment_due_raw,card_title,
      assignment_type,group_assignment_association,email,user_id, card_id, card_state, card_type,is_user_generated,content_structure,card_author_id,
      content_status,time_group_assignment_created_raw,assignor_id,group_id, assignment_progression,group_status, user_account_status,excluded_from_leaderboard,
      card_author_full_name,card_resource_url,is_live_stream,card_subtype, ecl_id,ecl_source_name,is_card_promoted, is_public, duration_seconds, duration_hhmm,
      card_level, average_rating, standard_card_type,published_raw,external_id, group_user_role, current_content_owner_full_name]

  }
}
