view: derived_table_top_13_carousels {

  derived_table: {
    sql: SELECT carousel_name,
            ROW_NUMBER() OVER
      (
      ORDER BY count(carousel_name) DESC
      ) rank
      FROM {{_user_attributes['database']}}.c2_content_structure_metadata_vw
      group by 1
      ;;
  }

# derived_table: {
#   explore_source: c2_content_structure_metadata_vw {
#     column: carousel_name {
#       field: c2_content_structure_metadata_vw.carousel_name
#     }

#     derived_column: rank {
#       sql: ROW_NUMBER() OVER (ORDER BY count(carousel_name) DESC) ;;
#     }
#   }
# }
  dimension: carousel_name {
    type: string
    sql: ${TABLE}.carousel_name ;;
  }

  dimension: rank {
    type: number
    hidden: yes
  #  sql: ${TABLE}.rank ;;
  }

  dimension: top_13_carousels{
    hidden: yes
    type: yesno
    sql: ${TABLE}.rank <= 13;;
  }

  dimension: top_13_carousel_names{
    type: string
    sql: CASE WHEN ${top_13_carousels} THEN ${carousel_name}
          ELSE "Other"
          END;;
#          order_by_field: min_rank
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

measure: min_rank {
  type: min
  sql:${TABLE}.rank;;
  hidden: yes
}
    set: detail {
      fields: [carousel_name, rank]
    }
 }
