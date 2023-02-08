include: "/edcast_project/views/original_views/search_analytics/se1_searches_search_user_details.view.lkml"

 view:derived_table_using_explore_source_top_20_searches
{
  view_label: "Top 20 Searches- Explore Source"
  derived_table: {
    explore_source: se1_searches_search_user_details {

      column: search_query {
        field: se1_searches_search_user_details.search_query
      }

      derived_column: count {
        sql: count(search_query) ;;
      }

      derived_column: rank {
        sql: ROW_NUMBER () OVER(ORDER BY count(search_query) DESC);; # GROUP BY search_query;;
      }
      sorts: [se1_searches_search_user_details.rank: desc]
      filters: [se1_searches_search_user_details.search_query: "-NULL,-*"]
      #Use filter to filter out blanks and * values
    }
}
    dimension: search_query {
      type: string
      sql: trim(${TABLE}.search_query) ;;
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

  # sql: SELECT search_query,
  # count(search_query) AS count_SQ ,
  # RANK () OVER  (ORDER BY count(search_query) DESC) AS rank
  # FROM se1_searches_search_user_details
  # group by 1
  # ORDER BY 2 DESC
  # ;;


  #  measure: count_SQ {
  #    type: count
  #    # sql: ${TABLE}.search_query;;
  #  }



   # measure: count {
  #    type: count
  ##    drill_fields: [detail*]
  #  }

    #set: detail {
    #  fields: [search_query, rank]
    #}
 }
