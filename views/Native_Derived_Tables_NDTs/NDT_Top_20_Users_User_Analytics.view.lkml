  view: derived_table_using_explore_source_top_20_users_step1 {
    derived_table: {
      explore_source: u2_users_performance_part5_final_results_vw {
        column: count {}

        column: user_full_name { field: u2_users_performance_part5_final_results_vw.user_full_name }
        #filters: [u2_users_performance_part5_final_results_vw.user_full_name: "-NULL,-*"]
      }
    }

    dimension: count {
      label: "User Data Count"
      description: ""
      type: number
    }


    dimension: user_full_name {
      description: ""
    }


  }

  view: derived_table_using_explore_source_top_20_users_step2 {
    derived_table: {
      sql:
      select count, user_full_name,
      ROW_NUMBER () OVER(ORDER BY count DESC) as rank_step2
      from ${derived_table_using_explore_source_top_20_users_step1.SQL_TABLE_NAME} ;;
    }

    dimension: count {
      type: number
    }


    dimension: user_full_name {
      type: string
    }

    dimension: rank_step2 {
      type: number
    }
  }
