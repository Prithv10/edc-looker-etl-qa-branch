view: derived_table_performance_drill_down_by_carousel_structured_content {

    derived_table: {
      sql: SELECT carousel_name,
            count(carousel_name) AS count_CN ,
                    RANK () OVER  (ORDER BY count(carousel_name) DESC) AS rank
              FROM g3_groups_structured_content_performance_data_explorer_vw
              group by 1
              ORDER BY 2 DESC
         ;;
    }

    dimension: carousel_name {
      type: string
      sql: trim(${TABLE}.carousel_name) ;;
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
      fields: [carousel_name, rank]
    }
  }
