view: derived_table_Top_10_Skills_Added_by_Users {

  derived_table: {
    sql: SELECT skill_name,
            count(skill_name) AS count_SN,
                    ROW_NUMBER () OVER  (ORDER BY coalesce(count(skill_name)) DESC) AS rank
              FROM u1_users_skills_vw
              group by 1
              ORDER BY 3 DESC
         ;;
  }

  dimension: skill_name {
    type: string
    sql: trim(${TABLE}.skill_name) ;;
    primary_key: yes
  }

  measure: count_SN {
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
    fields: [skill_name, rank]
  }
}
