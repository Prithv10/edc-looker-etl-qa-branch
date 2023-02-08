view: derived_table_top_20_content_filter_group_group_analytics {


    derived_table: {
      sql: SELECT card_title,
          count(card_title) AS count_CT ,
                  RANK () OVER  (ORDER BY count(card_title) DESC) AS rank
            FROM g3_groups_performance_data_explorer_vw
            group by 1
            ORDER BY 2 DESC
       ;;
    }

    dimension: card_title {
      type: string
      sql: trim(${TABLE}.card_title) ;;
      primary_key: yes
    }

    measure: count_CT {
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
      fields: [card_title, rank]
    }
  }
