-- Channels [CH][1] [Overall Channel Duration - Formatted]
-- ch1_channels_overall_channel_duration_formatted_part1_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    tags=['incremental']
  )
}}

WITH calculator as(
SELECT *, (duration_sec/3600) as duration_hr, (duration_sec/60) as duration_min FROM(
SELECT CAST(channel_id as float64) as card_id, total_channel_duration_seconds as duration_sec FROM {{ref('ch0_channels_overall_channel_duration_total_seconds_vw')}})),

hmtable as(
SELECT card_id, duration_sec, H, duration_min_floor as M
FROM(
SELECT *, CAST('00' as float64) as H, floor(duration_min) as duration_min_floor FROM calculator
WHERE duration_min < 60
and duration_sec IS NOT NULL)),

hmfloored as(
    SELECT card_id, duration_sec, duration_hr_floor as H, duration_min_floor as M
    FROM(
    SELECT *, (duration_hr_floor*60) as hours_to_subtract_from_total_minutes, 
    (duration_min - (duration_hr_floor*60)) as duration_min_floor_raw,
    FLOOR((duration_min - (duration_hr_floor*60))) as duration_min_floor FROM (
    SELECT *, floor(duration_hr) as duration_hr_floor FROM calculator
    WHERE duration_min >= 60
    and duration_sec IS NOT NULL)) 
),

append_rows as(
SELECT card_id, duration_sec, H, M FROM hmtable
UNION ALL 
SELECT card_id, duration_sec, H, M FROM hmfloored),

hhpadded as(
    SELECT *, concat(zero,H) as HH FROM(
    SELECT card_id, duration_sec, CAST(H as string) as H, M, '0' as zero 
    FROM(
    SELECT card_id, duration_sec, CAST(H as int64) as H, M FROM append_rows
    WHERE H < 10))
),

HHtable as(
    SELECT card_id, duration_sec, M, CAST(H as string) as HH FROM(
    SELECT card_id, duration_sec, CAST(H as int64) as H, M FROM append_rows
    WHERE H >=10)
)
SELECT card_id, duration_sec, M, HH, current_timestamp() as etl_record_created_time FROM hhpadded
UNION ALL 
SELECT card_id, duration_sec, M, HH, current_timestamp() as etl_record_created_time FROM HHtable
