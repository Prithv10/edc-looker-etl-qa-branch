

view: derived_table_using_explore_source_Performance_Drill_Down_By_Carousel_structured_content_step1 {
  derived_table: {
    explore_source: g3_groups_structured_content_performance_data_explorer_vw {
      column: count {}
      column: carousel_name { field: g3_groups_structured_content_performance_data_explorer_vw.carousel_name }
      filters: [g3_groups_structured_content_performance_data_explorer_vw.channel_name: "-NULL"]
    }
  }

  dimension: count {
    label: "Carousel Data Count"
    description: ""
    type: number
  }

  dimension: carousel_name {
    description: ""
  }

}

view: derived_table_using_sql_Performance_Drill_Down_By_Carousel_structured_content_step2 {
  derived_table: {
    sql:
      select count, carousel_name,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${derived_table_using_explore_source_Performance_Drill_Down_By_Carousel_structured_content_step1.SQL_TABLE_NAME} ;;
  }

  dimension: count {
    type: number
  }

  dimension: carousel_name {
    type: string
  }

  dimension: rank_step2 {
    type: number
  }
}
