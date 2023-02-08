view: derived_table_top_20_groups_group_analytics {

  derived_table: {
    sql: SELECT group_name,
          count(group_name) AS count_GN ,
                  RANK () OVER  (ORDER BY count(group_name) DESC) AS rank
            FROM g3_groups_performance_data_explorer_vw
            group by 1
            ORDER BY 2 DESC
       ;;
  }

  dimension: group_name {
    type: string
    sql: trim(${TABLE}.group_name) ;;
    primary_key: yes
  }

  measure: count_GN {
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
    fields: [group_name, rank]
  }
}
