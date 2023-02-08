-- c_ip_00_master_identity_dataset_part2_final_vw
-- missing column - report to email 
-- Need to replace network_id, reports_to_email, reports_to_network_id, healthstream_id, initial_hire_date once data, rehire_date is available


with pivotedtable as(
SELECT edcast_user_id, last_run, 
preferred_full_name, networkid as network_id, employeeid as employee_id, job_code as job_code_id, job_code_descr as job_code_name, department_id, department_number, department_name, ministry as ministry_name, entity as entity_id, entity_name, reporting_location_id as work_location_id, reporting_location_name as work_location_name, relationship_to_org, is_manager, employment_status, manager_id as reports_to_employee_id, manager_email as reports_to_email, reports_to_network_id, initial_hire_date, termination_date, years_service as yrs_of_service, paygroup, position_id, position_level, position_name, position_family, position_category, position_sub_category, fte, birthdate, gender, race_ethnicity, home_phone, action_reason_eff_date, action_reason, rehire_date, middle_name, work_schedule, healthstream_id
FROM
(select edcast_user_id, custom_field_value, last_run,
LOWER(REPLACE(REPLACE(REPLACE(TRIM(custom_field_name),' ','_'),'(',''),')',''))
as custom_field_name
from {{ref('c_ip_00_master_identity_dataset_part1_vw')}} 
) 
PIVOT(
	 max(custom_field_value) FOR custom_field_name IN  
	(    "{{ dbt_utils.get_column_values(table=ref('c_ip_00_master_identity_dataset_part1_vw'), column='custom_field_name') | join('","') }}"
  )
) 
)
,

joiningtable as (
SELECT 
edcast_user_id, last_run, 
preferred_full_name, employee_id, job_code_id, job_code_name, department_id, department_number, department_name, ministry_name, entity_id, entity_name, work_location_id, work_location_name, relationship_to_org, is_manager, employment_status, reports_to_employee_id, reports_to_email, termination_date, yrs_of_service, paygroup, position_id, position_level, position_name, position_family, position_category, position_sub_category, fte, birthdate, gender, race_ethnicity, home_phone, action_reason_eff_date, action_reason, middle_name, work_schedule, network_id, reports_to_network_id, 
healthstream_id, mgr_name,
 CASE initial_hire_date
          WHEN NULL THEN ' '
          WHEN "00:00.0" THEN ' '
       END AS initial_hire_date,
       CASE rehire_date
          WHEN NULL THEN ' '
          WHEN "00:00.0" THEN ' '
       END AS rehire_date FROM 
(
SELECT 
edcast_user_id, last_run, 
preferred_full_name, employee_id, job_code_id, job_code_name, department_id, department_number, department_name, ministry_name, entity_id, entity_name, work_location_id, work_location_name, relationship_to_org, is_manager, employment_status, reports_to_employee_id, initial_hire_date, termination_date, yrs_of_service, paygroup, position_id, position_level, position_name, position_family, position_category, position_sub_category, fte, birthdate, gender, race_ethnicity, home_phone, action_reason_eff_date, action_reason, rehire_date, middle_name, work_schedule, LOWER(network_id) as network_id, LOWER(reports_to_email) as reports_to_email, LOWER(reports_to_network_id) as reports_to_network_id, 
LOWER(healthstream_id) as healthstream_id,  regexp_replace(INITCAP(REPLACE(mgr_name,'.',' ')), '[0-9]', '') as mgr_name 
-- CAST(NULL as string) as initial_hire_date , CAST(NULL as string)rehire_date
-- INITCAP(REPLACE(mgr_name,'.',' ')) as mgr_name  
FROM(
SELECT *, SPLIT(reports_to_email, '@')[offset(0)] as mgr_name, SPLIT(reports_to_email, '@')[offset(1)] as mgr_email_column FROM pivotedtable)
)
)


SELECT user_id, user_full_name, middle_name, preferred_full_name, user_email, user_account_status, 
network_id, employee_id, healthstream_id, job_code_id, job_code_name, department_id, department_number,
department_name, work_location_id, work_location_name, entity_id, entity_name, ministry_name, employment_status, 
relationship_to_org, is_manager, reports_to_network_id, reports_to_employee_id,
reports_to_email, initial_hire_date, rehire_date, termination_date, action_reason, action_reason_eff_date, yrs_of_service, paygroup, fte, 
position_id, position_level, position_name, position_family, position_category, position_sub_category, gender, 
home_phone, time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement,  mgr_name as reports_to_name, last_run
 FROM(
SELECT user_id, INITCAP(user_full_name) as user_full_name, email as user_email, user_account_status, time_account_created, latest_day_of_active_engagement, first_day_of_active_engagement FROM {{ref('u3_overall_onboarding_status_part4_final_vw')}})
title_case_user_name
LEFT OUTER JOIN 
joiningtable
on title_case_user_name.user_id = joiningtable.edcast_user_id