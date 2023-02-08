# The name of this view in Looker is "G3 Groups Structured Content Performance Data Explorer Vw"
view: g3_groups_structured_content_performance_data_explorer_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_structured_content_performance_data_explorer_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.g3_groups_structured_content_performance_data_explorer_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assigned Content" in Explore.

  dimension: assigned_content {
    type: string
    sql: ${TABLE}.Assigned_Content ;;
 #   drill_fields: [detail*]
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.Average_Rating ;;
#    drill_fields: [detail*]
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_rating {
    type: sum
    sql: ${average_rating} ;;
    drill_fields: [detail*]
  }

  measure: average_average_rating {
    type: average
    sql: ${average_rating} ;;
    drill_fields: [detail*]
  }

  dimension: badge_content {
    type: string
    sql: ${TABLE}.Badge_Content ;;
 #   drill_fields: [detail*]
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.Card_Author_Full_Name ;;
  #  drill_fields: [detail*]
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.Card_Author_ID ;;
 #  drill_fields: [detail*]
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.Card_ID ;;
#    drill_fields: [detail*]
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.Card_Level ;;
  #  drill_fields: [detail*]
  }

  dimension: card_rating {
    type: number
    sql: ${TABLE}.Card_Rating ;;
  #  drill_fields: [detail*]
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.Card_State ;;
  #  drill_fields: [detail*]
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.Card_Subtype ;;
  #  drill_fields: [detail*]
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.Card_Type ;;
  #  drill_fields: [detail*]
  }

  dimension: carousel_content {
    type: string
    sql: ${TABLE}.Carousel_Content ;;
   # drill_fields: [detail*]
  }

  dimension: carousel_name {
    type: string
    sql: ${TABLE}.Carousel_Name ;;
    drill_fields: [channel_name]
  }

  dimension: channel_content {
    type: string
    sql: ${TABLE}.Channel_Content ;;
  #  drill_fields: [detail*]
  }

  dimension: channel_content_exclusivity {
    type: string
    sql: ${TABLE}.Channel_Content_Exclusivity ;;
  #  drill_fields: [detail*]
  }

  dimension: channel_id {
    type: number
    sql: ${TABLE}.Channel_ID ;;
   # drill_fields: [detail*]
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.Channel_Name ;;
    drill_fields: [overall_content_structure]
  }

  dimension: channel_position {
    type: number
    sql: ${TABLE}.Channel_Position ;;
 #   drill_fields: [detail*]
  }

  dimension: comment_id {
    type: number
    sql: ${TABLE}.Comment_ID ;;
  #  drill_fields: [detail*]
  }

  dimension: comment_message {
    type: number
    sql: ${TABLE}.Comment_message ;;
#    drill_fields: [detail*]
  }

#  dimension: content_status {
#    type: string
#    sql: ${TABLE}.Content_Status ;;
#    drill_fields: [detail*]
 # }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.Content_Structure ;;
  #  drill_fields: [detail*]
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ECL_ID ;;
 #   drill_fields: [detail*]
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ECL_Source_Name ;;
  #  drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
 #   drill_fields: [detail*]
  }

  dimension: event {
    type: string
    sql: ${TABLE}.Event ;;
 #   drill_fields: [detail*]
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  #  drill_fields: [detail*]
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.External_ID ;;
 #   drill_fields: [detail*]
  }

  dimension: followed_user_id {
    type: number
    sql: ${TABLE}.Followed_User_ID ;;
 #   drill_fields: [detail*]
  }

  dimension: follower_id {
    type: number
    sql: ${TABLE}.Follower_ID ;;
#    drill_fields: [detail*]
  }

  dimension: follower_user_full_name {
    type: string
    sql: ${TABLE}.Follower_User_Full_Name ;;
 #   drill_fields: [detail*]
  }

  dimension: following_user_full_name {
    type: string
    sql: ${TABLE}.Following_User_Full_Name ;;
#    drill_fields: [detail*]
  }

  dimension: group_user_role {
    type: string
    sql: ${TABLE}.Group_User_Role ;;
#    drill_fields: [detail*]
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

  dimension: card_title {
    type: string
    sql: ${TABLE}.Card_Title ;;
   drill_fields: [detail*]
  }

#   dimension: is_card_promoted {
#     type: number
#     sql: ${TABLE}.Is_Card_Promoted ;;
# #    drill_fields: [detail*]
#   }

  dimension: is_carousel_enabled {
    type: yesno
    sql: ${TABLE}.Is_Carousel_Enabled ;;
#    drill_fields: [detail*]
  }

#   dimension: is_live_stream {
#     type: number
#     sql: ${TABLE}.Is_Live_Stream ;;
# #    drill_fields: [detail*]
#   }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.Is_Public ;;
#    drill_fields: [detail*]
  }

#   dimension: is_user_generated {
#     type: number
#     sql: ${TABLE}.Is_User_Generated ;;
# #   drill_fields: [detail*]
#   }

  dimension: journey_badge_title {
    type: string
    sql: ${TABLE}.Journey_Badge_Title ;;
 #   drill_fields: [detail*]
  }

  dimension: journey_content {
    type: string
    sql: ${TABLE}.Journey_Content ;;
#    drill_fields: [detail*]
  }

  dimension: journey_id {
    type: number
    sql: ${TABLE}.Journey_ID ;;
#    drill_fields: [detail*]
  }

  dimension: journey_pathway_badge_title {
    type: string
    sql: ${TABLE}.Journey_Pathway_Badge_Title ;;
 #   drill_fields: [detail*]
  }

  dimension: journey_pathway_content {
    type: string
    sql: ${TABLE}.Journey_Pathway_Content ;;
 #   drill_fields: [detail*]
  }

  dimension: journey_pathway_id {
    type: number
    sql: ${TABLE}.Journey_Pathway_ID ;;
 #   drill_fields: [detail*]
  }

  dimension: journey_pathway_title {
    type: string
    sql: ${TABLE}.Journey_Pathway_Title ;;
 #   drill_fields: [detail*]
  }

  dimension: journey_state {
    type: string
    sql: ${TABLE}.Journey_State ;;
  #  drill_fields: [detail*]
  }

  dimension: journey_title {
    type: string
    sql: ${TABLE}.Journey_Title ;;
 #   drill_fields: [detail*]
  }

  dimension: overall_content_structure {
    type: string
    sql: ${TABLE}.Overall_Content_Structure ;;
    drill_fields: [overall_content_structure_title]

  }

  dimension: overall_content_structure_id {
    type: number
    sql: ${TABLE}.Overall_Content_Structure_ID ;;
#    drill_fields: [detail*]
  }

  dimension: overall_content_structure_title {
    type: string
    sql: ${TABLE}.Overall_Content_Structure_Title ;;
    #drill_fields: [card_title]
   drill_fields: [card_title]

  }

  dimension: pathway_badge_title {
    type: string
    sql: ${TABLE}.Pathway_Badge_Title ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_content {
    type: string
    sql: ${TABLE}.Pathway_Content ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_id {
    type: number
    sql: ${TABLE}.Pathway_ID ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_state {
    type: string
    sql: ${TABLE}.Pathway_State ;;
#    drill_fields: [detail*]
  }

  dimension: pathway_title {
    type: string
    sql: ${TABLE}.Pathway_Title ;;
 #   drill_fields: [detail*]
  }

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.Performance_metric ;;
#    drill_fields: [detail*]
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
#    drill_fields: [detail*]
  }

  dimension: shared_to_group_id {
    type: number
    sql: ${TABLE}.Shared_To_Group_ID ;;
#    drill_fields: [detail*]
  }

  dimension: shared_to_group_name {
    type: string
    sql: ${TABLE}.Shared_To_Group_Name ;;
#    drill_fields: [detail*]
  }

  dimension: shared_to_user_full_name {
    type: string
    sql: ${TABLE}.Shared_To_User_Full_Name ;;
#    drill_fields: [detail*]
  }

  dimension: shared_to_user_id {
    type: number
    sql: ${TABLE}.Shared_To_User_ID ;;
#    drill_fields: [detail*]
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
 #   drill_fields: [detail*]
  }

  dimension: time_week_with_format {
    type: date
    sql: ${time_week} ;;
    html: {{ rendered_value | date: "Week-%U %Y"}} ;;
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
    sql: ${TABLE}.Time_Account_Created ;;
    html: {{ rendered_value | date: "%D %r" }};;
#    drill_fields: [detail*]
  }

  dimension: total_channel_associations {
    type: number
    sql: ${TABLE}.Total_Channel_Associations ;;
#    drill_fields: [detail*]
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.User_Account_Status ;;
#    drill_fields: [detail*]
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.User_Full_Name ;;
#    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.User_ID ;;
 #   drill_fields: [detail*]
  }


  parameter: max_rank {
    type: number
  }

  dimension: rank_limit {
    type: number
    sql: ${TABLE}.pathway_title ;;
    html: {% parameter max_rank %} ;;

  }

  dimension: compliance_vs_non_compliance_training {
    type: string
    sql: CASE WHEN ${card_title} LIKE '%all employees%' THEN 'Compliance Training'
            WHEN ${card_title} LIKE '%2019-2020 information security%' then 'Compliance Training'
            WHEN ${card_title} LIKE '%2020-2021 information security%' then 'Compliance Training'
            WHEN ${card_title} LIKE '%Enterprise Data Management%' then 'Compliance Training'
            WHEN ${card_title} LIKE '%Cyber awareness training - 2021-2022 (mandatory training)%' then 'Compliance Training'
            WHEN ${card_title} LIKE '%2021 consolidated compliance training (mandatory training)%' then 'Compliance Training'
            WHEN ${card_title} LIKE '%2022 Consolidated Compliance Training (Mandatory Training)%' then 'Compliance Training'
            WHEN ${card_title} LIKE '%Anonymized%' THEN 'Compliance Training'
            WHEN ${card_title} LIKE '%2021 Health Insurance Portability and Accountability Act (HIPAA) Awareness Training%' THEN 'Compliance Training'
            WHEN ${card_title} LIKE '%2022 Fundamentals of Risk Management%' THEN 'Compliance Training'
            WHEN ${card_title} LIKE '%2022 Workplace Protection Laws%' THEN 'Compliance Training'
            WHEN ${card_title} LIKE '%Cyber Awareness Security Essentials%' THEN 'Compliance Training'
            WHEN ${card_title} LIKE '%2022-2023 Mandatory Cyber Awareness Training%' THEN 'Compliance Training'
            WHEN ${card_title} LIKE '%2022 End-User Computing (EUC) Training%' THEN 'Compliance Training'

      ELSE 'Non-Compliance Training'
      END ;;
  }

#Custom measures

measure: count_of_comment_messages {
  type: number
  sql: count(${comment_message}) ;;
  drill_fields: [detail*]
}
  measure: count_of_external_ids {
    type: number
    sql: count(${external_id}) ;;
    drill_fields: [detail*]
  }
measure: unique_emails {
  type: count_distinct
  sql:${TABLE}.email  ;;
  drill_fields: [detail*]
}


  measure: total_completions{
    type: count
    # sql: case when ${performance_metric} ='Total Completions' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Completions"
    }
    drill_fields: [detail*]
  }

  measure: current_likes{
    type: count
    #  sql: case when ${performance_metric} ='Current Likes' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Current Likes"
    }
    drill_fields: [detail*]
  }

  measure: followers_users{
    type: count
    # sql: case when ${performance_metric} ='Followers (Users)' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Followers (Users)"
    }
    drill_fields: [detail*]
  }


  measure: following_users{
    type: count
    #  sql: case when ${performance_metric} = 'Following (Users)' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Following (Users)"
    }
    drill_fields: [detail*]
  }
  measure: current_bookmarks{
    type: count
    # sql: case when ${performance_metric} ='Current Bookmarks' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Current Bookmarks"
    }
    drill_fields: [detail*]
  }

  measure: total_views{
    type: count
    # sql: case when ${performance_metric} ='Total Views' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Views"
    }
  drill_fields: [detail*]

  }

  measure: total_comments{
    type: count
    #  sql: case when ${performance_metric} ='Total Comments' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Comments"
    }
    drill_fields: [detail*]
  }

  measure: total_published_journeys{
    type: count
    # sql: case when ${performance_metric} ='Total Published Journeys' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Published Journeys"
    }
    drill_fields: [detail*]
  }

  measure: total_published_pathways{
    type: count
    # sql: case when ${performance_metric} ='Total Published Pathways' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Published Pathways"
    }
    drill_fields: [detail*]
  }

  measure: total_published_smartcards{
    type: count
    # sql: case when ${performance_metric} ='Total Published SmartCards' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Published SmartCards"
    }
    drill_fields: [detail*]
  }

  measure: total_shares_to_direct_users{
    type: count
    #  sql: case when ${performance_metric} ='Total Shares to Direct Users' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Shares to Direct Users"
    }
    drill_fields: [detail*]
  }

  measure: total_shares_to_groups{
    type: count
    # sql: case when ${performance_metric} ='Total Shares to Groups' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Shares to Groups"
    }
    drill_fields: [detail*]
  }

  measure: total_unique_card_views{
    type: count
    #  sql: case when ${performance_metric} ='Total Unique Card Views' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Unique Card Views"
    }
    drill_fields: [detail*]
  }


  measure: clc_badges_completed{
    type: count
    #  sql: case when ${performance_metric} ='CLC Badges Completed' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "CLC Badges Completed"
    }
    drill_fields: [detail*]
  }

  measure: total_content_source_visits{
    type: count
    #  sql: case when ${performance_metric} ='Total Content Source Visits' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Content Source Visits"
    }
    drill_fields: [detail*]
  }

  measure: total_bookmarks{
    type: count
    #  sql: case when ${performance_metric} ='Total Bookmarks' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Bookmarks"
    }
    drill_fields: [detail*]
  }

  measure: total_badges_earned{
    type: count
    # sql: case when ${performance_metric} ='Total Badges Earned' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Badges Earned"
    }
    drill_fields: [detail*]
  }

  measure: total_badges_shared{
    type: count
    #  sql: case when ${performance_metric} ='Total Badges Shared' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Badges Shared"
    }
    drill_fields: [detail*]
  }


  measure: total_ratings{
    type: count
    # sql: case when ${performance_metric} ='Total Ratings' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Ratings"
    }
    drill_fields: [detail*]
  }

#custom measure count (distinct `Carousel Name`)

measure: total_carousel  {
  type: count_distinct
  sql: ${TABLE}.carousel_name ;;
  drill_fields: [detail*]
}

measure: count_user_full_name {
  type: number
  sql: count(${user_full_name}) ;;
  drill_fields: [detail*]
}


  measure: total_events{
    type: number
    sql: ${clc_badges_completed}+${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+${total_shares_to_direct_users}+
          ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+${total_badges_earned}+${total_badges_shared}+${following_users}+
          ${followers_users}+${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
          ${total_bookmarks};;
    drill_fields: [detail*]
  }

  measure: total_events_EdJones{
    type: number
    sql: ${total_published_pathways}+${total_published_smartcards}+
          ${total_unique_card_views}+${total_content_source_visits}+${current_likes}+${total_completions}+${current_bookmarks}+
          ${total_views}+
          ${total_bookmarks};;
    drill_fields: [detail*]
  }
measure: count_ecl_ids {
  type: number
  sql: count(${ecl_id}) ;;
  drill_fields: [detail*]
}
  #This counts card titles
  measure: count {
    type: count
    drill_fields: [detail*]
  }

measure: count_channel_names {
  type: number
  sql: count(${channel_name}) ;;
  drill_fields: [detail*]
}
  measure: count_of_user_id {
    type: number
    sql: count(${user_id}) ;;
    drill_fields: [detail*]
  }

  measure: count_distinct_of_user_id {
    type: count_distinct
    sql: (${user_id}) ;;
    drill_fields: [detail*]
  }
  measure: count_distinct_card_id {
    type: count_distinct
    sql: ${TABLE}.Card_ID ;;
    drill_fields: [detail*]
  }

  measure: count_card_ids {
    type: number
    sql: count(${TABLE}.Card_ID) ;;
    drill_fields: [detail*]
  }

  measure: count_card_titles {
    type: number
    sql: count(${card_title}) ;;
    drill_fields: [detail*]
  }

  measure: count_follower_user_full_name {
    type: number
    sql: count(${follower_user_full_name}) ;;
    drill_fields: [detail*]
  }

  measure: count_followed_user_ID {
    type: number
    sql: count(${followed_user_id}) ;;
    drill_fields: [detail*]
  }

  measure: total_events_EdJones_Channel_Activity{
    type: number
    sql: ${total_unique_card_views}+${total_content_source_visits}+${current_likes}+${total_completions}+${current_bookmarks}+${total_views}+
      ${total_bookmarks};;
    drill_fields: [detail*]
  }

measure: count_performance_metric {
  type: number
  sql: count(${performance_metric}) ;;
  drill_fields: [detail*]
}

  measure: max_card_rating {
    type: max
    sql: ${TABLE}.Card_Rating ;;
    drill_fields: [detail*]
  }

  measure: avg_card_rating {
    type: average
    sql: ${TABLE}.Card_Rating ;;
    drill_fields: [detail*]
  }

  #COUNT(DISTINCT CONCAT(`User ID`,`Card ID`))

  measure: concat_user_id_card_id {
    type: count_distinct
    sql: concat(${TABLE}.user_id,${TABLE}.card_id) ;;
  }

  measure: count_distinct_user_full_name {
    type: count_distinct
    sql: ${user_full_name} ;;
  }
measure: count_of_event {
  type: number
  sql: count(${event}) ;;
}

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      channel_name, performance_metric,pathway_id,

      card_id, card_type, pathway_state, card_title,pathway_title,
      channel_id, carousel_name, channel_position, is_carousel_enabled,
      overall_content_structure_id, journey_id, journey_title, journey_pathway_id,
      journey_pathway_title, journey_state, card_state, pathway_badge_title,
      journey_badge_title, journey_pathway_badge_title, badge_content, channel_content,
      journey_content, pathway_content, journey_pathway_content, carousel_content,
      #is_user_generated,
      card_author_id, card_author_full_name,
      #content_status,
      overall_content_structure_title,total_channel_associations, overall_content_structure,
      channel_content_exclusivity, user_id, user_full_name, email, event, shared_to_user_id,
      shared_to_group_id, time_raw, platform, comment_id, comment_message,
      follower_id, followed_user_id, shared_to_user_full_name, follower_user_full_name,
      following_user_full_name, shared_to_group_name, content_structure,group_id,group_name,
      group_status,excluded_from_leaderboard, time_account_created_raw, assigned_content,
      user_account_status,
      #is_live_stream,
      card_subtype, ecl_id,
      ecl_source_name,
      #is_card_promoted,
      is_public, card_level,
      average_rating, external_id, card_rating, group_user_role,
      ]
  }
}
