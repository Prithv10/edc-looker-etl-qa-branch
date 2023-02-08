-- u4_users_channel_progression_duration_formatted_part1_vw

WITH calculator as(
SELECT user_id, channel_id as card_id, duration_sec, (duration_sec/3600) as duration_hr, duration_sec/60 as duration_min
FROM(
SELECT user_id, channel_id, channel_progression_seconds as duration_sec
FROM(
SELECT user_id, channel_id, sum(duration_seconds) as channel_progression_seconds FROM(
SELECT user_id, CAST(card_id as float64) as card_id, channel_id, duration_seconds FROM {{ref('u3_users_structured_content_performance_data_explorer_vw')}}
WHERE channel_id IS NOT NULL 
and performance_metric = 'Total Completions')
GROUP BY user_id, channel_id))),

hm as(

SELECT *, CAST('00' as float64) as H, floor(duration_min) as duration_min_floor FROM calculator
WHERE duration_min < 60 
and duration_sec IS NOT NULL 
),

hmfloored as(
    SELECT *,floor(duration_min - hours_to_subtract_from_total_minutes) as duration_min_floor  FROM (
    SELECT *, duration_hr_floor*60 as hours_to_subtract_from_total_minutes FROM( 
    SELECT *, floor(duration_hr) as duration_hr_floor FROM calculator
    WHERE duration_min >= 60 
    and duration_sec IS NOT NULL))

),


append_rows as(
SELECT card_id, duration_sec, H, user_id, duration_min_floor as M FROM hm
UNION ALL 
SELECT card_id, duration_sec, duration_hr_floor as H, user_id, duration_min_floor as M FROM hmfloored),

hhpadded as(
SELECT card_id, duration_sec, M, concat(zero,H) as HH, user_id from(
SELECT card_id, duration_sec, CAST(H as string) as H, user_id, M, '0' as zero FROM(
SELECT card_id, duration_sec, CAST(H as int64) as H, user_id, M FROM append_rows
WHERE H < 10))),

HHtable as(
    SELECT card_id, duration_sec, CAST(H as string) as HH, user_id, M
    FROM(
    SELECT card_id, duration_sec, CAST(H as int64) as H, user_id, M FROM append_rows
    WHERE H >= 10)
)

SELECT card_id, duration_sec, M, HH, user_id FROM hhpadded
UNION ALL 
SELECT card_id, duration_sec, M, HH, user_id FROM HHtable

