view: derived_table_top_20_channels_channel_analytics {

    derived_table: {
      sql: SELECT channel_name,
            count(channel_name) AS count_CN,
                    RANK () OVER  (ORDER BY count(channel_name) DESC) AS rank
              FROM ch2_channel_performance_part2_final_results_vw
              group by 1
              ORDER BY 3 DESC
         ;;
    }

  dimension: channel_name {
    type: string
    sql: trim(${TABLE}.channel_name) ;;
    primary_key: yes
  }

  measure: count_CN {
    type: count
    # sql: ${TABLE}.search_query;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }





  set: detail {
    fields: [channel_name, rank]
  }
}
