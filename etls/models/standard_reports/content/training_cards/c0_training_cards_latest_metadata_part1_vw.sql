-- 1454_Glue_Content [C][0][Training Cards Latest Metadata]
-- c0_training_cards_latest_metadata_part1_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

WITH usercards_events AS (
    SELECT event,`Time`,cast(card_id as float64) as card_id,end_date as training_end_date,start_date as training_start_date,registration_limit,conferencing_tool,
    last_registration_date,registration_type,time_zone,changed_column,new_val,current_timestamp() AS etl_record_created_time
     FROM {{ref('u0_usercards_event_vw')}}
)
SELECT * FROM usercards_events