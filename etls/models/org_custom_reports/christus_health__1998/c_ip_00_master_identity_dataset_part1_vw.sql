-- C-IP-00 [MASTER] IDENTITY DATASET
-- c_ip_00_master_identity_dataset_part1_vw

-- missing _batch_last_run_
SELECT user_id as edcast_user_id, custom_field_value, last_run, LOWER(REPLACE(REPLACE(REPLACE(TRIM(custom_field_name),' ','_'),'(',''),')','')) as custom_field_name, 
FROM(
SELECT user_id, value as custom_field_value, 
display_name as custom_field_name, null as last_run  FROM {{get_db_source('user_custom_fields_dim_m_v')}}) 