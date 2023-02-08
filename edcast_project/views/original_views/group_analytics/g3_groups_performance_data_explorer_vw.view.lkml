# The name of this view in Looker is "G3 Groups Performance Data Explorer Vw"
view: g3_groups_performance_data_explorer_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.g3_groups_performance_data_explorer_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.g3_groups_performance_data_explorer_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assigned Content" in Explore.

# Created Primary Key Dimension
  dimension: primary_key {
    primary_key: yes
    sql: concat(${TABLE}.user_id,${TABLE}.Time) ;;
  }

  dimension: assigned_content {
    type: string
    sql: ${TABLE}.assigned_content ;;
 #   drill_fields: [detail*]
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
  #  drill_fields: [detail*]
  }

  dimension: badge_id {
    type: string
    sql: ${TABLE}.badge_id ;;
#    drill_fields: [detail*]
  }

  dimension: badge_title {
    type: string
    sql: ${TABLE}.badge_title ;;
  #  drill_fields: [detail*]
  }

  dimension: badge_type {
    type: string
    sql: ${TABLE}.badge_type ;;
  #  drill_fields: [detail*]
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
 #   drill_fields: [detail*]
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
  #  drill_fields: [detail*]
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

  dimension: card_rating {
    type: number
    sql: ${TABLE}.card_rating ;;
   # drill_fields: [detail*]
  }

  dimension: card_resource_url {
    type: number
    sql: ${TABLE}.card_resource_url ;;
  #  drill_fields: [detail*]
  }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
  #  drill_fields: [detail*]
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.card_subtype ;;
  #  drill_fields: [detail*]
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
  #  drill_fields: [detail*]
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
 #   drill_fields: [detail*]
  }

  dimension: comment_id {
    type: number
    sql: ${TABLE}.comment_id ;;
 #   drill_fields: [detail*]
  }

  dimension: comment_message {
    type: number
    sql: ${TABLE}.comment_message ;;
  #  drill_fields: [detail*]
  }

  dimension: comment_status {
    type: string
    sql: ${TABLE}.comment_status ;;
 #   drill_fields: [detail*]
  }

  dimension: content_completion_sync {
    type: string
    sql: ${TABLE}.content_completion_sync ;;
#    drill_fields: [detail*]
  }

#  dimension: content_status {
#   type: string
#    sql: ${TABLE}.content_status ;;
#    drill_fields: [detail*]
#  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  #  drill_fields: [detail*]
  }

  dimension: current_content_owner_full_name {
    type: string
    sql: ${TABLE}.current_content_owner_full_name ;;
  #  drill_fields: [detail*]
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.duration_HHMM ;;
 #   drill_fields: [detail*]
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.duration_seconds ;;
 #   drill_fields: [detail*]
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration_seconds {
    type: sum
    sql: ${duration_seconds} ;;
 #   drill_fields: [detail*]
  }

  measure: count_duration_hhmm {
    type: number
    sql: count(${duration_hhmm}) ;;
    #   drill_fields: [detail*]
  }
  measure: average_duration_seconds {
    type: average
    sql: ${duration_seconds} ;;
 #   drill_fields: [detail*]
  }

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
  #  drill_fields: [detail*]
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
  #  drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
 #   drill_fields: [detail*]
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  #  drill_fields: [detail*]
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  #  drill_fields: [detail*]
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
 #   drill_fields: [detail*]
  }

  dimension: followed_user_id {
    type: number
    sql: ${TABLE}.followed_user_id ;;
 #   drill_fields: [detail*]
  }

  dimension: follower_id {
    type: number
    sql: ${TABLE}.follower_id ;;
  #  drill_fields: [detail*]
  }

  dimension: follower_user_full_name {
    type: string
    sql: ${TABLE}.follower_user_full_name ;;
 #   drill_fields: [detail*]
  }

  dimension: following_user_full_name {
    type: string
    sql: ${TABLE}.following_user_full_name ;;
 #   drill_fields: [detail*]
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.Group_ID ;;
#    drill_fields: [detail*]
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.Group_Name ;;
 #   drill_fields: [detail*]
  }

  dimension: group_status {
    type: string
    sql: ${TABLE}.Group_Status ;;
#    drill_fields: [detail*]
  }

  dimension: group_user_role {
    type: string
    sql: ${TABLE}.Group_User_Role ;;
 #   drill_fields: [detail*]
  }

 # dimension: is_card_promoted {
#    type: number
#    sql: ${TABLE}.is_card_promoted ;;
#    drill_fields: [detail*]
#  }

#  dimension: is_livestream {
#    type: number
#    sql: ${TABLE}.is_livestream ;;
#    drill_fields: [detail*]
#  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
#    drill_fields: [detail*]
  }

#  dimension: is_user_generated {
#    type: number
#    sql: ${TABLE}.is_user_generated ;;
#    drill_fields: [detail*]
#  }

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.performance_metric ;;
 #   drill_fields: [detail*]
  }


  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
 #   drill_fields: [detail*]
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
 #   drill_fields: [detail*]
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  #  drill_fields: [detail*]
  }

  dimension: shared_to_group_id {
    type: number
    sql: ${TABLE}.shared_to_group_id ;;
  #  drill_fields: [detail*]
  }

  dimension: shared_to_group_name {
    type: string
    sql: ${TABLE}.shared_to_group_name ;;
 #   drill_fields: [detail*]
  }

  dimension: shared_to_user_full_name {
    type: string
    sql: ${TABLE}.shared_to_user_full_name ;;
  #  drill_fields: [detail*]
  }

  dimension: shared_to_user_id {
    type: number
    sql: ${TABLE}.shared_to_user_id ;;
 #   drill_fields: [detail*]
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  #  drill_fields: [detail*]
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
  #  drill_fields: [detail*]
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
    sql: ${TABLE}.time ;;
    html: {{ rendered_value | date: "%D %r" }};;
#    drill_fields: [detail*]
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
 #   drill_fields: [detail*]
  }

  dimension_group: time_account_suspended {
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
    sql: ${TABLE}.time_account_suspended ;;
    html: {{ rendered_value | date: "%D %r" }};;
  #  drill_fields: [detail*]
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
#    drill_fields: [detail*]
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
#    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
#    drill_fields: [detail*]
  }

  measure: count {
    type: count
    drill_fields: [detail*]

    }

measure: learning_hours {
  type: number
  sql: ${total_duration_seconds}/3600 ;;
  drill_fields: [detail*]
}


  measure: distinct_active_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [detail*]
  }

  measure: count_of_event {
    type: count_distinct
    sql: ${TABLE}.event ;;
    drill_fields: [detail*]
  }

  measure: event_count {
    type: number
    sql: count(${TABLE}.event) ;;
    drill_fields: [detail*]
  }

  measure: count_of_performance_metric {
    type: number
    sql: count(${performance_metric}) ;;
    drill_fields: [detail*]
  }

 #Start - MEASURES for Top 20 Groups/ Content/ Users - Group Analytics


  # measure: total_platforms{
  #   type: number
  #   sql: ${android}+${ios}+${web}+${widgets}+${slack}+${sfdc}+${o365_word}+${o365_ppt}+${o365_excel}+${ms_teams}+${gsuite_docs}+${gsuite_sheets}+${gsuite_slides};;
  #   drill_fields: [detail*]
  # }

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

# (case when performance_metric in('CLC Badges Completed', 'Total Published Journeys', 'Total Published Pathways',
#     'Total Published SmartCards', 'Total Shares to Direct Users', 'Total Shares to Groups', 'Total Unique Card Views',
#     'Total Content Source Visits', 'Total Badges Shared','Following (Users)','Followers (Users)','Current Likes','Total Completions',
#     'Current Bookmarks','Total Ratings','Total Completions','Total Views','Total Badges Earned','Total Comments','Total_Bookmarks') then 1 else 0 end) ;;
  measure: total_events{
    type: number
    sql: ${clc_badges_completed}+${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+${total_shares_to_direct_users}+
    ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+${total_badges_earned}+${total_badges_shared}+${following_users}+
    ${followers_users}+${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
    ${total_bookmarks};;
    drill_fields: [detail*]
 }

  measure: total_events_TetraP_top20users{
    type: number
    sql: ${total_unique_card_views}+${total_completions}+${total_views};;
    drill_fields: [detail*]
  }

  measure: total_events_nationwide_copy_top20users{
    type: number
    sql: ${total_published_smartcards}+${total_shares_to_direct_users}+${total_shares_to_groups}+${total_content_source_visits}+${total_completions}+${total_views}+
          ${total_bookmarks};;
    drill_fields: [detail*]
  }

  measure: total_events_nationwide_top20users{
    type: number
    sql: ${total_unique_card_views}+${total_content_source_visits}+${total_completions}+${current_bookmarks}+${total_views}+${total_bookmarks};;
    drill_fields: [detail*]
  }


  #End - MEASURES for Top 20 Groups/ Content/ Users - Group Analytics

  measure: total_comp_views_tucv {
    type: number
    sql: ${total_unique_card_views}+${total_completions}+${total_views} ;;
    drill_fields: [detail*]

  }

  #Start - MEASURES for Active Group Users by Platform - Group Analytics
  # measure: gsuite_docs{
  #   type: sum
  #   sql: case when ${platform} ='GSuite - Docs' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }

  # measure: gsuite_sheets{
  #   type: sum
  #   sql: case when ${platform} ='GSuite - Sheets' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: gsuite_slides{
  #   type: sum
  #   sql: case when ${platform} ='GSuite - Slides' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: ms_teams{
  #   type:sum
  #   sql: case when ${platform} ='Microsoft Teams' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: o365_excel{
  #   type: sum
  #   sql: case when ${platform} ='O365 - Excel' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: o365_ppt{
  #   type: sum
  #   sql: case when ${platform} ='O365 - PPT' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: o365_word{
  #   type: sum
  #   sql: case when ${platform} ='O365 - Word' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: sfdc{
  #   type: sum
  #   sql: case when ${platform} ='SFDC' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: slack{
  #   type: sum
  #   sql: case when ${platform} ='Slack' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  # measure: widgets{
  #   type: sum
  #   sql: case when ${platform} ='Widgets' then 1 else 0 end ;;
  #   drill_fields: [detail*]
  # }
  measure: android{
    type: count
    # sql: case when ${platform} ='android' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "android"
    }
    drill_fields: [detail*]
  }

  measure: ios{
    type: count
    #sql: case when ${platform} ='ios' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "ios"
    }
    drill_fields: [detail*]
  }



  measure: web{
    type: count
    # sql: case when ${platform} ='web' then 1 else 0 end ;;
    filters: {
      field: platform
      value: "web"
    }
    drill_fields: [detail*]
  }


  measure: total_platforms{
    type: number
    sql: ${android}+${ios}+${web};;
    #+${widgets}+${slack}+${sfdc}+${o365_word}+${o365_ppt}+${o365_excel}+${ms_teams}+${gsuite_docs}+${gsuite_sheets}+${gsuite_slides};;
    drill_fields: [detail*]
  }
 #End - MEASURES for Active Group Users by Platform - Group Analytics

  measure: count_UGC {
    type: count
    filters: {
      field: ecl_source_name
      value: "User Generated Content"
    }
    drill_fields: [detail*]
  }


measure: count_of_user_id {
  type: number
  sql: count(${user_id}) ;;
  drill_fields: [detail*]
}
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      time_raw,
      group_name, performance_metric, user_id, group_id,
      group_status, card_id, card_state, card_title,
      card_type,
      #is_user_generated,
      content_structure,
      card_author_id, user_full_name,
      #content_status,
      email, event, shared_to_user_id,
      shared_to_group_id, platform, comment_id,
      comment_message,
      follower_id, followed_user_id,
      shared_to_user_full_name,
      following_user_full_name,
      follower_user_full_name,
      shared_to_group_name,
      card_author_full_name,
      comment_status,
      time_account_created_raw, sign_in_count,
      user_account_status, excluded_from_leaderboard,
      duration_seconds, duration_hhmm, ecl_id,
      ecl_source_name, card_subtype, card_resource_url,
     # is_card_promoted,
    is_public,
    #is_livestream,
    assigned_content,
      badge_id, badge_title, badge_type,



      referer,
      ]
}


    #  ecl_source_name,
    #  card_author_full_name,
    #  follower_user_full_name,
    #  shared_to_group_name,
    #  user_full_name,
    #  group_name,
    #  current_content_owner_full_name,
    #  following_user_full_name,
    #  shared_to_user_full_name

      #standard_card_type,
      #published_raw,
      #card_rating,
      #group_user_role,
      #time_account_suspended_raw,
      #content_completion_sync,

      #external_id,
      #card_level,
      #average_rating,
      #current_content_owner_full_nam
  }
