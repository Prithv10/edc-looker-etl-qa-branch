# The name of this view in Looker is "Mock C2 Content Structuremetadata"
view: mock_c2_content_structuremetadata {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.mock_c2_content_structuremetadata`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average Rating" in Explore.




  dimension: average_rating {
    type: number
    sql: ${TABLE}.Average_Rating ;;
  }

  dimension: badge_content {
    type: yesno
    sql: ${TABLE}.Badge_Content ;;
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

  dimension: card_type_1 {
    type: string
    sql: ${TABLE}.Card_Type_1 ;;
  }

  dimension: carousel_content {
    type: yesno
    sql: ${TABLE}.Carousel_Content ;;
  }

  dimension: carousel_name {
    type: string
    sql: ${TABLE}.Carousel_Name ;;
    drill_fields: [details*]
  }

  dimension: channel_content {
    type: yesno
    sql: ${TABLE}.Channel_Content ;;
  }

  dimension: channel_content_exclusivity {
    type: string
    sql: ${TABLE}.Channel_Content_Exclusivity ;;
  }

  dimension: channel_id {
    type: number
    sql: ${TABLE}.Channel_ID ;;
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.Channel_Name ;;
  }

  dimension: channel_position {
    type: number
    sql: ${TABLE}.Channel_Position ;;
  }

  dimension: content_status {
    type: string
    sql: ${TABLE}.Content_Status ;;
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

  dimension: is_card_promoted {
    type: number
    sql: ${TABLE}.Is_Card_Promoted ;;
  }

  dimension: is_carousel_enabled {
    type: yesno
    sql: ${TABLE}.Is_Carousel_Enabled ;;
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

  dimension: journey_badge_title {
    type: string
    sql: ${TABLE}.Journey_Badge_Title ;;
  }

  dimension: journey_content {
    type: yesno
    sql: ${TABLE}.Journey_Content ;;
  }

  dimension: journey_id {
    type: number
    sql: ${TABLE}.Journey_ID ;;
  }

  dimension: journey_pathway_badge_title {
    type: string
    sql: ${TABLE}.Journey_Pathway_Badge_Title ;;
  }

  dimension: journey_pathway_content {
    type: yesno
    sql: ${TABLE}.Journey_Pathway_Content ;;
  }

  dimension: journey_pathway_id {
    type: number
    sql: ${TABLE}.Journey_Pathway_ID ;;
  }

  dimension: journey_pathway_title {
    type: string
    sql: ${TABLE}.Journey_Pathway_Title ;;
  }

  dimension: journey_state {
    type: string
    sql: ${TABLE}.Journey_State ;;
  }

  dimension: journey_title {
    type: string
    sql: ${TABLE}.Journey_Title ;;
  }

  dimension: overall_content_structure {
    type: string
    sql: ${TABLE}.Overall_Content_Structure ;;
  }

  dimension: overall_content_structure_id {
    type: number
    sql: ${TABLE}.Overall_Content_Structure_ID ;;
  }

  dimension: overall_content_structure_status {
    type: string
    sql: ${TABLE}.Overall_Content_Structure_Status ;;
  }

  dimension: overall_content_structure_title {
    type: string
    sql: ${TABLE}.Overall_Content_Structure_Title ;;
  }

  dimension: pathway_badge_title {
    type: string
    sql: ${TABLE}.Pathway_Badge_Title ;;
  }

  dimension: pathway_content {
    type: yesno
    sql: ${TABLE}.Pathway_Content ;;
  }

  dimension: pathway_id {
    type: number
    sql: ${TABLE}.Pathway_ID ;;
  }

  dimension: pathway_state {
    type: string
    sql: ${TABLE}.Pathway_State ;;
  }

  dimension: pathway_title {
    type: string
    sql: ${TABLE}.Pathway_Title ;;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.Standard_Card_Type ;;
  }

  dimension: total_channel_associations {
    type: number
    sql: ${TABLE}.Total_Channel_Associations ;;
  }

#measure: count_with_others {
#  type: number
#  sql: if (
#  row() != max(row()),
#  ${mock_c2_content_structuremetadata.count},
#  sum(${mock_c2_content_structuremetadata.count})- sum(
#        if(row() = max(row()),
#       0,
#        ${mock_c2_content_structuremetadata.count})
#      ))
#
#    ;;
#}
  measure: count {
    type: count
    drill_fields: [details*]
  }

  set: details {
    fields: [carousel_name, pathway_id,card_id,card_type,pathway_state, pathway_title,channel_id, channel_name,channel_position, is_carousel_enabled,
      overall_content_structure, overall_content_structure_id, journey_id,journey_title,journey_pathway_id,journey_pathway_title,pathway_badge_title,
      journey_badge_title,journey_state,card_state,journey_pathway_badge_title,journey_content,pathway_content,journey_pathway_content,channel_content,
      badge_content,channel_content,is_user_generated,card_author_id,card_author_full_name,card_title,content_status,card_resource_url,is_live_stream,
      card_subtype,ecl_source_name,is_card_promoted,is_public_,duration__seconds_,duration__hh_mm_,overall_content_structure_title,overall_content_structure_status,
      total_channel_associations,card_type_1,standard_card_type,card_level,average_rating,current_content_owner_full_name,channel_content_exclusivity]
  }
}
