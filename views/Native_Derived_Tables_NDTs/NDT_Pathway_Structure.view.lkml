include: "/edcast_project/views/original_views/structured_content_analytics/g3_groups_structured_content_performance_data_explorer_vw.view.lkml"


view: ndt_pathyway_structure{
    derived_table: {
      explore_source: g3_groups_structured_content_performance_data_explorer_vw {
        column: pathway_title {
          field: g3_groups_structured_content_performance_data_explorer_vw.pathway_title
        }
      #  column: performance_metric {

       #   field: g3_groups_structured_content_performance_data_explorer_vw.performance_metric
      #  }
        column: count {
          field: g3_groups_structured_content_performance_data_explorer_vw.count
        }

        derived_column: rank {
          sql: ROW_NUMBER () OVER(ORDER BY pathway_title DESC);;
        }
        sorts: [g3_groups_structured_content_performance_data_explorer_vw.rank: desc]
      }
    }
    dimension: pathway_title {
      label: "Structured Content Performance Data Pathway Title"
      description: ""
      primary_key: yes
      type: string
    }

   dimension: count {
      label: "Structured Content Performance Data Count"
      description: ""
      type: number
    }

    dimension: rank {
      type: number
      sql: ${TABLE}.rank ;;

    }

  }
