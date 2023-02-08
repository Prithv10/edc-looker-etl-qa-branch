view: derived_table_top_25_channels{

  derived_table: {
    sql: SELECT channel_name,
            ROW_NUMBER () OVER
      (
      ORDER BY count(channel_name) DESC
      ) rank
      FROM {{_user_attributes['database']}}.c2_content_structure_metadata_vw
      group by 1
      order by 2 desc
      ;;
  }


  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: top_25_channels{
    hidden: yes
  type: yesno
  sql: ${TABLE}.rank <= 25;;
  }

  dimension: top_25_channel_names{
    sql: CASE WHEN ${top_25_channels} THEN ${channel_name}
    ELSE "Other"
    END;;
  # order_by_field: min_rank
    }


    measure: count {
    type: count
#    drill_fields: [detail*]
  }

measure: min_rank {
  type: min
  sql:${TABLE}.rank;;
  hidden: yes
}

}
