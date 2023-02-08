# The name of this view in Looker is "U3 Overall Onboarding Status Part4 Final Vw"
view: u3_overall_onboarding_status_part4_final_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u3_overall_onboarding_status_part4_final_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.u3_overall_onboarding_status_part4_final_vw`
  ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: jj_email_or_not {
    label: "J&J Email or Not"
    type: string
    sql: case when ${TABLE}.email like '%its.jnj.com%' then 'J&J Email' else 'Non-J&J Email' end ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.Excluded_From_Leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: first_day_of_active_engagement {
    type: date
    sql: ${TABLE}.first_day_of_active_engagement ;;
  }

  dimension: latest_day_of_active_engagement {
    type: date
    sql: ${TABLE}.latest_day_of_active_engagement ;;
  }

  dimension: overall_onboarding_status {
    type: string
    sql: ${TABLE}.overall_onboarding_status ;;
  }

dimension: utilisation_lxp_capte {
  type: string
  sql: (CASE
when ${overall_onboarding_status} = '1: Never Signed-In, No Days of Active Engagement' then '0- Pas accédé au LXP'
when ${overall_onboarding_status} = '2: Signed-In, No Days of Active Engagement' then '1 (C) Ont accédé mais pas été actifs'
when ${total_days_of_active_engagement} = 1 then '2- (A) Actifs une fois'
when ${total_days_of_active_engagement} = 2 then '3-(P) Sont retournés (Actifs à 2 dates différentes)'
when ${total_days_of_active_engagement} > 2 then '4- (T) Retournent régulièrement (Actifs à 3 dates et +)'
END) ;;

}
  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count_of_overall_onboarding_status {
    type: count_distinct
    sql: ${overall_onboarding_status} ;;
  }

  measure: sum_of_overall_onboarding_status {
    type:number
    sql: count(${overall_onboarding_status}) ;;
  }
  measure: total_sign_in_count {
    type: sum
    sql: ${sign_in_count} ;;
  }

  measure: average_sign_in_count {
    type: average
    sql: ${sign_in_count} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension_group: time_of_first_session {
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
    sql: ${TABLE}.time_of_first_session ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: first_day_of_active_engagement {
    type: time
 #   datatype: date
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no

    sql: TIMESTAMP(${TABLE}.first_day_of_active_engagement) ;;
 #   html: {{ rendered_value | date: "%D %r" }};;
  }
  dimension_group: parsed_first_day_of_active_engagement {
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
    sql: ${TABLE}.parsed_first_day_of_active_engagement ;;
  #  html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension_group: parsed_latest_day_of_active_engagement {
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
    sql: ${TABLE}.parsed_latest_day_of_active_engagement ;;
  }

  dimension_group: latest_day_of_active_engagement {
    type: time
#datatype: date
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no

    sql: TIMESTAMP(${TABLE}.latest_day_of_active_engagement );;
    html: {{ rendered_value | date: "%D %r" }};;
    }

  dimension_group: time_of_last_session {
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
    sql: ${TABLE}.time_of_last_session ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: total_days_of_active_engagement {
    type: number
    sql: ${TABLE}.total_days_of_active_engagement ;;
  }

measure: sum_total_days_of_active_engagement {
  type: sum
  sql: ${TABLE}.total_days_of_active_engagement  ;;
}
  dimension: total_sessions {
    type: number
    sql: ${TABLE}.total_sessions ;;
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
    sql: ${TABLE}.user_id ;;
  }

#custom dimemnsion

dimension: actively_engaged_multiple_days_yesno {
  type: yesno
  sql: ${total_days_of_active_engagement}>=2 ;;
  hidden: yes

}

  dimension: actively_engaged_multiple_days {
    type: number
    sql: case when ${actively_engaged_multiple_days_yesno} then 1 else 0 end ;;
      }

  dimension: had_active_engagement_yesno {
    type: yesno
    sql: ${total_days_of_active_engagement}>=0 ;;
    hidden: yes

  }
#  (CASE when `Total Sessions` >0 AND `Time of Last Session`>='2022-07-27' then 'Has Logged In'  else 'Not Logged In' end)

  dimension: had_active_engagement {
    type: number
    sql: case when ${had_active_engagement_yesno} then 1 else 0 end ;;
  }
measure: had_active_engagement_1 {
  type: sum
  sql: case when ${had_active_engagement_yesno} then 1 else 0 end  ;;
}
  dimension: engagement_after_launch{
    type: string
    sql: CASE when ${total_sessions} >0 AND ${time_of_last_session_date}>='2022-07-27' then 'Has Logged In'  else 'Not Logged In' end;;
  }

  dimension: one_session_yesno {
    type: yesno
    sql: ${total_sessions}=1 ;;
    hidden: yes
  }


  dimension: one_session {
    type: number
    sql: case when ${one_session_yesno} then 1 else 0 end ;;
  }

  measure: one_session_1 {
    type: sum
    sql: case when ${one_session_yesno} then 1 else 0 end ;;
    drill_fields: [details*]
  }

# dimension: has_logged_in {
#   type: number
#   sql: case when ${total_sessions}>0 then 1 else 0 end ;;
# }

measure: has_logged_in_1 {
  type: sum
  sql: case when ${total_sessions}>0 then 1 else 0 end ;;
  drill_fields: [details*]
}


  dimension: multiple_sessions_yesno {
    type: yesno
    sql: ${total_sessions}>1 ;;
  }

  dimension: multiple_session {
    type: number
    sql: case when ${multiple_sessions_yesno} then 1 else 0 end ;;
  }

  measure: multiple_session_1 {
    type: sum
    sql: case when ${multiple_sessions_yesno} then 1 else 0 end ;;
    drill_fields: [details*]
  }



#Custom Measure
#(1-(COUNT(DISTINCT (CASE when `Overall Onboarding Status` = '4: Signed-In, Multiple Days of Active Engagement' then `User ID` end))/(COUNT(DISTINCT `User ID`))))*100
measure: engagement_percentage {
  type: number
  sql: (1-(COUNT(DISTINCT (CASE when ${overall_onboarding_status} = '4: Signed-In, Multiple Days of Active Engagement' then ${user_id} end))/(COUNT(DISTINCT ${user_id}))))*100 ;;
  drill_fields: [details*]
}
#custom Measure
# Distinct Active Users = COUNT(DISTINCT `User ID`)
measure: count_engagement_after_launch {
  type: number
  sql: count(${engagement_after_launch}) ;;
  drill_fields: [details*]
}
measure: count_of_external_ids {
  type: number
  sql: count(${external_id}) ;;
  drill_fields: [details*]
}

  measure: running_total_of_external_ids {
    type: running_total
    sql: count(${external_id}) ;;
    drill_fields: [details*]
  }


  measure: count_of_user_id {
    type: number
    sql: count(${user_id}) ;;
    drill_fields: [details*]
  }

measure: percent_logged_in {
  type: number
  sql: ${u3_overall_onboarding_status_part4_final_vw.count_of_time_of_last_session}/${u3_overall_onboarding_status_part4_final_vw.count_of_external_ids} ;;
  value_format_name: percent_2
  drill_fields: [details*]
}
measure:distinct_active_users  {
  type: count_distinct
  sql: ${TABLE}.user_id ;;
  drill_fields: [details*]
}

  measure: running_total_of_distinct_active_users {
    type: running_total
    sql: (${distinct_active_users}) ;;
    drill_fields: [details*]
  }
  measure: count {
    type: count
    drill_fields: [details*]
  }
#measure created for 'Engagement Index' for Zeecademy
#(count (distinct CASE when `Overall Onboarding Status`= '3: Signed-In, 1 Day of Active Engagement' then 'OK' end)
#+count (distinct CASE when `Overall Onboarding Status`= '4: Signed-In, Multiple Days of Active Engagement' then 'OK' end))
#/(count (distinct CASE when `Overall Onboarding Status`= '2: Signed-In, No Days of Active Engagement' then 'OK' end)
#+ count (distinct CASE when `Overall Onboarding Status`= '3: Signed-In, 1 Day of Active Engagement' then 'OK' end)
#+ count (distinct CASE when `Overall Onboarding Status`= '4: Signed-In, Multiple Days of Active Engagement' then 'OK' end))
  # measure: engagement_index_status_2 {
  #   type: count_distinct
  #   hidden: yes
  #   filters: {
  #     field: overall_onboarding_status
  #     value: "2: Signed-In, No Days of Active Engagement"
  #   }
  # }
  # measure: engagement_index_status_3 {
  #   type: count_distinct
  #   hidden: yes
  #   filters: {
  #     field: overall_onboarding_status
  #     value: "3: Signed-In, 1 Day of Active Engagement"
  #   }
  # }
  # measure: engagement_index_status_4 {
  #   type: count_distinct
  #   hidden: yes
  #   filters: {
  #     field: overall_onboarding_status
  #     value: "4: Signed-In, Multiple Days of Active Engagement"
  #   }
  # }

measure: engagement_index {
  type: number
  sql: (count (distinct CASE when `overall_onboarding_status`= '3: Signed-In, 1 Day of Active Engagement' then 'OK' end)
+count (distinct CASE when `overall_onboarding_status`= '4: Signed-In, Multiple Days of Active Engagement' then 'OK' end))
/(count (distinct CASE when `overall_onboarding_status`= '2: Signed-In, No Days of Active Engagement' then 'OK' end)
+ count (distinct CASE when `overall_onboarding_status`= '3: Signed-In, 1 Day of Active Engagement' then 'OK' end)
+ count (distinct CASE when `overall_onboarding_status`= '4: Signed-In, Multiple Days of Active Engagement' then 'OK' end));;
drill_fields: [details*]
  # ${engagement_index_status_3}+${engagement_index_status_4}/${engagement_index_status_2}+${engagement_index_status_3}+${engagement_index_status_4} ;;
}

# created measure for count_of_first_day_of_active_engagement - for "Nation Wide" customer
measure: count_distinct_of_first_day_of_active_engagement {
  type: count_distinct
  sql: ${TABLE}.first_day_of_active_engagement ;;
  drill_fields: [details*]
}

  measure: count_of_first_day_of_active_engagement {
    type: number
    sql: count(${TABLE}.first_day_of_active_engagement) ;;
    drill_fields: [details*]
  }


measure: count_of_time_of_last_session {
  type: number
  sql: count(${time_of_last_session_date}) ;;
  drill_fields: [details*]
}


  measure: running_total_of_time_of_last_session {
    type: running_total
    sql: count(${time_of_last_session_date}) ;;
    drill_fields: [details*]
  }

  measure: running_total_actively_engaged_multiple_days {
    type: running_total
    sql: sum( case when ${total_days_of_active_engagement}>=2 then 1 else 0 end) ;;
    drill_fields: [details*]
  }

  measure: running_total_had_active_engagement {
    type: running_total
    sql: sum(case when ${total_days_of_active_engagement}>0 then 1 else 0 end) ;;
    drill_fields: [details*]
  }


  measure: count_of_time_of_first_session {
    type: number
    sql: count(${time_of_first_session_time});;
    drill_fields: [details*]
  }

measure: count_of_latest_time_of_active_engagement {
  type: number
  sql: count(${latest_day_of_active_engagement_date}) ;;
  drill_fields: [details*]
}

measure: count_of_sign_in_count {
  type: number
  sql: count(${sign_in_count}) ;;
  drill_fields: [details*]
}

#(CASE when `Sign-In Count`=0 then COUNT(`Sign-In Count`) else 0 end)

  measure: never_signed_in_user_count {
    type: number
    sql: CASE when ${sign_in_count} = 0 then count(${sign_in_count})
    else 0
    end ;;
    drill_fields: [details*]
  }


#Round(COUNT(DISTINCT (CASE when (`Overall Onboarding Status` like '1%'
# or `Overall Onboarding Status` like '2%')
# then `User ID` end)) / COUNT(DISTINCT `Email`)*100,0)

measure: count_distinct_emails {
  type: count_distinct
  sql: ${email} ;;
  drill_fields: [details*]
}

measure: not_on_platform {
  type: number
  sql: case
  when ${count_of_overall_onboarding_status} = 1 or ${count_of_overall_onboarding_status} = 2 then 1
  else 0
  end;;
}

measure: division_of_not_on_platform_vs_emails {
  type: number
  sql: (${not_on_platform}/${count_distinct_emails}) ;;
}

measure: percentage_not_on_platform {
  type: number
  sql: round(${division_of_not_on_platform_vs_emails}*100) ;;
}




measure: percent_numerator {
  type: count_distinct
  sql: CASE when ${overall_onboarding_status} = '1%' or ${overall_onboarding_status} = '2%' then 1 else 0 end ;;
}

measure: percent_denominator {
  type: count_distinct
  sql: ${user_id}*100 ;;
}

measure:percent_not_on_platform  {

  #Round(COUNT(DISTINCT (CASE when (`Overall Onboarding Status` like '1%' or `Overall Onboarding Status` like '2%') then `User ID` end)) / COUNT(DISTINCT `Email`)*100,0)
  type: number
#  sql: Round(COUNT(DISTINCT (CASE when (${overall_onboarding_status} = '1%' or ${overall_onboarding_status} = '2%') then ${user_id} end)) / COUNT(DISTINCT ${email})*100,0);;
  sql: round(${percent_numerator}/${percent_denominator},2) ;;
}

  set: details {
    fields: [overall_onboarding_status,user_id, user_full_name, email, time_account_created_month, sign_in_count,user_account_status,excluded_from_leaderboard,
     parsed_latest_day_of_active_engagement_date,total_days_of_active_engagement,parsed_first_day_of_active_engagement_date,time_of_first_session_date,time_of_last_session_date,
    total_sessions,external_id]

    }

  measure: overall_onboarding_status_count {
    type: number
    sql: count(${overall_onboarding_status}) ;;
    drill_fields: [details*]
  }
}
