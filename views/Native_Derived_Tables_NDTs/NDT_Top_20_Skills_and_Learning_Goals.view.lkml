

view: derived_table_using_explore_source_top_20_skills_and_learning_goals_group_step1 {
  derived_table: {
    explore_source: g3_groups_skills_learninggoals_vw {
      column: count {}
      column: topic_label { field: g3_groups_skills_learninggoals_vw.topic_label }
      filters: [g3_groups_skills_learninggoals_vw.topic_label: "-NULL,-*"]
    }
  }

  dimension: count {
    label: "Group Data Count"
    description: ""
    type: number
  }

  dimension: topic_label {
    description: ""
  }

}

view: derived_table_using_explore_source_top_20_skills_and_learning_goals_group_step2 {
  derived_table: {
    sql:
      select count, topic_label,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${derived_table_using_explore_source_top_20_skills_and_learning_goals_group_step1.SQL_TABLE_NAME} ;;
  }

  dimension: count {
    type: number
  }

  dimension: topic_label {
    type: string
  }

  dimension: rank_step2 {
    type: number
  }
}
