-- 1454_Glue_Content [C][0][Training Cards Latest Metadata]
-- c0_training_cards_latest_metadata_part2_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

WITH card_created_with_training AS (
    SELECT DISTINCT `Time`,card_id,training_end_date,training_start_date,registration_limit,event,conferencing_tool,
    last_registration_date,registration_type,time_zone
    FROM {{ref('c0_training_cards_latest_metadata_part1_vw')}} WHERE event='card_created_with_training'
),
-- 1.1 Latest registration Limit
latest_reg_limit AS (
	SELECT card_id,CAST(new_val as FLOAT64) as registration_limit FROM (
		SELECT  *,RANK() OVER (PARTITION BY CAST(card_id as INT64) ORDER BY TIME DESC) AS rankcol FROM (
		    SELECT event,time,card_id,changed_column,new_val FROM {{ref('c0_training_cards_latest_metadata_part1_vw')}} 
		    WHERE event='card_edited_with_training' AND changed_column='registration_limit'
	    ) qualify rankcol=1
	) reg_limit
),
joined_latest_reg_limit AS (
    SELECT a11.*,a12.card_id as card_id_1,a12.registration_limit as registration_limit_1
    FROM card_created_with_training a11 LEFT JOIN latest_reg_limit a12
    ON a11.card_id = a12.card_id
),
appended_latest_reg_limit AS (
	SELECT training_end_date,training_start_date,registration_type,time_zone,conferencing_tool,card_id,
	last_registration_date,registration_limit
	FROM joined_latest_reg_limit WHERE card_id_1 IS NULL
	UNION ALL
	SELECT training_end_date,training_start_date,registration_type,time_zone,conferencing_tool,card_id,
	last_registration_date,CAST(registration_limit_1 AS INT64) AS registration_limit
	FROM joined_latest_reg_limit WHERE card_id_1 IS NOT NULL 
),
-- SELECT * FROM appended_latest_reg_limit


-- - 1.2 Last registration date edited
last_reg_date_edited AS (
    SELECT event,`Time`,card_id,changed_column,CAST(new_val as INT64) as new_val
    FROM {{ref('c0_training_cards_latest_metadata_part1_vw')}}
    WHERE event='card_edited_with_training' and changed_column ='last_registration_date'
),
last_reg_date_rank AS (
    	SELECT card_id ,last_registration_date FROM (
		SELECT  *,TIMESTAMP_SECONDS(new_val) AS last_registration_date,RANK() OVER (PARTITION BY CAST(card_id as INT64) ORDER BY TIME DESC) AS rankcol FROM (
		    SELECT event,time,card_id,changed_column,new_val FROM last_reg_date_edited 
	    ) qualify rankcol=1
	) reg_limit
),
joined_latest_reg_date_withprev AS (
SELECT a12.*,b12.card_id as card_id_1,b12.last_registration_date as last_registration_date_1
FROM appended_latest_reg_limit a12 LEFT JOIN last_reg_date_rank b12
ON a12.card_id = b12.card_id
),
appended_last_reg_date AS (
	SELECT training_end_date,training_start_date,time_zone,registration_type,conferencing_tool,card_id,
	last_registration_date,registration_limit
	FROM joined_latest_reg_date_withprev WHERE card_id_1 IS NULL
	UNION ALL
	SELECT training_end_date,training_start_date,time_zone,registration_type,conferencing_tool,card_id,
	last_registration_date_1 AS last_registration_date,registration_limit
	FROM joined_latest_reg_date_withprev WHERE card_id_1 IS NOT NULL 
)
SELECT *,current_timestamp() AS etl_record_created_time FROM appended_last_reg_date

