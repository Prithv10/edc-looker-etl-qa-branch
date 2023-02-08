-- 1454_Glue_Content [C][0][Training Cards Latest Metadata]
-- c0_training_cards_latest_metadata_part3_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

-- - 1.3 Start date edited
WITH start_date_edited AS (
    SELECT event,`Time`,card_id,changed_column,CAST(new_val as INT64) as new_val
    FROM {{ref('c0_training_cards_latest_metadata_part1_vw')}}
    WHERE event='card_edited_with_training' and changed_column ='start_date'
),
start_date_edited_rank AS (
    	SELECT card_id ,training_start_date FROM (
		SELECT  *,TIMESTAMP_SECONDS(new_val) AS training_start_date,RANK() OVER (PARTITION BY CAST(card_id as INT64) ORDER BY TIME DESC) AS rankcol FROM (
		    SELECT event,time,card_id,changed_column,new_val FROM start_date_edited 
	    ) qualify rankcol=1
	) start_dt
),
joined_start_date_edited AS (
	SELECT a13.*,b13.card_id as card_id_1,b13.training_start_date as training_start_date_1
	FROM {{ref('c0_training_cards_latest_metadata_part2_vw')}} a13 LEFT JOIN start_date_edited_rank b13
	ON a13.card_id = b13.card_id
),
appended_start_date_edited AS (
	SELECT training_end_date,training_start_date,time_zone,registration_type,conferencing_tool,card_id,
	last_registration_date,registration_limit
	FROM joined_start_date_edited WHERE card_id_1 IS NULL
	UNION ALL
	SELECT training_end_date,training_start_date_1 AS training_start_date,time_zone,registration_type,
	conferencing_tool,card_id,last_registration_date,registration_limit
	FROM joined_start_date_edited WHERE card_id_1 IS NOT NULL 
),
-- SELECT * FROM appended_start_date_edited;

-- - 1.4 end date edited
end_date_edited AS (
    SELECT event,`Time`,card_id,changed_column,CAST(new_val as INT64) as new_val
    FROM {{ref('c0_training_cards_latest_metadata_part1_vw')}}
    WHERE event='card_edited_with_training' and changed_column ='end_date'
),
end_date_edited_rank AS (
    	SELECT card_id ,training_end_date FROM (
		SELECT  *,TIMESTAMP_SECONDS(new_val) AS training_end_date,RANK() OVER (PARTITION BY CAST(card_id as INT64) ORDER BY TIME DESC) AS rankcol FROM (
		    SELECT event,time,card_id,changed_column,new_val FROM end_date_edited 
	    ) qualify rankcol=1
	) start_dt
),
joined_end_date_edited AS (
	SELECT a14.*,b14.card_id as card_id_1,b14.training_end_date as training_end_date_1
	FROM appended_start_date_edited a14 LEFT JOIN end_date_edited_rank b14
	ON a14.card_id = b14.card_id
),
appended_end_date_edited AS (
	SELECT training_start_date,training_end_date,time_zone,registration_type,conferencing_tool,card_id,
	last_registration_date,registration_limit
	FROM joined_end_date_edited WHERE card_id_1 IS NULL
	UNION ALL
	SELECT training_start_date,training_end_date_1 AS training_end_date,time_zone,registration_type,
	conferencing_tool,card_id,last_registration_date,registration_limit
	FROM joined_end_date_edited WHERE card_id_1 IS NOT NULL 
)
SELECT *,current_timestamp() AS etl_record_created_time FROM appended_end_date_edited
