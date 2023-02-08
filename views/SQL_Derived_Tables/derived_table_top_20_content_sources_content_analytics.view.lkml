view: derived_table_top_20_content_sources_content_analytics {

    derived_table: {
      sql: SELECT ecl_source_name,
          count(ecl_source_name) AS count_ESN ,
                  RANK () OVER  (ORDER BY count(ecl_source_name) DESC) AS rank
            FROM u2_users_performance_part5_final_results_vw
            group by 1
            ORDER BY 2 DESC
       ;;
    }

    dimension: ecl_source_name {
      type: string
      sql: trim(${TABLE}.ecl_source_name) ;;
      primary_key: yes
    }

    measure: count_ESN {
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
      fields: [ecl_source_name, rank]
    }


  }
