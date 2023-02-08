# The name of this view in Looker is "Badges Dim M V"
view: badges_dim_m_v {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gcp-us-central-1-qa-04-323821.edc_qa_analytics_customer_100006.badges_dim_m_v`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Day" in Explore.

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}.hour ;;
  }

  dimension: image_content_type {
    type: string
    sql: ${TABLE}.image_content_type ;;
  }

  dimension: image_file_name {
    type: string
    sql: ${TABLE}.image_file_name ;;
  }

  dimension: image_file_size {
    type: number
    sql: ${TABLE}.image_file_size ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_image_file_size {
    type: sum
    sql: ${image_file_size} ;;
  }

  measure: average_image_file_size {
    type: average
    sql: ${image_file_size} ;;
  }

  dimension: image_original_url {
    type: string
    sql: ${TABLE}.image_original_url ;;
  }

  dimension: image_social_content_type {
    type: string
    sql: ${TABLE}.image_social_content_type ;;
  }

  dimension: image_social_file_name {
    type: string
    sql: ${TABLE}.image_social_file_name ;;
  }

  dimension: image_social_file_size {
    type: number
    sql: ${TABLE}.image_social_file_size ;;
  }

  dimension_group: image_social_updated {
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
    sql: ${TABLE}.image_social_updated_at ;;
  }

  dimension_group: image_updated {
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
    sql: ${TABLE}.image_updated_at ;;
  }

  dimension: is_default {
    type: yesno
    sql: ${TABLE}.is_default ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: org_id_s {
    type: number
    value_format_name: id
    sql: ${TABLE}.org_id_s ;;
  }

  dimension: record_insert_time {
    type: string
    sql: ${TABLE}.record_insert_time ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated_at {
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
  }

  dimension: yr {
    type: string
    sql: ${TABLE}.yr ;;
  }

  measure: count {
    type: count
    drill_fields: [id, image_social_file_name, image_file_name]
  }
}
