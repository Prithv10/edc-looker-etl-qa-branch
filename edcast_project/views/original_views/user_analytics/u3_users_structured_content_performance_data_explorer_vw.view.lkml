# The name of this view in Looker is "U3 Users Structured Content Performance Data Explorer Vw"
view: u3_users_structured_content_performance_data_explorer_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.


  sql_table_name: `{{_user_attributes['database']}}.u3_users_structured_content_performance_data_explorer_vw`
  ;;

#  sql_table_name: `spark_edcast_qa.u3_users_structured_content_performance_data_explorer_vw`
 #   ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assigned Content" in Explore.

  dimension: assigned_content {
    type: string
    sql: ${TABLE}.Assigned_Content ;;
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.Average_Rating ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_rating {
    type: sum
    sql: ${average_rating} ;;
  }

  measure: average_average_rating {
    type: average
    sql: ${average_rating} ;;
  }

  dimension: badge_content {
    type: string
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

  dimension: card_rating {
    type: number
    sql: ${TABLE}.Card_Rating ;;
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

  dimension: carousel_content {
    type: string
    sql: ${TABLE}.Carousel_Content ;;
  }

  dimension: carousel_name {
    type: string
    sql: ${TABLE}.Carousel_Name ;;
  }

  dimension: channel_content {
    type: string
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

  dimension: comment_id {
    type: number
    sql: ${TABLE}.Comment_ID ;;
  }

  dimension: comment_message {
    type: number
    sql: ${TABLE}.Comment_message ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.Content_Structure ;;
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

  dimension: event {
    type: string
    sql: ${TABLE}.Event ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.External_ID ;;
  }

  dimension: followed_user_id {
    type: number
    sql: ${TABLE}.Followed_User_ID ;;
  }

  dimension: follower_id {
    type: number
    sql: ${TABLE}.Follower_ID ;;
  }

  dimension: follower_user_full_name {
    type: string
    sql: ${TABLE}.Follower_User_Full_Name ;;
  }

  dimension: following_user_full_name {
    type: string
    sql: ${TABLE}.Following_User_Full_Name ;;
  }

  dimension: is_carousel_enabled {
    type: yesno
    sql: ${TABLE}.Is_Carousel_Enabled ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.Is_Public ;;
  }

  dimension: journey_badge_title {
    type: string
    sql: ${TABLE}.Journey_Badge_Title ;;
  }

  dimension: journey_content {
    type: string
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
    type: string
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

  dimension: overall_content_structure_title {
    type: string
    sql: ${TABLE}.Overall_Content_Structure_Title ;;
  }

  dimension: pathway_badge_title {
    type: string
    sql: ${TABLE}.Pathway_Badge_Title ;;
  }

  dimension: pathway_content {
    type: string
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

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.Performance_metric ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
  }

  dimension: shared_to_group_id {
    type: number
    sql: ${TABLE}.Shared_To_Group_ID ;;
  }

  dimension: shared_to_group_name {
    type: string
    sql: ${TABLE}.Shared_To_Group_Name ;;
  }

  dimension: shared_to_user_full_name {
    type: string
    sql: ${TABLE}.Shared_To_User_Full_Name ;;
  }

  dimension: shared_to_user_id {
    type: number
    sql: ${TABLE}.Shared_To_User_ID ;;
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
  }

  dimension: total_channel_associations {
    type: number
    sql: ${TABLE}.Total_Channel_Associations ;;
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


  measure: total_completions{
    type: count
    #  sql: case when ${performance_metric} ='Total Completions' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Completions"
    }
    drill_fields: [detail*]
  }

  measure: current_likes{
    type: count
#    sql: case when ${performance_metric} ='Current Likes' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Current Likes"
    }
    drill_fields: [detail*]
  }

  measure: current_bookmarks{
    type: count
    #   sql: case when ${performance_metric} ='Current Bookmarks' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Current Bookmarks"
    }
    drill_fields: [detail*]
  }

  measure: total_views{
    type: count
    #  sql: case when ${performance_metric} ='Total Views' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Views"
    }
    drill_fields: [detail*]
  }

  measure: total_comments{
    type: count
    #   sql: case when ${performance_metric} ='Total Comments' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Comments"
    }
    drill_fields: [detail*]
  }

  measure: total_published_journeys{
    type: count
    #   sql: case when ${performance_metric} ='Total Published Journeys' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Published Journeys"
    }
    drill_fields: [detail*]
  }

  measure: total_published_pathways{
    type: count
    #  sql: case when ${performance_metric} ='Total Published Pathways' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Published Pathways"
    }
    drill_fields: [detail*]
  }

  measure: total_published_smartcards{
    type: count
    #  sql: case when ${performance_metric} ='Total Published SmartCards' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Published SmartCards"
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


  measure: total_ratings{
    type: count
    #  sql: case when ${performance_metric} ='Total Ratings' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Ratings"
    }
    drill_fields: [detail*]
  }

  measure: total_shares_to_direct_users{
    type: count
    #  sql: case when ${performance_metric} ='Total Ratings' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Shares To Direct Users"
    }
    drill_fields: [detail*]
  }

#  'CLC Badges Completed', 'Total Published Journeys', 'Total Published Pathways',
  #       'Total Published SmartCards', 'Total Shares to Direct Users', 'Total Shares to Groups', 'Total Unique Card Views',
  #       'Total Content Source Visits', 'Total Badges Shared','Following (Users)','Followers (Users)','Current Likes','Total Completions',
  #       'Current Bookmarks','Total Ratings','Total Completions','Total Views','Total Badges Earned','Total Comments','Total_Bookmarks'

  measure: total_events{
    type: number
    sql: ${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+
          ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+
          ${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
          ${total_bookmarks}+${total_shares_to_direct_users};;
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      follower_user_full_name,
      card_author_full_name,
      ecl_source_name,
      shared_to_user_full_name,
      carousel_name,
      shared_to_group_name,
      following_user_full_name,
      channel_name,
      user_full_name
    ]
  }
}
