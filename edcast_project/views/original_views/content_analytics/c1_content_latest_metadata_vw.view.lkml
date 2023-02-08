# The name of this view in Looker is "C1 Content Latest Metadata Vw"
view: c1_content_latest_metadata_vw {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
#<<<<<<< HEAD
  sql_table_name: `{{_user_attributes['database']}}.c1_content_latest_metadata_vw`;;

#>>>>>>> branch 'master' of git@github.com:edcast/edc-looker.git
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Author ID" in Explore.

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
  }

  dimension: average_rating {
    type: number
    sql: ${TABLE}.average_rating ;;
  }

  dimension: card_author_full_name {
    type: string
    sql: ${TABLE}.card_author_full_name ;;
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

  dimension: content_structure {
    type: string
    sql: ${TABLE}.content_structure ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

# dimension added on 2/09/2022 ********************************** after the data team resolved the issue
  # dimension: is_card_promoted {
  #   type: number
  #   sql: ${TABLE}.is_card_promoted ;;
  # }

  # dimension: is_live_stream {
  #   type: number
  #   sql: ${TABLE}.is_live_stream ;;
  # }

  # dimension: is_user_generated {
  #   type: number
  #   sql: ${TABLE}.is_user_generated ;;
  # }

  # dimension: content_status {
  #   type: string
  #   sql: ${TABLE}.content_status ;;
  # }

  dimension: current_content_owner_full_name {
    type: string
    sql: ${TABLE}.current_content_owner_full_name ;;
  }

  dimension: duration_hhmm {
    type: string
    sql: ${TABLE}.Duration_HHMM ;;
  }

  dimension: duration_seconds {
    type: number
    sql: ${TABLE}.Duration_seconds ;;
  }

  dimension: deep_link {
    type: string
    sql: concat("greenhouseportal.edcast.com/insights/ECL-",${ecl_id}) ;;
  }
#***********************************************************************************

  dimension: ecl_id {
    type: string
    sql: ${TABLE}.ecl_id ;;
  }

  dimension: ecl_source_name {
    type: string
    sql: ${TABLE}.ecl_source_name ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
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

  dimension_group: published_year {
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
    #html: {{ rendered_value | date: "%D %r" }};;
  }

  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
    html: {{ rendered_value | date: "%D %r" }};;
  }

 #**********************************************************************************************************
    #CONCAT('wiseup.edcast.com/insights/ECL-',`ECL ID`)
  dimension: concat_email_and_ECL_ID {
    type: string
    sql: concat('wiseup.edcast.com/insights/ECL-',${TABLE}.ecl_id) ;;
   # drill_fields: [detail*]
  }


# A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: total_duration_seconds {
    type: sum
    sql: ${duration_seconds} ;;
    drill_fields: [details*]
  }

  measure: average_duration_seconds {
    type: average
    sql: ${duration_seconds} ;;
    drill_fields: [details*]
  }

 #**********************************************************************************************************

  measure: count {
    type: count
    drill_fields: [details*]
  }

  measure: count_card_id {
    type: number
    sql: count(${TABLE}.card_id) ;;
  }

measure: count_distinct_card_id {
  type: count_distinct
  sql: ${TABLE}.card_id ;;
}
measure: is_user_generated {
  type: sum
  sql:   CASE WHEN ${TABLE}.ecl_source_name = 'User Generated Content' THEN 1 ELSE NULL END ;;
  drill_fields: [details*]
}
  set: details {
    fields: [standard_card_type, card_id,card_resource_url,card_state,card_subtype,card_type,ecl_id,
      ecl_source_name,
    #  is_card_promoted,is_live_stream,
      is_public,
      #is_user_generated,
      content_structure,author_id,
    #  content_status,
      card_author_full_name,duration_seconds,duration_hhmm,published_raw,created_raw,
      updated_raw,card_level,average_rating,
    #  current_content_owner_full_name,
      card_title]
  }
}
