include: "/edcast_project/views/original_views/*.view.lkml"
include: "/edcast_project/eu_central_1/*.view.lkml"

access_grant: hydro_quebec {
  allowed_values: ["edc_prod_analytics_customer_100111"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw_1 {

  dimension: code_d_emploi_100111 {
    label: "Code d Emploi"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.code_d_emploi ;;
  }

  dimension: code_unite_structurelle_100111 {
    label: "Code Unite Structurelle"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.code_unite_structurelle ;;
  }

  dimension: date_d_embauche_100111 {
    label: "Date d Embauche"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.date_d_embauche ;;
  }

  dimension: date_de_derniere_mise_a_jour_100111 {
    label: "Date de Derniere Mise a Jour"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.date_de_derniere_mise_a_jour ;;
  }

  dimension: duree_de_service_100111 {
    label: "Duree de Service"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.duree_de_service ;;
  }

  dimension: groupe_d_emplois_100111 {
    label: "Groupe d Emplois"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.groupe_d_emplois ;;
  }

  dimension: sous_domaine_100111 {
    label: "Sous Domaine"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.sous_domaine ;;
  }

  dimension: unite_d_affaires_100111 {
    label: "Unite d Affaires"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.unite_d_affaires ;;
  }

  dimension: unite_niveau_2_100111 {
    label: "Unite Niveau 2"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.unite_niveau_2 ;;
  }

  dimension: unite_niveau_3_100111 {
    label: "Unite Niveau 3"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.unite_niveau_3 ;;
  }

  dimension: unite_niveau_4_100111 {
    label: "Unite Niveau 4"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.unite_niveau_4 ;;
  }

  dimension: unite_structurelle_100111 {
    label: "Unite Structurelle"
    required_access_grants: [hydro_quebec]
    type: string
    sql: ${TABLE}.unite_structurelle ;;
  }

  dimension: user_id_100111 {
    label: "User Id"
    required_access_grants: [hydro_quebec]
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count_100111 {
    label: "Count"
    required_access_grants: [hydro_quebec]
    type: count
    drill_fields: []
  }
}
