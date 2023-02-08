-- 1454_Glue_Content [C][0][Training Cards Latest Metadata]
-- c0_training_cards_latest_metadata_part4_final_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}


-- - 1.5 timezone edited
WITH time_zone_edited AS (
    SELECT event,`Time`,card_id,changed_column,new_val
    FROM {{ref('c0_training_cards_latest_metadata_part1_vw')}}
    WHERE event='card_edited_with_training' and changed_column ='time_zone'
),
time_zone_edited_rank AS (
    	SELECT card_id ,new_val AS time_zone FROM (
		SELECT  *,RANK() OVER (PARTITION BY CAST(card_id as INT64) ORDER BY TIME DESC) AS rankcol FROM (
		    SELECT event,time,card_id,changed_column,new_val FROM time_zone_edited 
	    ) qualify rankcol=1
	) start_dt
),
joined_time_zone_edited AS (
	SELECT a15.*,b15.card_id as card_id_1,b15.time_zone as time_zone_1
	FROM {{ref('c0_training_cards_latest_metadata_part3_vw')}} a15 LEFT JOIN time_zone_edited_rank b15
	ON a15.card_id = b15.card_id
),
appended_time_zone_edited AS (
	SELECT training_start_date,training_end_date,time_zone,registration_type,conferencing_tool,card_id,
	last_registration_date,registration_limit
	FROM joined_time_zone_edited WHERE card_id_1 IS NULL
	UNION ALL
	SELECT training_start_date,training_end_date,time_zone_1 AS time_zone,registration_type,
	conferencing_tool,card_id,last_registration_date,registration_limit
	FROM joined_time_zone_edited WHERE card_id_1 IS NOT NULL 
),
-- SELECT * FROM appended_time_zone_edited;

-- - 1.6 registration type edited
reg_type_edited AS (
    SELECT event,`Time`,card_id,changed_column,new_val
    FROM {{ref('c0_training_cards_latest_metadata_part1_vw')}}
    WHERE event='card_edited_with_training' and changed_column ='registration_type'
),
reg_type_edited_rank AS (
    	SELECT card_id ,new_val AS registration_type FROM (
		SELECT  *,RANK() OVER (PARTITION BY CAST(card_id as INT64) ORDER BY TIME DESC) AS rankcol FROM (
		    SELECT event,time,card_id,changed_column,new_val FROM reg_type_edited 
	    ) qualify rankcol=1
	) start_dt
),
joined_reg_type_edited AS (
	SELECT a16.*,b16.card_id as card_id_1,b16.registration_type as registration_type_1
	FROM appended_time_zone_edited a16 LEFT JOIN reg_type_edited_rank b16
	ON a16.card_id = b16.card_id
),
appended_reg_type_edited AS (
	SELECT training_start_date,training_end_date,time_zone,registration_type,conferencing_tool,card_id,
	last_registration_date,registration_limit
	FROM joined_reg_type_edited WHERE card_id_1 IS NULL
	UNION ALL
	SELECT training_start_date,training_end_date,time_zone,registration_type_1 AS registration_type,
	conferencing_tool,card_id,last_registration_date,registration_limit
	FROM joined_reg_type_edited WHERE card_id_1 IS NOT NULL 
)
SELECT CAST(training_start_date as timestamp) AS training_start_date,CAST(training_end_date as timestamp) AS training_end_date,
	  registration_type,time_zone,conferencing_tool,card_id,CAST(last_registration_date as timestamp) AS last_registration_date,
	  registration_limit,current_timestamp() AS etl_record_created_time FROM appended_reg_type_edited
