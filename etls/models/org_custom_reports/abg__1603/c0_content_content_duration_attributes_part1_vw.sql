-- c0_content_content_duration_attributes_part1_vw
{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    tags=['incremental']
  )
}}

WITH calculator as(
SELECT Distinct card_id, duration_sec, ecl_id, ecl_source_name, card_subtype, (duration_sec/3600) as duration_hr, (duration_sec/60) as duration_min
FROM(
SELECT CAST(card_id as float64) as card_id, card_duration as duration_sec, ecl_id, card_source_name as ecl_source_name, card_subtype, time,
RANK() OVER(PARTITION BY card_id ORDER BY time desc) as rankcol
FROM {{ref('u0_usercards_event_vw')}}
QUALIFY rankcol = 1)),

HMtable as(
    SELECT card_id, duration_sec, H, duration_min_floor as M, ecl_id, ecl_source_name,card_subtype FROM (
    SELECT *, CAST('00' as float64) as H, floor(duration_min) as duration_min_floor FROM calculator
    WHERE duration_min < 60
    and duration_sec IS NOT NULL) 
),

hmfloored as(
    SELECT *, floor((duration_min - hours_to_subtract_from_total_minutes)) as duration_min_floor FROM (
    SELECT *, (duration_hr_floor*60) as hours_to_subtract_from_total_minutes FROM (
    SELECT *, floor(duration_hr) as duration_hr_floor FROM calculator
    WHERE duration_min >= 60
    and duration_sec IS NOT NULL)) 
),

append_rows as(
SELECT card_id, duration_sec, H, M, ecl_id, ecl_source_name,card_subtype FROM HMtable
UNION ALL 
SELECT card_id, duration_sec, duration_hr_floor as H, duration_min_floor as M, ecl_id, ecl_source_name, card_subtype FROM hmfloored 
),

hhpadded as(
    SELECT *, concat(zero,H) as HH FROM(
    SELECT card_id, duration_sec, CAST(H as string) as H, M, ecl_id, ecl_source_name,card_subtype, '0' as zero 
    FROM(
    SELECT card_id, duration_sec, CAST(H as int64) as H, M, ecl_id, ecl_source_name,card_subtype FROM append_rows
    WHERE H < 10))
),

HHtable as(
    SELECT card_id, duration_sec, M, CAST(H as string) as HH, ecl_id, ecl_source_name, card_subtype FROM(
    SELECT card_id, duration_sec, CAST(H as int64) as H, M, ecl_id, ecl_source_name,card_subtype FROM append_rows)
)
SELECT card_id, duration_sec, M, HH, ecl_id, ecl_source_name, card_subtype, current_timestamp() as etl_record_created_time FROM hhpadded
UNION ALL 
SELECT card_id, duration_sec, M, HH, ecl_id, ecl_source_name, card_subtype, current_timestamp() as etl_record_created_time FROM HHtable