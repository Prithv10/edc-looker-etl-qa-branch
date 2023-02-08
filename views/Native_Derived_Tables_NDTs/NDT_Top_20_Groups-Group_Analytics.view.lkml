view: ndt_top_20_groups_step1 {
  derived_table: {
    explore_source: g3_groups_performance_data_explorer_vw {
      column: count {}
      column: group_name { field: g3_groups_performance_data_explorer_vw.group_name }
      filters: [g3_groups_performance_data_explorer_vw.group_name: "-NULL"]
    }
  }

  dimension: count {
    label: "Group Data Count"
    description: ""
    type: number
  }

  dimension: group_name {
    description: ""
  }

}

view: ndt_top_20_groups_step2 {
  derived_table: {
    sql:
      select count, group_name,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${ndt_top_20_groups_step1.SQL_TABLE_NAME} ;;
  }

  dimension: count {
    type: number
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.Group_Name ;;
  }

  dimension: rank_step2 {
    type: number
  }
}
