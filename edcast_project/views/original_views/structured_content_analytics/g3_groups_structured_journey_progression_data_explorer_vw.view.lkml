# The name of this view in Looker is "G3 Groups Structured Journey Progression Data Explorer Vw"
view: g3_groups_structured_journey_progression_data_explorer_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.


  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_structured_journey_progression_data_explorer_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.g3_groups_structured_journey_progression_data_explorer_vw`
  ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average Rating" in Explore.

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
#    drill_fields: [detail*]
  }

  dimension: badge_content {
    type: string
    sql: ${TABLE}.badge_content ;;
#    drill_fields: [detail*]
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
 #   drill_fields: [detail*]
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
 #   drill_fields: [detail*]
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
 #   drill_fields: [detail*]
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
#    drill_fields: [detail*]
  }

  dimension: card_resource_url {
    type: number
    sql: ${TABLE}.card_resource_url ;;
#    drill_fields: [detail*]
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
#    drill_fields: [detail*]
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.card_subtype ;;
#    drill_fields: [detail*]
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
#    drill_fields: [detail*]
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
 #   drill_fields: [detail*]
  }

  dimension: carousel_content {
    type: string
    sql: ${TABLE}.carousel_content ;;
#    drill_fields: [detail*]
  }

  dimension: carousel_name {
    type: string
    sql: ${TABLE}.carousel_name ;;
#    drill_fields: [detail*]
  }

  dimension: channel_content {
    type: string
    sql: ${TABLE}.channel_content ;;
 #   drill_fields: [detail*]
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

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.Duration_HHMM ;;
 #   drill_fields: [detail*]
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.Duration_seconds ;;
#    drill_fields: [detail*]
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration_seconds {
    type: sum
    sql: ${duration_seconds} ;;
#    drill_fields: [detail*]
  }

  measure: average_duration_seconds {
    type: average
    sql: ${duration_seconds} ;;
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
 #   drill_fields: [detail*]
  }

  dimension: is_card_promoted {
    type: number
    sql: ${TABLE}.is_card_promoted ;;
#    drill_fields: [detail*]
  }

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

  dimension: journey_badge_title {
    type: string
    sql: ${TABLE}.journey_badge_title ;;
#    drill_fields: [detail*]
  }

  dimension: journey_content {
    type: string
    sql: ${TABLE}.journey_content ;;
#    drill_fields: [detail*]
  }

  dimension: journey_id {
    type: number
    sql: ${TABLE}.journey_id ;;
#    drill_fields: [detail*]
  }

  dimension: journey_pathway_badge_title {
    type: string
    sql: ${TABLE}.journey_pathway_badge_title ;;
#    drill_fields: [detail*]
  }

  dimension: journey_pathway_content {
    type: string
    sql: ${TABLE}.journey_pathway_content ;;
#    drill_fields: [detail*]
  }

  dimension: journey_pathway_id {
    type: number
    sql: ${TABLE}.journey_pathway_id ;;
#    drill_fields: [detail*]
  }

  dimension: journey_pathway_title {
    type: string
    sql: ${TABLE}.journey_pathway_title ;;
#    drill_fields: [detail*]
  }

  dimension: journey_state {
    type: string
    sql: ${TABLE}.journey_state ;;
#    drill_fields: [detail*]
  }

  dimension: journey_title {
    type: string
    sql: ${TABLE}.journey_title ;;
#    drill_fields: [detail*]
  }

  dimension: overall_content_structure {
    type: string
    sql: ${TABLE}.overall_content_structure ;;
#    drill_fields: [detail*]
  }

  dimension: overall_content_structure_id {
    type: number
    sql: ${TABLE}.overall_content_structure_id ;;
#    drill_fields: [detail*]
  }

  dimension: overall_content_structure_status {
    type: string
    sql: ${TABLE}.overall_content_structure_status ;;
#    drill_fields: [detail*]
  }

  dimension: overall_content_structure_title {
    type: string
    sql: ${TABLE}.overall_content_structure_title ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_content {
    type: string
    sql: ${TABLE}.pathway_content ;;
#    drill_fields: [detail*]
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: total_channel_associations {
    type: number
    sql: ${TABLE}.total_channel_associations ;;
#    drill_fields: [detail*]
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
 #   drill_fields: [detail*]
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
 #   drill_fields: [detail*]
  }

  dimension: user_id_1 {
    type: number
    value_format_name: id
    sql: ${TABLE}.user_id_1 ;;
#    drill_fields: [detail*]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      group_name,user_full_name,carousel_name,channel_name,time_completed_time,
      journey_title,journey_pathway_title,card_title,duration_hhmm,
      duration_seconds,email,journey_id,journey_pathway_id,card_id,group_id,group_status,
      card_subtype,duration_hhmm,email,
      journey_id,journey_pathway_id,card_id,
      group_id,group_status,content_structure,
      journey_badge_title,journey_pathway_badge_title,card_type,user_id_1,badge_content,
      journey_content,pathway_content,journey_pathway_content,channel_id,is_carousel_enabled,
      channel_content,carousel_content,
      channel_content_exclusivity,journey_state,total_channel_associations,
      #content_status,
      card_author_full_name,card_author_id,
      #is_user_generated,
      card_state,overall_content_structure,
      overall_content_structure_title,overall_content_structure_status,overall_content_structure_id,
      excluded_from_leaderboard,
      user_account_status,card_resource_url,
      #is_live_stream,
      card_subtype,ecl_source_name,
      #is_card_promoted,
      is_public,card_level,average_rating,external_id


    ]
  }
}
