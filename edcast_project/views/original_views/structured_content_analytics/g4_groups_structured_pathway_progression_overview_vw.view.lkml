# The name of this view in Looker is "G4 Groups Structured Pathway Progression Overview Vw"
view: g4_groups_structured_pathway_progression_overview_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g4_groups_structured_pathway_progression_overview_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.g4_groups_structured_pathway_progression_overview_vw`
  ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Badge Content" in Explore.

  dimension: badge_content {
    type: string
    sql: ${TABLE}.badge_content ;;
#    drill_fields: [detail*]
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
#    drill_fields: [detail*]
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
#    drill_fields: [detail*]
  }

  dimension: carousel_content {
    type: string
    sql: ${TABLE}.carousel_content ;;
#    drill_fields: [detail*]
  }

  dimension: carousel_name {
    type: string
    sql: ${TABLE}.carousel_name ;;
 #   drill_fields: [detail*]
  }

  dimension: channel_content {
    type: string
    sql: ${TABLE}.channel_content ;;
#    drill_fields: [detail*]
  }

  dimension: channel_content_exclusivity {
    type: string
    sql: ${TABLE}.channel_content_exclusivity ;;
#    drill_fields: [detail*]
  }

  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
#    drill_fields: [detail*]
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
#    drill_fields: [detail*]
  }

  dimension: completion_progress {
    type: number
    sql: ${TABLE}.completion_progress ;;
    value_format_name: percent_0
   drill_fields: [detail*]
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_completion_progress {
    type: sum
    sql: ${completion_progress} ;;
#    drill_fields: [detail*]
  }

  measure: average_completion_progress {
    type: average
    sql: ${completion_progress} ;;
#    drill_fields: [detail*]
  }

#   dimension: content_status {
#     type: string
#     sql: ${TABLE}.content_status ;;
# #    drill_fields: [detail*]
#   }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
#    drill_fields: [detail*]
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
#    drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
#    drill_fields: [detail*]
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
 #   drill_fields: [detail*]
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
#    drill_fields: [detail*]
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
#    drill_fields: [detail*]
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
#    drill_fields: [detail*]
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
#    drill_fields: [detail*]
  }

  dimension: group_status {
    type: string
    sql: ${TABLE}.group_status ;;
#    drill_fields: [detail*]
  }

#   dimension: is_card_promoted {
#     type: number
#     sql: ${TABLE}.is_card_promoted ;;
# #    drill_fields: [detail*]
#   }

  dimension: is_carousel_enabled {
    type: yesno
    sql: ${TABLE}.is_carousel_enabled ;;
#    drill_fields: [detail*]
  }

#   dimension: is_live_stream {
#     type: number
#     sql: ${TABLE}.is_live_stream ;;
# #    drill_fields: [detail*]
#   }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
#    drill_fields: [detail*]
  }

#   dimension: is_user_generated {
#     type: number
#     sql: ${TABLE}.is_user_generated ;;
# #    drill_fields: [detail*]
#   }

  dimension: journey_content {
    type: string
    sql: ${TABLE}.journey_content ;;
#    drill_fields: [detail*]
  }

  dimension: overall_completion_status {
    type: string
    sql: ${TABLE}.overall_completion_status ;;
 #   drill_fields: [detail*]
  }

  dimension: pathway_badge_title {
    type: string
    sql: ${TABLE}.pathway_badge_title ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_content {
    type: string
    sql: ${TABLE}.pathway_content ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_id {
    type: number
    sql: ${TABLE}.pathway_id ;;
    value_format: "0"
 #   drill_fields: [detail*]
  }

  dimension: pathway_progress {
    type: string
    sql: ${TABLE}.pathway_progress ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_progress_seconds {
    type: number
    sql: ${TABLE}.pathway_progress_seconds ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_state {
    type: string
    sql: ${TABLE}.pathway_state ;;
 #   drill_fields: [detail*]
  }

  dimension: pathway_title {
    type: string
    sql: ${TABLE}.pathway_title ;;
 #   drill_fields: [detail*]
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
  #  drill_fields: [detail*]
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
    sql: ${TABLE}.time_completed ;;
    html: {{ rendered_value | date: "%D %r" }};;
 #   drill_fields: [detail*]
  }

  dimension: total_cards_completed {
    type: number
    sql: ${TABLE}.total_cards_completed ;;
#    drill_fields: [detail*]
  }

  dimension: total_channel_associations {
    type: number
    sql: ${TABLE}.total_channel_associations ;;
#    drill_fields: [detail*]
  }

  dimension: total_pathway_child_cards {
    type: number
    sql: ${TABLE}.total_pathway_child_cards ;;
#    drill_fields: [detail*]
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
#    drill_fields: [detail*]
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
 #   drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
#    drill_fields: [detail*]
  }

# In DOMO
# CASE
# When `Completion Progress (%)`>=0.98 then 'Completed'
# when `Completion Progress (%)`=0 then 'Not started'
# when `Completion Progress (%)`<0.98 and`Completion Progress (%)` >0 then 'In progress'
# end

  dimension: completion_status {
    type: string
    sql: CASE
      When completion_progress>=0.98 then 'Completed'
      when completion_progress=0 then 'Not started'
      when completion_progress<0.98 and
            completion_progress>0 then 'In progress'
      end ;;
  }

  measure: count_of_pathway_title {
    type: number
    sql: count(${pathway_title}) ;;
    drill_fields: [detail*]
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_of_completion_status {
    type: number
    sql: count(${completion_status}) ;;
    drill_fields: [detail*]
  }

  measure: count_distinct_email {
    type: count_distinct
    sql: ${email} ;;
    drill_fields: [detail*]
  }

  measure: count_distinct_users {
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [

      user_full_name,group_name,carousel_name,channel_name,overall_completion_status,
      time_completed_time,completion_progress,pathway_progress,pathway_id,group_id,group_status,
      user_id,total_pathway_child_cards,content_structure,total_cards_completed,email,
      channel_id,is_carousel_enabled,pathway_badge_title,badge_content,

      #pathway_title,


      channel_content,carousel_content,journey_content,pathway_content,channel_content_exclusivity,
      pathway_state,total_channel_associations,
      #content_status,
      card_author_full_name,card_author_id,
      #is_user_generated,
      time_account_created_time,user_account_status,excluded_from_leaderboard,
      ecl_source_name,
      #is_card_promoted,
      is_public,
      #is_live_stream,
      pathway_progress,average_completion_progress
    ]
  }
}
