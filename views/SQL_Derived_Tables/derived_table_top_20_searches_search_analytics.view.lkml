view: derived_table_top_20_searches_search_analytics {
  derived_table: {
    sql: SELECT search_query,
    coalesce(count(search_query)) AS count_SQ ,
            ROW_NUMBER () OVER  (ORDER BY coalesce(count(search_query)) DESC) AS rank
      FROM se1_searches_search_user_details
      group by 1
      ORDER BY 2 DESC
 ;;

  }

  dimension: search_query {
    type: string
    sql: trim(${TABLE}.search_query) ;;
    primary_key: yes

  }

measure: count_SQ {
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
    fields: [search_query, rank]
  }
}
