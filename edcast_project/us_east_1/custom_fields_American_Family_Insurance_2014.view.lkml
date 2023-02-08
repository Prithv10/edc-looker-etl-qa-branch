 include: "/edcast_project/views/original_views/*.view.lkml"
  include: "/edcast_project/us_east_1/*.view.lkml"

  access_grant:American_Family_Insurance{
    allowed_values: ["edc_prod_analytics_customer_2014"]
    user_attribute: database
  }

# The name of this view in Looker is "Cf 0 Latest User Details Vw"
  view: +cf_0_latest_user_details_vw_3 {

# Given unique names for all custom fields by appending org_id to avoid overlap issues

  dimension: afi_external_id_2014 {
    label: "AFI External ID"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.afi_external_id ;;
  }

  dimension: company_name_2014 {
    label: "Company Name"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: department_2014 {
    label: "Department"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: department_function_2014 {
    label: "Department Function"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.department_function ;;
  }

  dimension: department_function_code_2014 {
    label: "Department Function Code"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.department_function_code ;;
  }

  dimension: department_id_2014 {
    label: "Department ID"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.department_id ;;
  }

  dimension: division_code_2014 {
    label: "Division Code"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.division_code ;;
  }

  dimension: division_name_2014 {
    label: "Division Name"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.division_name ;;
  }

  dimension:learning_central_wave_2014  {
    label: "Learning Central Wave"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: CASE
WHEN
${division_name_2014} ='Human Resources Division' or
${division_name_2014}='Life Company Division' or
${division_name_2014}='Communications Division' or
${division_name_2014}='Talent Dev & Ignite Division' or
${division_name_2014}='Inclusive Excellence Division'
THEN 'Wave 1'
ELSE 'Later wave'
END ;;
  }

  dimension: employee_type_2014 {
    label: "Employee Type"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: job_code_2014 {
    label: "Job Code"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.job_code ;;
  }

  dimension: location_code_2014 {
    label: "Location Code"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.location_code ;;
  }

  dimension: management_level_2014 {
    label: "Management Level"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.management_level ;;
  }

  dimension: management_level_code_2014 {
    label: "Management Level Code"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.management_level_code ;;
  }

  dimension: management_level_description_2014 {
    label: "Management Level Description"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.management_level_description ;;
  }

  dimension: manager_name_2014 {
    label: "Manager Name"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.manager_name ;;
  }

  dimension: td_director_2014 {
    label: "TD Director"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: CASE
WHEN
${manager_name_2014}='Burbach,Amy P' or
${manager_name_2014}='Covelli,Maddy J' or
${manager_name_2014}='Jashinsky,Annika S' or
${manager_name_2014}='Pederson,Kelsi'
THEN 'Maddy Covelli'

WHEN
${manager_name_2014}='Davis,Cece M'or
${manager_name_2014}='van Bruekelen,Henny' or
${manager_name_2014}='Alsup,Pamela D' or
${manager_name_2014}='Vitale,Tom A' or
${manager_name_2014}='Pike,Todd T'
THEN 'Claims'

WHEN
${manager_name_2014}='Byl,April A'or
${manager_name_2014}='Frestedt,Joel M' or
${manager_name_2014}='Dunne,Anna' or
${manager_name_2014}='Shisler,Bonnie L'or
${manager_name_2014}='Miller,Susan J' or
${manager_name_2014}='Hansen,Tammy J' or
${manager_name_2014}='Rentmeester,Julie A' or
${manager_name_2014}='Leonzal,Kate'
THEN 'Sales & Product'

WHEN
${manager_name_2014}='Roessler,Kris'or
${manager_name_2014} = 'Lauritsen,Kari A' or
${manager_name_2014}='Lockstein,Eric A'
THEN 'LDPD'

ELSE 'Other'
END;;
  }

  dimension: person_city_2014 {
    label: "Person City"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.person_city ;;
  }

  dimension: person_state_2014 {
    label: "Person State"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.person_state ;;
  }

  dimension: sales_state_2014 {
    label: "Sales State"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.sales_state ;;
  }

  dimension: start_date_2014 {
    label: "Start Date"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.start_date ;;
  }

  dimension: user_id_2014 {
    label: "User ID"
    required_access_grants: [American_Family_Insurance]
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: worker_s_avp_2014 {
    label: "Worker S AVP"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.worker_s_avp ;;
  }

  dimension: worker_s_director_2014 {
    label: "Worker S Director"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.worker_s_director ;;
  }

  dimension: worker_s_vice_president_2014 {
    label: "Worker S Vice President"
    required_access_grants: [American_Family_Insurance]
    type: string
    sql: ${TABLE}.worker_s_vice_president ;;
  }

  measure: count_2014 {
    label: "Count"
    required_access_grants: [American_Family_Insurance]
    type: count
    drill_fields: []
  }
}
