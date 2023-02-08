# The name of this view in Looker is "G4 Groups Leaderadmin Access Group Performance Data Explorer Vw"
view: g4_groups_leaderadmin_access_group_performance_data_explorer_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aws-us-east-1-prod-01.edc_prod_analytics_customer_2014.g4_groups_leaderadmin_access_group_performance_data_explorer_vw`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Afi External ID" in Explore.

  dimension: afi_external_id {
    type: number
    sql: ${TABLE}.afi_external_id ;;
  }

  dimension: avg_rating {
    type: number
    sql: ${TABLE}.avg_rating ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_rating {
    type: sum
    sql: ${avg_rating} ;;
  }

  measure: average_avg_rating {
    type: average
    sql: ${avg_rating} ;;
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
  }

  dimension: card_author_sme {
    type: number
    sql: ${TABLE}.card_author_sme ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
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

  dimension: comment_id {
    type: number
    sql: ${TABLE}.comment_id ;;
  }

  dimension: comment_message {
    type: string
    sql: ${TABLE}.comment_message ;;
  }

  dimension: company_name {
    type: number
    sql: ${TABLE}.company_name ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  dimension: department {
    type: number
    sql: ${TABLE}.department ;;
  }

  dimension: department_function {
    type: number
    sql: ${TABLE}.department_function ;;
  }

  dimension: department_function_code {
    type: number
    sql: ${TABLE}.department_function_code ;;
  }

  dimension: department_id {
    type: number
    sql: ${TABLE}.department_id ;;
  }

  dimension: division_code {
    type: number
    sql: ${TABLE}.division_code ;;
  }

  dimension: division_name {
    type: number
    sql: ${TABLE}.division_name ;;
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

  dimension: employee_type {
    type: number
    sql: ${TABLE}.employee_type ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: followed_user_id {
    type: number
    sql: ${TABLE}.followed_user_id ;;
  }

  dimension: follower_id {
    type: number
    sql: ${TABLE}.follower_id ;;
  }

  dimension: follower_user_full_name {
    type: string
    sql: ${TABLE}.follower_user_full_name ;;
  }

  dimension: following_user_full_name {
    type: string
    sql: ${TABLE}.following_user_full_name ;;
  }

  dimension: granted_event_view_access {
    type: string
    sql: ${TABLE}.granted_event_view_access ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

  dimension: job_code {
    type: number
    sql: ${TABLE}.job_code ;;
  }

  dimension: location_code {
    type: number
    sql: ${TABLE}.location_code ;;
  }

  dimension: management_level {
    type: number
    sql: ${TABLE}.management_level ;;
  }

  dimension: manager_name {
    type: number
    sql: ${TABLE}.manager_name ;;
  }

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.performance_metric ;;
  }

  dimension: person_city {
    type: number
    sql: ${TABLE}.person_city ;;
  }

  dimension: person_state {
    type: number
    sql: ${TABLE}.person_state ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: sales_state {
    type: number
    sql: ${TABLE}.sales_state ;;
  }

  dimension: shared_to_group_id {
    type: number
    sql: ${TABLE}.shared_to_group_id ;;
  }

  dimension: shared_to_group_name {
    type: string
    sql: ${TABLE}.shared_to_group_name ;;
  }

  dimension: shared_to_user_full_name {
    type: string
    sql: ${TABLE}.shared_to_user_full_name ;;
  }

  dimension: shared_to_user_id {
    type: number
    sql: ${TABLE}.shared_to_user_id ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  dimension: sme {
    type: number
    sql: ${TABLE}.sme ;;
  }

  dimension: start_date {
    type: number
    sql: ${TABLE}.start_date ;;
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
    sql: ${TABLE}.time ;;
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
  }

  dimension: total_user_ratings {
    type: number
    sql: ${TABLE}.total_user_ratings ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  measure: distinct_active_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [detail*]
  }

  measure: distinct_count_of_event {
    type: count_distinct
    sql: ${TABLE}.event ;;
    drill_fields: [detail*]
  }

  measure: count_of_event {
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

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      ecl_source_name,
      card_author_full_name,
      follower_user_full_name,
      group_name,
      shared_to_group_name,
      user_full_name,
      company_name,
      following_user_full_name,
      shared_to_user_full_name,
      manager_name,
      division_name
    ]
  }
}
