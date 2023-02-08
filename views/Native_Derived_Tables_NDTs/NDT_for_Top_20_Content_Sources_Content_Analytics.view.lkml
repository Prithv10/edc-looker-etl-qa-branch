view: derived_table_using_explore_source_top_20_content_sources_step1 {
  derived_table: {
    explore_source: u2_users_performance_part5_final_results_vw {
      column: count {}
      column: ecl_source_name { field: u2_users_performance_part5_final_results_vw.ecl_source_name }
      filters: [u2_users_performance_part5_final_results_vw.ecl_source_name: "-NULL,-*"]
    }
  }

  dimension: count {
    label: "Content Sources Data Count"
    description: ""
    type: number
  }

  dimension: ecl_source_name {
    description: ""
  }

}

view: derived_table_using_sql_top_20_content_sources_step2 {
  derived_table: {
    sql:
      select count, ecl_source_name,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${derived_table_using_explore_source_top_20_content_sources_step1.SQL_TABLE_NAME} ;;
  }

  dimension: count {
    type: number
  }

  dimension: ecl_source_name {
    type: string
  }

  dimension: rank_step2 {
    type: number
  }
}
