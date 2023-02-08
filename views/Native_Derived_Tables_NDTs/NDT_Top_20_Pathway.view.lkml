view: ndt_top_20_pathway_step1 {
    derived_table: {
      explore_source: g3_groups_structured_content_performance_data_explorer_vw {
        column: count {}
        column: pathway_title { field: g3_groups_structured_content_performance_data_explorer_vw.pathway_title }
        filters: [g3_groups_structured_content_performance_data_explorer_vw.pathway_title: "-NULL"]
      }
    }

    dimension: count {
      label: "Pathway Data Count"
      description: ""
      type: number
    }

    dimension: pathway_title {
      description: ""
    }

  }

  view: ndt_top_20_pathway_step2 {
    derived_table: {
      sql:
      select *,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${ndt_top_20_pathway_step1.SQL_TABLE_NAME} ;;
    }

    dimension: count {
      type: number
    }

    dimension: pathway_title {
      type: string
    }

    dimension: rank_step2 {
      type: number
    }
  }
