
  view: derived_table_using_explore_source_top_20_channels_step1 {
    derived_table: {
      explore_source: ch2_channel_performance_part2_final_results_vw {
        column: count {}
        column: channel_name { field: ch2_channel_performance_part2_final_results_vw.channel_name }
        filters: [ch2_channel_performance_part2_final_results_vw.channel_name: "-NULL"]
      }
    }

    dimension: count {
      label: "Channel Data Count"
      description: ""
      type: number
    }

    dimension: channel_name {
      description: ""
    }

  }

  view: derived_table_using_sql_top_20_channels_step2 {
    derived_table: {
      sql:
      select count, channel_name,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${derived_table_using_explore_source_top_20_channels_step1.SQL_TABLE_NAME} ;;
    }

    dimension: count {
      type: number
    }

    dimension: channel_name {
      type: string
    }

    dimension: rank_step2 {
      type: number
    }
  }
