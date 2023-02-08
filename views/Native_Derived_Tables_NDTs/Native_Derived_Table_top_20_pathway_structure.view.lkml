include: "/edcast_project/views/original_views/structured_content_analytics/g3_groups_structured_content_performance_data_explorer_vw.view.lkml"

view:native_derived_table_top_20_pathway_structure
{
  view_label: "Top 20 Pathway - Explore Source"
  derived_table: {
    explore_source: g3_groups_structured_content_performance_data_explorer_vw
 {

      column: pathway_title {
        field: g3_groups_structured_content_performance_data_explorer_vw.pathway_title
      }

      derived_column: count {
        sql: count(pathway_title) ;;
      }

      derived_column: rank {
        sql: ROW_NUMBER () OVER(ORDER BY count(pathway_title) DESC);;
      }
      sorts: [g3_groups_structured_content_performance_data_explorer_vw.rank: desc]

    }
  }
  dimension: pathway_title {
    type: string
    sql: trim(${TABLE}.pathway_title) ;;
    primary_key: yes
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;

  }
  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }



}
