view: derived_table_top_20_skills_and_learning_goals_user_analytics {
  derived_table: {
    sql: SELECT topic_label,
            count(topic_label) AS count_TL ,
                    RANK () OVER  (ORDER BY count(topic_label) DESC) AS rank
              FROM u2_users_skills_learninggoals_vw
              group by 1
              ORDER BY 2 DESC
         ;;
  }

  dimension: topic_label {
    type: string
    sql: trim(${TABLE}.topic_label) ;;
    primary_key: yes
  }

  measure: count_TL {
    type: count

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
    fields: [topic_label, rank]
  }
}
