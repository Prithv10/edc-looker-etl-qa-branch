-- ch1_channels_overall_channel_duration_formatted_part2_final_vw
-- Channels [CH][1] [Overall Channel Duration - Formatted]


With select_columns_2 as(
SELECT card_id, duration_sec, HH, CONCAT(zero,M) as MM FROM(
SELECT card_id, duration_sec, CAST(M as string) as M, HH, '0' as zero
FROM(
SELECT card_id, duration_sec, M, HH FROM {{ref('ch1_channels_overall_channel_duration_formatted_part1_vw')}}
WHERE M < 10))),

MMtable as (
    SELECT card_id, duration_sec, CAST(M as string) as MM, HH
    FROM(
    SELECT card_id, duration_sec, M, HH FROM {{ref('ch1_channels_overall_channel_duration_formatted_part1_vw')}}
    WHERE M >= 10)
),

select_columns_3 as(
    SELECT card_id, duration_hh_mm, duration_sec as duration_seconds, MM, CAST(HH as int64) as duration_hours
    FROM(
    SELECT *, concat(HH,':',MM) as duration_hh_mm FROM (
    select card_id, duration_sec, MM, HH
    from select_columns_2
    UNION ALL 
    select card_id, duration_sec, MM, HH
    from MMtable))
)

SELECT card_id as channel_id, duration_seconds as overall_channel_duration_seconds, duration_hh_mm as overall_channel_duration_hh_mm
FROM(
SELECT card_id, 'Channel Cards Missing Duration' as duration_hh_mm, duration_sec as duration_seconds, duration_hr as duration_hours FROM (
SELECT *, (duration_sec/3600) as duration_hr, (duration_sec/60) as duration_min FROM(
SELECT CAST(channel_id as float64) as card_id, total_channel_duration_seconds as duration_sec FROM {{ref('ch0_channels_overall_channel_duration_total_seconds_vw')}})
WHERE duration_sec IS NULL)
UNION ALL 
SELECT card_id, duration_hh_mm, duration_seconds, duration_hours FROM select_columns_3)













