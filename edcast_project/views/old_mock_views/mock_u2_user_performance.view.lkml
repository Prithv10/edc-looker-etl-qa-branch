# The name of this view in Looker is "Mock U2 User Performance"
view: mock_u2_user_performance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.mock_u2_user_performance`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assigned Content" in Explore.

  dimension: assigned_content {
    type: yesno
    sql: ${TABLE}.Assigned_Content ;;
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.Average_Rating ;;
  }

  dimension: badge_id {
    type: string
    sql: ${TABLE}.Badge_ID ;;
  }

  dimension: badge_title {
    type: string
    sql: ${TABLE}.Badge_Title ;;
  }

  dimension: badge_type {
    type: string
    sql: ${TABLE}.Badge_Type ;;
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
    type: string
    sql: ${TABLE}.Card_Rating ;;
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

  dimension: comment_id {
    type: string
    sql: ${TABLE}.Comment_ID ;;
  }

  dimension: comment_message {
    type: string
    sql: ${TABLE}.Comment_Message ;;
  }

  dimension: comment_status {
    type: string
    sql: ${TABLE}.Comment_Status ;;
  }

  dimension: content_completion_sync {
    type: yesno
    sql: ${TABLE}.Content_Completion_Sync ;;
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

  #created distinct count measure by concat user id and card id
  measure: distinct_count {
    type: count_distinct
   sql: CONCAT(${TABLE}.user_id,${TABLE}.card_id) ;;
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
    type: string
    sql: ${TABLE}.Followed_User_ID ;;
  }

  dimension: follower__user_full_name_ {
    type: string
    sql: ${TABLE}.Follower__User_Full_Name_ ;;
  }

  dimension: follower_id {
    type: string
    sql: ${TABLE}.Follower_ID ;;
  }

  dimension: following__user_full_name_ {
    type: string
    sql: ${TABLE}.Following__User_Full_Name_ ;;
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

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.Performance_Metric ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
    drill_fields: [detail*]
  }

 # dimension: platform_external{
 #  case: {
   #   when: {
     #   sql: mock_u2_user_performance.platform = “EDC%” THEN 'External'
        #    mock_u2_user_performance.platform = “LRS%” THEN 'External'
          #   mock_u2_user_performance.platform = “LXP-S%” THEN 'External' ;;
     # }
     # else: "end"
  #  }
 # }




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
    sql: ${TABLE}.Published_At ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.Referer ;;
  }

  dimension: shared_to_group_id {
    type: string
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

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.Sign_In_Count ;;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.Standard_Card_Type ;;
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
    sql: ${TABLE}.Time ;;
    html: {{ rendered_value | date: "%D %r" }};;
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
    sql: ${TABLE}.Time_Account_Suspended ;;
    html: {{ rendered_value | date: "%D %r" }};;
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

measure: count_of_distinct_users_cards {
  type: count_distinct
  sql: concat(${user_id},${card_id}) ;;
  drill_fields: [detail*]
}
  measure: count_of_distinct_cards {
    type: count_distinct
    sql: ${TABLE}.card_id ;;
    drill_fields: [detail*]
  }

measure : count_of_distinct_user_ids {
  type: count_distinct
  sql: ${TABLE}.user_id ;;
  drill_fields: [detail*]
}

#Count(Distinct Concat(`User ID`,`Card ID`))


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      platform,
      card_id,
      card_state,
      card_title,
      card_type,
      is_user_generated,
      content_structure,
      card_author_id,
      user_full_name,
      content_status,
      user_id,
      email,
      time_raw,
      event,
    shared_to_user_id,
    shared_to_group_id,
    performance_metric,
    comment_id,
    comment_message,follower_id,
    followed_user_id,
  shared_to_user_full_name,
  following__user_full_name_,
  follower__user_full_name_,
  shared_to_group_name,

      card_author_full_name,
      comment_status,
      time_account_created_raw,
      sign_in_count,
      user_account_status,
      excluded_from_leaderboard,
      card_resource_url,
      duration__hh_mm_,duration__seconds_,
      ecl_id,
      is_card_promoted,
      ecl_source_name,
      is_public_,
      card_subtype,is_live_stream,
      assigned_content,badge_id,
      badge_title,badge_type,
      standard_card_type,
      published_raw,card_rating,time_account_suspended_raw,content_completion_sync,
      referer,external_id,average_rating,card_level,current_content_owner_full_name,

    ]
  }
}
