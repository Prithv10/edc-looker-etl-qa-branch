# The name of this view in Looker is "U1 Users Live Event Cards Vw"
view: u1_users_live_event_cards_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  # sql_table_name: `gcp-us-central-1-qa-04-323821.spark_edcast_qa.u1_users_live_event_cards_vw`
  #   ;;

  sql_table_name: `{{_user_attributes['database']}}.u1_users_live_event_cards_vw`
  ;;


  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average Rating" in Explore.

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
  }

  dimension: card_author_id {
    type: number
    sql: ${TABLE}.card_author_id ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_level {
    type: string
    sql: ${TABLE}.card_level ;;
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

  dimension: conferencing_tool {
    type: string
    sql: ${TABLE}.conferencing_tool ;;
  }

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  dimension: current_content_owner_full_name {
    type: string
    sql: ${TABLE}.current_content_owner_full_name ;;
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

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: excluded_from_leaderboard {
    type: yesno
    sql: ${TABLE}.excluded_from_leaderboard ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_registration {
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
    sql: ${TABLE}.last_registration_date ;;
    html: {{ rendered_value | date: "%D %r" }};;
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
  }

  dimension: registration_limit {
    type: number
    sql: ${TABLE}.registration_limit ;;
  }

  dimension: registration_type {
    type: string
    sql: ${TABLE}.registration_type ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
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
    sql: ${TABLE}.time_account_created ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension_group: training_end {
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
    sql: ${TABLE}.training_end_date ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: training_registration_id {
    type: string
    sql: ${TABLE}.training_registration_id ;;
  }

  dimension: training_registration_state {
    type: string
    sql: ${TABLE}.training_registration_state ;;
  }

  dimension_group: training_start {
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
    sql: ${TABLE}.training_start_date ;;
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  #********************************************************************************************************
  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_rating {
    type: sum
    sql: ${average_rating} ;;
    drill_fields: [details*]
  }

  measure: average_average_rating {
    type: average
    sql: ${average_rating} ;;
    drill_fields: [details*]
  }

#***********************************************************************************************************


#created measure for registration approved******************************************************************

measure: registration_approved{
  type: sum
  sql: CASE
  WHEN (`Training_Registration_State` = 'Approved') THEN 1 else 0
  END ;;
  drill_fields: [details*]
}

#created measure for registration rejected
  measure: registration_rejected{
    type: sum
    sql: CASE
        WHEN (`Training_Registration_State` = 'Rejected') THEN 1 else 0
        END ;;
  drill_fields: [details*]
  }
#created measure for Unregistered

  measure: unregistered{
    type: sum
    sql: CASE
        WHEN (`Training_Registration_State` = 'UnRegistered') THEN 1 else 0
        END ;;

drill_fields:[details*]  }

#***********************************************************************************************
  measure: count {
    type: count
    drill_fields: [details*]
  }

  set: details
   { fields:[card_title,
      card_author_full_name,training_start_date,training_end_date,
      time_zone,registration_type,registration_limit,last_registration_date,
      card_id,time_raw,training_registration_id,event,user_id,
      card_resource_url,card_state,card_subtype,card_type,ecl_id,
      ecl_source_name,

      #is_card_promoted,
      #is_live_stream,

      is_public,

      #is_user_generated,

      content_structure,card_author_id,

      #content_status,

      user_full_name,email,time_account_created_raw,
      sign_in_count,user_account_status,
      excluded_from_leaderboard,conferencing_tool,card_level,
      average_rating,standard_card_type,published_raw,

      external_id,current_content_owner_full_name,
      ecl_source_name]

}
}
