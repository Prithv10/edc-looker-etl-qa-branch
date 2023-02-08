
view: derived_table_standard_card_type {

  derived_table: {
    sql: SELECT standard_card_type,
            ROW_NUMBER() OVER
      (
      ORDER BY count(standard_card_type) DESC
      ) rank
      FROM {{_user_attributes['database']}}.c1_content_latest_metadata_vw
      group by 1
      ;;
  }


  dimension: standard_card_type {
    type: string
    sql: ${TABLE}.standard_card_type ;;
  }

  dimension: rank {
    type: number
 #   hidden: yes
     sql: case when ${top_13_standard_card_type_names} !="Other" then ${TABLE}.rank
    else NULL
    end;;
  }

  dimension: top_13_standard_card_type{
    hidden: yes
    type: yesno
    sql: ${TABLE}.rank <= 13;;
  }

  dimension: top_13_standard_card_type_names{
    type: string
    sql: CASE WHEN ${top_13_standard_card_type} THEN ${standard_card_type}
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
      fields: [standard_card_type, rank]
    }
  }
