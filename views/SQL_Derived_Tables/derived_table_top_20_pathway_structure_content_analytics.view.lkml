view: derived_table_top_20_pathway_structure_content_analytics {
 derived_table: {
  sql: SELECT pathway_title,
            count(pathway_title) AS count_PT,
                    RANK () OVER  (ORDER BY count(pathway_title) DESC) AS rank
              FROM g3_groups_structured_content_performance_data_explorer_vw
              group by 1
              ORDER BY 2 DESC
         ;;
}

dimension: pathway_title {
  type: string
  sql: trim(${TABLE}.pathway_title) ;;
  primary_key: yes
}


measure: count_PT {
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
  fields: [pathway_title, rank]
}
}
