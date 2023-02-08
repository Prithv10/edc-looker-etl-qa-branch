# The name of this view in Looker is "U2 Users Performance Part5 Final Results Vw"
view: u2_users_performance_part5_final_results_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u2_users_performance_part5_final_results_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.u2_users_performance_part5_final_results_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assigned Content" in Explore.

dimension: primary_key {
  primary_key: yes
  sql: concat(${TABLE}.user_id,${TABLE}.card_id,${TABLE}.performance_metric,${TABLE}.Time) ;;
}

  dimension: assigned_content {
    type: string
    sql: ${TABLE}.assigned_content ;;
   # drill_fields: [detail*]
  }

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
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
  #  drill_fields: [detail*]
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
  #  drill_fields: [detail*]
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
   # drill_fields: [detail*]
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
 #   drill_fields: [detail*]
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
  #  drill_fields: [detail*]
  }

  dimension: card_rating {
    type: number
    sql: ${TABLE}.card_rating ;;
 #   drill_fields: [detail*]
  }

  dimension: card_resource_url {
    type: number
    sql: ${TABLE}.card_resource_url ;;
 #   drill_fields: [detail*]
  }
#donot remove.custom dimension created based on this
   dimension: card_resource_url_1 {
     type: string
    sql: cast(${card_resource_url} as string) ;;
    hidden: yes
   }

  dimension: card_state {
    type: string
    sql: ${TABLE}.card_state ;;
 #   drill_fields: [detail*]
  }

  dimension: card_subtype {
    type: string
    sql: ${TABLE}.card_subtype ;;
  #  drill_fields: [detail*]
  }

  dimension: card_title {
    type: string
    sql: ${TABLE}.card_title ;;
 #   drill_fields: [detail*]
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
 #   drill_fields: [detail*]
  }

  dimension: comment_id {
    type: number
    sql: ${TABLE}.comment_id ;;
  #  drill_fields: [detail*]
  }

  dimension: comment_message {
    type: string
    sql: ${TABLE}.comment_message ;;
 #   drill_fields: [detail*]
  }

  dimension: comment_status {
    type: string
    sql: ${TABLE}.comment_status ;;
  #  drill_fields: [detail*]
  }

  dimension: content_completion_sync {
    type: string
    sql: ${TABLE}.content_completion_sync ;;
  #  drill_fields: [detail*]
  }

 # dimension: content_status {
#    type: number
#    sql: ${TABLE}.content_status ;;
#    drill_fields: [detail*]
# }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  #  drill_fields: [detail*]
  }

  dimension: current_content_owner_full_name {
    type: number
    sql: ${TABLE}.current_content_owner_full_name ;;
  #  drill_fields: [detail*]
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.Duration_HHMM ;;
   # drill_fields: [detail*]
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.Duration_seconds ;;
 #   drill_fields: [detail*]
  }



  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
#    drill_fields: [detail*]
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
  #  drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  #  drill_fields: [detail*]
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

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
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
  #  drill_fields: [detail*]
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
  #  drill_fields: [detail*]
  }

  dimension: following_user_full_name {
    type: string
    sql: ${TABLE}.following_user_full_name ;;
  #  drill_fields: [detail*]
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
#    drill_fields: [detail*]
  }

 # dimension: is_card_promoted {
#    type: number
#    sql: ${TABLE}.is_card_promoted ;;
  #  drill_fields: [detail*]
#  }

 # dimension: is_livestream {
  #  type: number
  #  sql: ${TABLE}.is_livestream ;;
 #   drill_fields: [detail*]
#  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
 #   drill_fields: [detail*]
  }

 # dimension: is_user_generated {
#    type: number
#    sql: ${TABLE}.is_user_generated ;;
 #   drill_fields: [detail*]
 # }

  dimension: performance_metric {
    type: string
    sql: ${TABLE}.performance_metric ;;
#   drill_fields: [detail*]
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
#    drill_fields: [detail*]
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
    sql: ${TABLE}.published_at ;;
    html: {{ rendered_value | date: "%D %r" }};;
#    drill_fields: [detail*]
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
 #   drill_fields: [detail*]
  }

  dimension: shared_to_group_id {
    type: number
    sql: ${TABLE}.shared_to_group_id ;;
 #   drill_fields: [detail*]
  }

  dimension: shared_to_group_name {
    type: string
    sql: ${TABLE}.shared_to_group_name ;;
 #   drill_fields: [detail*]
  }

  dimension: shared_to_user_full_name {
    type: string
    sql: ${TABLE}.shared_to_user_full_name ;;
 #   drill_fields: [detail*]
  }

  dimension: shared_to_user_id {
    type: number
    sql: ${TABLE}.shared_to_user_id ;;
  #  drill_fields: [detail*]
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
#    drill_fields: [detail*]
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
 #   drill_fields: [detail*]
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
      quarter_of_year,
      year
    ]
    sql: ${TABLE}.Time ;;
    html: {{ rendered_value | date: "%D %r" }};;
  #  drill_fields: [detail*]
  }
 dimension: time_year_quarter {
   type: string
  sql: concat(${time_year},"-",${time_quarter_of_year}) ;;
 }
#DATE_FORMAT(`time`,'%M')

dimension: time_week_with_format {
  type: date
  sql: ${time_week};;
  html: {{ rendered_value | date: "Week-%U %Y"}} ;;
}

dimension: time_date_without_timestamp {
  type: date
  sql: ${TABLE}.Time  ;;
}
  dimension: time_month_string {
    type: string
    sql: ${time_month} ;;
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
#    drill_fields: [detail*]
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
#    drill_fields: [detail*]
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
#    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
 #   drill_fields: [detail*]
  }
#custom dimension

  dimension: source {
    type: string
    sql: case
     when (${card_resource_url_1} = "%myhbp%") then "Harvard"
     when (${card_resource_url_1} = "%hbs.edu%") then "Harvard"
     when (${card_resource_url_1} = "%udemy%") then "Udemy"
     when (${card_resource_url_1} = "%Pluralsight%") then "Pluralsight"
     when (${card_resource_url_1} =  "%ELNLearningSiteSSO%") then "DDI, Other"
     else "EDJ"
    end ;;

  }

  dimension: time_bucket {
    type: string
    sql: case
    when (((${TABLE}.time) >= ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), MONTH)), INTERVAL -12 MONTH)))) AND
    (${TABLE}.time) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), MONTH)), INTERVAL -12 MONTH))), INTERVAL 13 MONTH)))))) THEN
    ((FORMAT_TIMESTAMP('%Y-%m', u2_users_performance_part5_final_results_vw.Time )))
   ELSE CASE WHEN (((${TABLE}.time) >= ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), MONTH)), INTERVAL -12 MONTH)))) AND (u2_users_performance_part5_final_results_vw.Time) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), MONTH)), INTERVAL -12 MONTH))), INTERVAL 13 MONTH)))))) THEN 'Previous 12 Months' ELSE 'Other' END
    end ;;
  }




  # Need to Delete
  #. case(when(${past_12_months} = "Previous 12 Months",${u2_users_performance_part5_final_results_vw.time_month_string}),${past_12_months})

  # dimension: time_bucket {
  #   type: string
  #   sql: case
  #         when (${past_12_months} = 'Previous 12 Months') then '${u2_users_performance_part5_final_results_vw.time_month_string})
  #         else '${past_12_months})'
  #         end ;;
  # }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

#custom measures

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count_of_content_structure {
    type: number
    sql: count(${content_structure}) ;;
    #   drill_fields: [detail*]
  }

  measure: count_of_card_type {
    type: number
    sql: count(${card_type}) ;;
    #   drill_fields: [detail*]
  }

  measure: count_of_card_author_full_name {
    type: number
    sql: count(${card_author_full_name}) ;;
    #   drill_fields: [detail*]
  }

  measure: count_of_user_full_name {
    type: number
    sql: count(${user_full_name}) ;;
    #   drill_fields: [detail*]
  }

 measure: count_of_duration_seconds {
    type: number
    sql: count(${duration_seconds}) ;;
    #   drill_fields: [detail*]
  }

  measure: count_of_time {
    type: number
    sql: count(${time_date}) ;;
    #   drill_fields: [detail*]
  }

  measure: count_of_duration_hhmm {
    type: number
    sql: count(${duration_hhmm}) ;;
    #   drill_fields: [detail*]
  }


  measure: count_of_ecl_source_name {
    type: number
    sql: count(${ecl_source_name}) ;;
    #   drill_fields: [detail*]
  }

 measure: total_duration_seconds {
    type: sum
    sql: ${duration_seconds} ;;
#    drill_fields: [detail*]
  }

  measure: average_duration_seconds {
    type: average
    sql: ${duration_seconds} ;;
    #   drill_fields: [detail*]
  }
measure: count_distinct_user_full_names{
  type: count_distinct
  sql: ${user_full_name} ;;
}
measure: average_hours {
  type: number
  sql: sum(${duration_seconds})/${count_distinct_user_full_names}/60/60 ;;
}
measure: total_duration_hours {
  type: sum
  sql: ${duration_seconds}/3600 ;;
}
measure: count_of_events {
  type: number
  sql: count(${TABLE}.event) ;;
  drill_fields: [detail*]
}
  measure : count_of_distinct_user_ids {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
    drill_fields: [detail*]
  }

  measure : count_of_user_ids {
    type: number
    sql: count(${user_id}) ;;
   drill_fields: [detail*]
  }

  measure : count_of_distinct_standard_card_types {
    type: count_distinct
    sql: ${TABLE}.standard_card_type ;;
    drill_fields: [detail*]
  }
  dimension: current_date {
 #   CASE WHEN MONTH(`Time`) = MONTH(CURDATE()) THEN 'CURRENT' ELSE 'NOT CURRENT' END. #extract_months(date)
type: string
sql: CASE
  WHEN ${time_month} = extract_months(now())
  THEN 'CURRENT'
  ELSE 'NOT CURRENT'
END ;;
  }

  dimension: financial_YTD_21_22 {
    type: string
    sql: CASE
WHEN ${time_date}>= '07/01/2021' AND ${time_date}<= '06/30/2022'
THEN 'YES' ELSE 'NO'
END ;;
  }

  dimension: last_month {
    #CASE WHEN DATE(`Time`) > SUBDATE(LAST_DAY(CURDATE()),INTERVAL 2 MONTH) AND DATE(`Time`) <= SUBDATE(LAST_DAY(CURDATE()),INTERVAL 1 MONTH) THEN 'INCLUDE' ELSE 'EXCLUDE' END

type:string
sql: CASE
  WHEN DATE(`Time`) > SUBDATE(LAST_DAY(CURDATE()),INTERVAL 2 MONTH)
    AND DATE(`Time`) <= SUBDATE(LAST_DAY(CURDATE()),INTERVAL 1 MONTH)
  THEN 'INCLUDE'

  ELSE 'EXCLUDE'
END ;;
}

dimension: mandatory_training_exclusion {
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
measure: duration_learning_hours {
  #SUM(`Duration (seconds)`)/3600
  type: number
  sql: sum(${duration_seconds})/3600 ;;
}

measure: count_performance_metric {
  type: number
  sql: count(${performance_metric}) ;;
  drill_fields: [detail*]
}
#Count(Distinct Concat(`User ID`,`Card ID`))
 measure: count_user_card_id {
   type: count_distinct
  sql: concat(${TABLE}.user_id,${TABLE}.card_id) ;;
  drill_fields: [detail*]
 }

dimension: learning_hours {
  type: number
  sql: ${duration_seconds}/3600 ;;
}
measure: sum_learning_hours {
  type: number
  sql: sum(${learning_hours}) ;;
  drill_fields: [detail*]
}
# in domo for platform external case when (`Platform` like 'EDC%' or `Platform` like 'LRS%' or `Platform` like 'LXP-S%') then 'External' Else `Platform` end
# created dimensionn for platform external

 dimension: platform_external{
    sql: CASE
        WHEN (`Platform` like 'EDC%' or `Platform` like 'LRS%' or `Platform` like 'LXP-S%') THEN 'External'
        Else `Platform`END ;;
    }

   #Custom Dimensions for ThermoFisher
#CONCAT('https://thermofisher.edcast.com/insights/', `Card ID`)
  dimension: card_URL_full {
    type: string
    sql: CONCAT('https://thermofisher.edcast.com/insights/', ${card_id}) ;;
  }

 #CONCAT('<a href="', 'https://thermofisher.edcast.com/insights/', `Card ID`, '" target="_blank">', `Card Title`, '</a>')
dimension: card_link {
  type: string
  sql: CONCAT('<a href="', 'https://thermofisher.edcast.com/insights/', ${card_id}, '" target="_blank">', ${card_title}, '</a>') ;;
}


#Start - MEASURES for Top 20 Users - User Analytics
measure: count_of_card_IDs {
  type: number
  sql: count(${card_id}) ;;
  drill_fields: [detail*]
}

  measure: count_of_distinct_card_IDs {
    type: count_distinct
    sql: ${card_id} ;;
    drill_fields: [detail*]
  }

measure: unique_users {
  type: count_distinct
  sql: ${TABLE}.email ;;
  drill_fields: [detail*]
}

measure: count_of_sign_ins {
  type: number
  sql: count(${sign_in_count}) ;;
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

  measure: followers_users{
    type: count
 #   sql: case when ${performance_metric} ='Followers (Users)' then 1 else 0 end ;;
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
 #   sql: case when ${performance_metric} ='CLC Badges Completed' then 1 else 0 end ;;
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
  #  sql: case when ${performance_metric} ='Total Badges Earned' then 1 else 0 end ;;
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
  #  sql: case when ${performance_metric} ='Total Ratings' then 1 else 0 end ;;
    filters: {
      field: performance_metric
      value: "Total Ratings"
    }
    drill_fields: [detail*]
  }

#  'CLC Badges Completed', 'Total Published Journeys', 'Total Published Pathways',
    #       'Total Published SmartCards', 'Total Shares to Direct Users', 'Total Shares to Groups', 'Total Unique Card Views',
    #       'Total Content Source Visits', 'Total Badges Shared','Following (Users)','Followers (Users)','Current Likes','Total Completions',
    #       'Current Bookmarks','Total Ratings','Total Completions','Total Views','Total Badges Earned','Total Comments','Total_Bookmarks'

  measure: total_events{
    type: number
    sql: ${clc_badges_completed}+${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+${total_shares_to_direct_users}+
    ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+${total_badges_earned}+${total_badges_shared}+${following_users}+
    ${followers_users}+${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
    ${total_bookmarks};;
    drill_fields: [detail*]
 }

  measure: total_bain_videos{
    type: count
       filters: {
      field: ecl_source_name
      value: "Bain Videos"
    }
    drill_fields: [detail*]
  }

  measure: total_UGC{
    type: count
    filters: {
      field: ecl_source_name
      value: "User Generated Content"
    }
    drill_fields: [detail*]
  }

  measure: total_ECLs{
    type: number
    sql: ${total_bain_videos}+${total_UGC};;
    drill_fields: [detail*]
  }

measure: total_events_ThermoFisher_Top10Content {
  type: number
  sql: ${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+${total_shares_to_direct_users}+
  ${total_unique_card_views}+${total_content_source_visits}+${current_likes}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
  ${total_bookmarks};;
  drill_fields: [detail*]
}

  measure: total_events_ThermoFisher_Top20Users{
    type: number
    sql: ${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+${total_shares_to_direct_users}+
          ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+
          ${followers_users}+${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
          ${total_bookmarks};;
    drill_fields: [detail*]
  }

  measure: total_events_EdJones_EDJ_Resources{
    type: number
    sql: ${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+${total_shares_to_direct_users}+
          ${total_unique_card_views}+${total_content_source_visits}+${current_likes}+${total_completions}+${current_bookmarks}+${total_views}+${total_comments}+
          ${total_bookmarks};;
    drill_fields: [detail*]
  }

  measure: total_events_EdJones_Top10ActiveUsers{
    type: number
    sql: ${total_unique_card_views}+${total_content_source_visits}+${current_likes}+${total_completions}+${current_bookmarks}+${total_views}+
          ${total_bookmarks};;
    drill_fields: [detail*]
  }


  #End - MEASURES for Top 20 Groups/ Content/ Users - Group Analytics
measure: total_events_TP_top20users {
  type: number
  sql:${following_users}+${followers_users} +${total_unique_card_views}+${total_views}+${total_shares_to_direct_users}+${total_completions}+${total_published_pathways}
  +${total_published_smartcards}+${current_bookmarks}+${total_bookmarks}+${total_published_journeys}+${total_shares_to_groups}+${total_ratings}+${current_likes}
  +${total_content_source_visits};;
  drill_fields: [detail*]
}

measure: total_evetns_ByteDance {
  type: number
  sql: ${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+${total_shares_to_direct_users}+
  ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+
  ${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
  ${total_bookmarks};;
  drill_fields: [detail*]
}

  measure: total_evetns_ByteDance_Top20Users{
    type: number
    sql:
    ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+${total_badges_earned}+${following_users}+
    ${followers_users}+${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
    ${total_bookmarks} ;;
    drill_fields: [detail*]
  }

  measure: total_evetns_ByteDance_Aus_Top20Users{
    type: number
    sql:${total_shares_to_direct_users}+
    ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+${total_badges_earned}+${following_users}+
    ${followers_users}+${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
    ${total_bookmarks} ;;
    drill_fields: [detail*]
  }

  measure: total_events_NSW {
    type: number
      sql: ${total_published_journeys}+${total_published_pathways}+${total_published_smartcards}+${total_shares_to_direct_users}+
            ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+${total_badges_earned}+${total_badges_shared}+${following_users}+
            ${followers_users}+${current_likes}+${total_completions}+${current_bookmarks}+${total_views}+${total_comments}+
            ${total_bookmarks};;
      drill_fields: [detail*]
    }

#custom measure for count of card title

# measure for performance metric ( Total event ) created for Aflac Customer.
  measure: total_events_Aflac{
    type: number
    sql: ${total_shares_to_direct_users}+${total_published_smartcards}+${total_comments}+${total_bookmarks}+
          ${total_unique_card_views}+${total_completions}+${total_views}+${total_content_source_visits}+
          ${current_bookmarks}+${current_likes};;
    drill_fields: [detail*]
  }
  measure: total_events_Titan{
    type: number
    sql: ${clc_badges_completed}+${total_published_smartcards}+${total_shares_to_direct_users}+
          ${total_shares_to_groups}+${total_unique_card_views}+${total_content_source_visits}+${total_badges_earned}+${total_badges_shared}+${following_users}+
          ${followers_users}+${current_likes}+${total_completions}+${current_bookmarks}+${total_ratings}+${total_views}+${total_comments}+
          ${total_bookmarks};;
    drill_fields: [detail*]
  }
#case when `Card Resource URL` like '%myhbp%' then 'Harvard'when `Card Resource URL` like '%hbs.edu%' then 'Harvard'when `Card Resource URL` like '%udemy%' then 'Udemy'when `Card Resource URL` like '%Pluralsight%' then 'Pluralsight'else 'EDJ' end


measure: distinct_count_of_card_title {
  type: count_distinct
  sql: ${TABLE}.card_title ;;
  drill_fields: [detail*]
}

  measure: count_of_card_title {
    type: number
    sql: count(${card_title}) ;;
    drill_fields: [detail*]
  }

  measure: sum_of_sign_in_count {
    type: sum
    sql: ${TABLE}.sign_in_count ;;
    drill_fields: [detail*]
  }
measure: count_distinct_emails {
  type: count_distinct
  sql: ${email} ;;
  drill_fields: [detail*]
}

measure: count_UGC {
  type: count
  filters: {
    field: ecl_source_name
    value: "User Generated Content"
  }
  drill_fields: [detail*]
  }

  measure: running_total_distinct_active_user {
    type: running_total
    sql: ${count_of_distinct_user_ids} ;;
    drill_fields: [detail*]
  }

  measure: running__totals_count_of_performance_metric {
    type: running_total
    sql: ${count_performance_metric} ;;
    drill_fields: [detail*]
  }

  measure: running__totals_count_of_events {
    type: running_total
    sql: ${count_of_events} ;;
    drill_fields: [detail*]
  }
  measure: average_of_card_rating {
      type: average
      sql: ${card_rating} ;;
    drill_fields: [detail*]
    }
measure: percetage_engaged_users{
  #COUNT(DISTINCT `User ID`)/6337
  type: number
  sql: ${count_of_distinct_user_ids}/6337 ;;
  value_format: "#0.00"
}

  measure: average_of_average_rating {
    type: average
    sql: ${average_rating} ;;
    drill_fields: [detail*]
  }

#case WHEN 'event'= 'card_marked_as_complete' THEN 'cat' END

  dimension: test_rename {
    type: string
    sql: case
           when event = '%card_marked_as_complete%' then 'cat'
            end ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      user_full_name,performance_metric,card_id,card_state,card_title,card_type,
      #is_user_generated,
      content_structure,card_author_id,
      #content_status,
      user_id,email,
      time_raw,event,shared_to_user_id,shared_to_group_id,platform,comment_id,comment_message,follower_id,followed_user_id,shared_to_user_full_name,
      follower_user_full_name,following_user_full_name,shared_to_group_name,card_author_full_name,comment_status,time_account_created_raw,sign_in_count,
      user_account_status,excluded_from_leaderboard,card_resource_url,duration_hhmm,duration_seconds,ecl_id,
      #is_card_promoted,
      ecl_source_name,is_public,card_subtype,
      #is_livestream,
      assigned_content,badge_id,badge_title,badge_type,standard_card_type,published_raw,card_rating,time_account_suspended_raw,content_completion_sync,
      referer,external_id,average_rating,card_level,current_content_owner_full_name]
  }
}
