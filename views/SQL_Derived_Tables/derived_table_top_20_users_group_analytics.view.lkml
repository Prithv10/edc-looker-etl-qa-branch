view: derived_table_top_20_users_group_analytics {


  derived_table: {
    sql: SELECT user_full_name,
            count(user_full_name) AS count_UFN ,
                    RANK () OVER  (ORDER BY count(user_full_name) DESC) AS rank
              FROM g3_groups_performance_data_explorer_vw
              group by 1
              ORDER BY 2 DESC
         ;;
  }

  dimension: user_full_name {
    type: string
    sql: trim(${TABLE}.user_full_name) ;;
    primary_key: yes
  }

  measure: count_UFN {
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
    fields: [user_full_name, rank]
  }
}
