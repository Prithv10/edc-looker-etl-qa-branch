include: "/edcast_project/views/original_views/*.view.lkml"

access_grant: genpact {
  allowed_values: ["genpact_dataset"]
  user_attribute: database
}

view: +cf_0_latest_user_details_vw {


  dimension: active {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.active ;;
  }

  dimension: band_code {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.band_code ;;
  }

  dimension: businessgroup {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.businessgroup ;;
  }

  dimension: coecode {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.coecode ;;
  }

  dimension: costcenterid {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.costcenterid ;;
  }

  dimension: countrycode {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.countrycode ;;
  }

  dimension: divisionid {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.divisionid ;;
  }

  dimension: employeestatus {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.employeestatus ;;
  }

  dimension: employmenttype {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.employmenttype ;;
  }

  dimension: gender {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: gradeid {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.gradeid ;;
  }

  dimension: lasthiredate {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.lasthiredate ;;
  }

  dimension: middlename {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.middlename ;;
  }

  dimension: originalhiredate {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.originalhiredate ;;
  }

  dimension: phone {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: prefix {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.prefix ;;
  }

  dimension: sdocode {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.sdocode ;;
  }

  dimension: userid {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.userid ;;
  }

  dimension: username {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: verticals {
    required_access_grants: [genpact]
    type: string
    sql: ${TABLE}.verticals ;;
  }



}
