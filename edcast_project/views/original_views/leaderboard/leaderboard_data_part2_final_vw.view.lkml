# The name of this view in Looker is "Leaderboard Data Part2 Final Vw"
view: leaderboard_data_part2_final_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.leaderboard_data_part2_final_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.leaderboard_data_part2_final_vw`
  ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: group_user_role {
    type: string
    sql: ${TABLE}.group_user_role ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  #  drill_fields: [details*]
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_score {
    type: sum
    sql: ${score} ;;
    drill_fields: [details*]
  }

  measure: average_score {
    type: average
    sql: ${score} ;;
  }

  dimension: score_total {
    type: number
    sql: ${TABLE}.score_total ;;
    drill_fields: [details*]
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  dimension: skill {
    type: string
    sql: ${TABLE}.Skill ;;
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
  }

  dimension: user_account_status {
    type: string
    sql: ${TABLE}.user_account_status ;;
  }

  dimension: user_full_name {
    type: string
    sql: ${TABLE}.user_full_name ;;
  }

  dimension: user_group_combined {
    type: string
    sql: ${TABLE}.user_group_combined ;;
  }

  dimension: user_group_distinct_count {
    type: number
    sql: ${TABLE}.user_group_distinct_count ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_skills_combined {
    type: string
    sql: ${TABLE}.user_skills_combined ;;
  }

  dimension: user_skills_distinct_count {
    type: number
    sql: ${TABLE}.user_skills_distinct_count ;;
  }






  #Custom Dimensions
  #CONCAT(`User Full Name`,' (',`User ID`,')')
  dimension: user_name_and_id{
  type: string
  sql: concat(${user_full_name},' (',${user_id},')') ;;
  }


# <<<<<<< HEAD
# dimension: is_org_email_contains {
#   type: yesno
#   sql: contains(${email},"@edcast.com") ;;

# }
# =======
# dimension: is_org_email {
#   type: string
#   sql:  CASE WHEN ${TABLE}.email LIKE %'@edcast.com'% THEN 'Yes' ELSE 'No' END ;;
# }

  dimension: is_org_email {
    type: string
    sql:  CASE WHEN INSTR(${TABLE}.email,'@edcast.com')>0 THEN 'Yes' ELSE 'No' END ;;
  }

#>>>>>>> branch 'master' of git@github.com:edcast/edc-looker.git


  # dimension: is_org_email {
  #   type: string
  #   # example #contains(${view_name.field},"TOSTAO")
  #   #  sql: case when position(${email},"@edcast.com" )>0 then "Yes" else "No" end;;
  #   sql: if  (position(${email},"@edcast.com" )>0, "Yes", "No");;
  # }


  measure: count {
    type: count
    drill_fields: [details*]
  }

#custom measure - count of group names
  measure: count_groups {
    type: count_distinct
    sql: ${TABLE}.group_name ;;
    drill_fields: [details*]
  }

#custom measure - count of skill names
  measure: count_skills {
    type: count_distinct
    sql: ${TABLE}.skill;;
    drill_fields: [details*]
  }

  #created the measures for score overall
  measure: score_overall{
    type: max
    sql: ${TABLE}.score_total ;;
    drill_fields: [details*]
  }
#score beast

# SUM(`score`) /
# (
# case when (COUNT(DISTINCT CONCAT(`Skill`, `User ID`))) <=0
# then 1 else
# COUNT(DISTINCT CONCAT(`Skill`, `User ID`))
# end
# *
# case when (COUNT(DISTINCT CONCAT(`Group Name`, `User ID`))) <=0
# then 1 else
# COUNT(DISTINCT CONCAT(`Group Name`, `User ID`))
# end

# )
measure: max_score_total {
  type: max
  sql: ${TABLE}.score_total ;;
  drill_fields: [details*]
}
measure: count_distinct_skill_userid {
  type: count_distinct
  sql: concat(${skill},${user_id}) ;;
  drill_fields: [details*]
 # hidden: yes
}

  measure: count_distinct_skill_userid_part {
    type: number
    sql: case when ${count_distinct_skill_userid} <=0 then 1 else ${count_distinct_skill_userid} end;;
    hidden: yes
  }

measure: count_distinct_group_userid {
  type: count_distinct
  sql: concat(${group_name},${user_id}) ;;
  drill_fields: [details*]
#  hidden: yes
}

  measure: count_distinct_group_userid_part {
    type: number
    sql: case when ${count_distinct_group_userid} <=0 then 1 else ${count_distinct_group_userid} end;;
    hidden: yes
  }

measure: score_beast {
  type: number
  sql: ${total_score} / ( ${count_distinct_skill_userid_part} * ${count_distinct_group_userid_part});;
  drill_fields: [details*]
}

 # measure: is_org_email?{

  #  sql:CASE
   # when INSTR(email,'@edcast.com')>0 then 'Yes' else 'No' end ;;
  #  drill_fields: [group_name, user_full_name]
 # }
set: details {
  fields: [is_org_email,excluded_from_leaderboard,user_account_status,user_name_and_id,score_total,user_id,score,date_raw,skill,user_skills_combined,
    user_skills_distinct_count,group_name,group_user_role,user_group_combined,user_group_distinct_count,user_full_name,email,time_account_created_raw,
    sign_in_count,time_account_suspended_raw]
}

}
