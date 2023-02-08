view: derived_table_for_top_20_journey_structured_content_analysis {
  derived_table: {
    sql: SELECT journey_title,
            count(journey_title) AS count_JT,
                    RANK () OVER  (ORDER BY count(journey_title) DESC) AS rank
              FROM g3_groups_structured_content_performance_data_explorer_vw
              group by 1
              ORDER BY 2 DESC
         ;;
  }

  dimension: journey_title {
    type: string
    sql: trim(${TABLE}.Journey_Title) ;;
     primary_key: yes
  }


  measure: count_JT {
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
    fields: [journey_title, rank]
  }
}
