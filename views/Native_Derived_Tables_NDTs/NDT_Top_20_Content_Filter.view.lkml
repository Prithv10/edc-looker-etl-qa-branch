view: ndt_top_20_content_filter_step1 {
    derived_table: {
      explore_source: g3_groups_performance_data_explorer_vw{
        column: count {}
        column: card_title { field: g3_groups_performance_data_explorer_vw.card_title}
        filters: [g3_groups_performance_data_explorer_vw.card_title: "-NULL"]
      }
    }

    dimension: count {
      label: "Card Title Data Count"
      description: ""
      type: number
    }

    dimension: card_title {
      description: ""
    }

  }

  view: ndt_top_20_content_filter_step2 {
    derived_table: {
      sql:
      select count, card_title,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${ndt_top_20_content_filter_step1.SQL_TABLE_NAME} ;;
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
