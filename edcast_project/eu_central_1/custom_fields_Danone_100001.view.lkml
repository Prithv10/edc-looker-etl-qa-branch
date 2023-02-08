include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: danone {
  allowed_values: ["edc_prod_analytics_customer_100001"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {


  dimension: classification_100001 {
    label: "Classification"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.classification ;;
  }

  dimension: country_100001 {
    label: "Country"
    required_access_grants: [danone]
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_description_100001 {
    label: "Country Description"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.country_description ;;
    map_layer_name: countries
  }

  dimension: danone_id_100001 {
    label: "Danone ID"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.danone_id ;;
  }

  dimension: date_of_birth_100001 {
    label: "Date Of Birth"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: gender_100001 {
    label: "Gender"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: group_entry_date_100001 {
    label: "Group Entry Date"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.group_entry_date ;;
  }

  dimension: hierarchical_supervisor_100001 {
    label: "Hierarchical Supervisor"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.hierarchical_supervisor ;;
  }

  dimension: job_family_100001 {
    label: "Job Family"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.job_family ;;
  }

  dimension: job_family_description_100001 {
    label: "Job Family Description"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.job_family_description ;;
  }

  dimension: job_title_100001 {
    label: "Job Title"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: manager_email_100001 {
    label: "Manager Email"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.manager_email ;;
  }

  dimension: operational_entity_100001 {
    label: "Operational Entity"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.operational_entity ;;
  }

  dimension: position_entry_date_100001 {
    label: "Position Entry Date"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.position_entry_date ;;
  }

  dimension: team_leader_or_not_100001 {
    label: "Team Leader Or Not"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.team_leader_or_not ;;
  }

  dimension: user_id_100001 {
    label: "User Id"
    hidden: yes
    required_access_grants: [danone]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: wbu_wbs_100001{
    label: "WBU WBS"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.wbu_wbs ;;
  }

  dimension: wbu_wbs_description_100001 {
    label: "WBU WBS Description"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.wbu_wbs_description ;;
  }

  dimension: working_location_100001 {
    label: "Working Location"
    required_access_grants: [danone]
    type: string
    sql: ${TABLE}.working_location ;;
  }

  measure: count_100001 {
    label: "Count"
    required_access_grants: [danone]
    type: count
    drill_fields: []
  }
}
