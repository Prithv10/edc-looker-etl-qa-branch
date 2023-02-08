view: derived_table_for_top_20_journey_pathways_in_structured_content_analysis {

    derived_table: {
      sql: SELECT journey_pathway_title,
            count(journey_pathway_title) AS count_JPT,
                    RANK () OVER  (ORDER BY count(journey_pathway_title) DESC) AS rank
              FROM g3_groups_structured_content_performance_data_explorer_vw
              group by 1
              ORDER BY 2 DESC
         ;;
    }

    dimension: journey_pathway_title {
      type: string
      sql: trim(${TABLE}.Journey_pathway_title) ;;
      primary_key: yes
    }


    measure: count_JPT {
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
      fields: [journey_pathway_title, rank]
    }
  }
