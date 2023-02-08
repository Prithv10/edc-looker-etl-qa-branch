# The name of this view in Looker is "C2 Content Structure Metadata Vw"
view: c2_content_structure_metadata_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

# sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.c2_content_structure_metadata_vw`
#     ;;

  sql_table_name: `{{_user_attributes['database']}}.c2_content_structure_metadata_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average Rating" in Explore.


# Created Primary Key Dimension
  dimension: primary_key {
    primary_key: yes
    sql: concat(${TABLE}.card_id,${TABLE}.channel_id,${TABLE}.journey_id,
    ${TABLE}.pathway_id,${TABLE}.journey_pathway_id,
    ${TABLE}.ecl_id);;

 }



 dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
#    drill_fields: [details*]
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_rating {
    type: sum
    sql: ${average_rating} ;;
 #   drill_fields: [details*]
  }

  measure: average_average_rating {
    type: average
    sql: ${average_rating} ;;
#    drill_fields: [details*]
  }

  dimension: badge_content {
    type: string
    sql: ${TABLE}.badge_content ;;
#    drill_fields: [details*]
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
#    drill_fields: [details*]
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
#    drill_fields: [details*]
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
#    drill_fields: [details*]
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
#    drill_fields: [details*]
  }

  dimension: card_resource_url {
    type: string
    sql: ${TABLE}.card_resource_url ;;
 #   drill_fields: [details*]
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
 #   drill_fields: [details*]
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.card_subtype ;;
 #   drill_fields: [details*]
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
 #   drill_fields: [details*]
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
 #   drill_fields: [details*]
  }

  dimension: carousel_content {
    type: string
    sql: ${TABLE}.carousel_content ;;
 #   drill_fields: [details*]
  }

  dimension: carousel_name {
    type: string
    sql: ${TABLE}.carousel_name ;;
 #   drill_fields: [details*]
  }

  dimension: channel_content {
    type: string
    sql: ${TABLE}.channel_content ;;
 #   drill_fields: [details*]
  }

  dimension: channel_content_exclusivity {
    type: string
    sql: ${TABLE}.channel_content_exclusivity ;;
#    drill_fields: [details*]
  }

  dimension: channel_id {
    type: number
    sql: ${TABLE}.channel_id ;;
  #  drill_fields: [details*]
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
#    drill_fields: [details*]
  }

  dimension: channel_position {
    type: number
    sql: ${TABLE}.channel_position ;;
 #   drill_fields: [details*]
  }

#   dimension: content_status {
#     type: string
#     sql: ${TABLE}.content_status ;;
# #   drill_fields: [details*]
#   }

  dimension: current_content_owner_full_name {
    type: number
    sql: ${TABLE}.current_content_owner_full_name ;;
#    drill_fields: [details*]
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.duration_hhmm ;;
 #   drill_fields: [details*]
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
    #   drill_fields: [detail*]
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
 #   drill_fields: [details*]
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
#    drill_fields: [details*]
  }

#   dimension: is_card_promoted {
#     type: number
#     sql: ${TABLE}.is_card_promoted ;;
# #    drill_fields: [details*]
#   }

  dimension: is_carousel_enabled {
    type: yesno
    sql: ${TABLE}.is_carousel_enabled ;;
#    drill_fields: [details*]
  }

#   dimension: is_live_stream {
#     type: number
#     sql: ${TABLE}.is_live_stream ;;
# #   drill_fields: [details*]
#   }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
 #   drill_fields: [details*]
  }

#   dimension: is_user_generated {
#     type: number
#     sql: ${TABLE}.is_user_generated ;;
# #    drill_fields: [details*]
#   }

  dimension: journey_badge_title {
    type: string
    sql: ${TABLE}.journey_badge_title ;;
 #   drill_fields: [details*]
  }

  dimension: journey_content {
    type: string
    sql: ${TABLE}.journey_content ;;
#    drill_fields: [details*]
  }

  dimension: journey_id {
    type: number
    sql: ${TABLE}.journey_id ;;
#    drill_fields: [details*]
  }

  dimension: journey_pathway_badge_title {
    type: string
    sql: ${TABLE}.journey_pathway_badge_title ;;
 #   drill_fields: [details*]
  }

  dimension: journey_pathway_content {
    type: string
    sql: ${TABLE}.journey_pathway_content ;;
#    drill_fields: [details*]
  }

  dimension: journey_pathway_id {
    type: number
    sql: ${TABLE}.journey_pathway_id ;;
 #   drill_fields: [details*]
  }

  dimension: journey_pathway_title {
    type: string
    sql: ${TABLE}.journey_pathway_title ;;
 #   drill_fields: [details*]
  }

  dimension: journey_state {
    type: string
    sql: ${TABLE}.journey_state ;;
#    drill_fields: [details*]
  }

  dimension: journey_title {
    type: string
    sql: ${TABLE}.journey_title ;;
 #   drill_fields: [details*]
  }

  dimension: overall_content_structure {
    type: string
    sql: ${TABLE}.Overall_Content_Structure ;;
 #   drill_fields: [details*]
  }

  dimension: overall_content_structure_id {
    type: number
    sql: ${TABLE}.Overall_Content_Structure_id ;;
#    drill_fields: [details*]
  }

  dimension: overall_content_structure_status {
    type: string
    sql: ${TABLE}.Overall_Content_Structure_Status ;;
#    drill_fields: [details*]
  }

  dimension: overall_content_structure_title {
    type: string
    sql: ${TABLE}.Overall_Content_Structure_Title ;;
#    drill_fields: [details*]
  }

  dimension: pathway_badge_title {
    type: string
    sql: ${TABLE}.pathway_badge_title ;;
#    drill_fields: [details*]
  }

  dimension: pathway_content {
    type: string
    sql: ${TABLE}.pathway_content ;;
#    drill_fields: [details*]
  }

  dimension: pathway_id {
    type: number
    sql: ${TABLE}.pathway_id ;;
 #   drill_fields: [details*]
  }

  dimension: pathway_state {
    type: string
    sql: ${TABLE}.pathway_state ;;
#    drill_fields: [details*]
  }

  dimension: pathway_title {
    type: string
    sql: ${TABLE}.pathway_title ;;
#    drill_fields: [details*]
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
#    drill_fields: [details*]
  }

  dimension: total_channel_associations {
    type: number
    sql: ${TABLE}.total_channel_associations ;;
 #   drill_fields: [details*]
  }
#CONCAT('wiseup.edcast.com/insights/ECL-',`ECL ID`)

  dimension: deep_link_url {
    type: string
    sql: concat('wiseup.edcast.com/insights/ECL-',${ecl_id}) ;;
  }
  measure: count {
    type: count
    drill_fields: [details*]
    }
measure: count_distinct_card_ids {
  type: count_distinct
  sql: ${card_id} ;;
  drill_fields: [details*]
}

#   dimension:rank {
#     type: number
#     sql: ROW_NUMBER() OVER (
#       ORDER BY ${count_distinct_card_ids} DESC);;
#   }

#   dimension: top_25_channels{
#     hidden: yes
#     type: yesno
#     sql: ${rank} <= 25;;
#   }

#   dimension: top_25_channel_names{
#     type: string
#     sql: CASE WHEN ${top_25_channels} THEN ${channel_name}
#           ELSE "Other"
#           END;;
# #          order_by_field: min_rank
#     }

  measure: count_of_duration_seconds {
    type: number
    sql: count(${TABLE}.duration_seconds) ;;
   drill_fields: [details*]

  }

    set: details {
      fields: [
        carousel_name,pathway_id,card_id,card_type,pathway_state,pathway_title,
        channel_id,channel_name,channel_position,is_carousel_enabled,
        overall_content_structure,overall_content_structure_id,
        journey_id,journey_title,journey_pathway_id,journey_pathway_title,journey_state,
        card_state,pathway_badge_title,journey_badge_title,journey_pathway_badge_title,
        badge_content,channel_content,journey_content,pathway_content,journey_pathway_content,
        carousel_content,
        #is_user_generated,
        card_author_id,card_author_full_name,
        card_title,
        #content_status,
        card_resource_url,
        #is_live_stream,
        card_subtype,
        ecl_id,ecl_source_name,
        #is_card_promoted,
        is_public,duration_hhmm,
        overall_content_structure_title,overall_content_structure_status,total_channel_associations,
        card_type,standard_card_type,card_level,average_average_rating,current_content_owner_full_name,
        channel_content_exclusivity

      ]
    }

  }
