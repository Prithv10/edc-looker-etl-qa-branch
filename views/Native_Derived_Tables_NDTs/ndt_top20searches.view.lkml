view: derived_table_using_explore_source_top_20_searches_step1 {
  derived_table: {
    explore_source: se1_searches_search_user_details {
      column: count {}
      column: search_query { field: se1_searches_search_user_details.search_query }
      filters: [se1_searches_search_user_details.search_query: "-NULL,-*"]
    }
  }

  dimension: count {
    label: "Search Data Count"
    description: ""
    type: number
  }

  dimension: search_query {
    description: ""
  }

}

view: derived_table_using_explore_source_top_20_searches_step2 {
  derived_table: {
    sql:
      select count, search_query,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${derived_table_using_explore_source_top_20_searches_step1.SQL_TABLE_NAME} ;;
  }

  dimension: count {
    type: number
  }

  dimension: search_query {
    type: string
  }

  dimension: rank_step2 {
    type: number
  }
}
