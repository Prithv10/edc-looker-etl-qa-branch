view: derived_table_using_explore_source_top_10_content_step1 {
  derived_table: {
    explore_source: u2_users_performance_part5_final_results_vw {
      column: count {}
      column: card_title { field: u2_users_performance_part5_final_results_vw.card_title }
      filters: [u2_users_performance_part5_final_results_vw.card_title: "-NULL,-*"]
    }
  }

  dimension: count {
    label: "Content Data Count"
    description: ""
    type: number
  }

  dimension: card_title {
    description: ""
  }

}

view: derived_table_using_sql_top_10_content_step2 {
  derived_table: {
    sql:
      select count, card_title,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${derived_table_using_explore_source_top_10_content_step1.SQL_TABLE_NAME} ;;
  }

  dimension: count {
    type: number
  }

  dimension: card_title {
    type: string
  }

  dimension: rank_step2 {
    type: number
  }
}
