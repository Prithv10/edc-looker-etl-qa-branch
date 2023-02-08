-- u4_users_channel_progression_duration_formatted_part2_final_vw

WITH select_columns_2 as(
SELECT card_id, duration_sec, HH, CONCAT(zero,M) as MM, user_id
FROM(
SELECT card_id, duration_sec, CAST(M as string) as M, HH, user_id, '0' as zero FROM (
SELECT * FROM {{ref('u4_users_channel_progression_duration_formatted_part1_vw')}}
WHERE M < 10))),

MMtable as(
SELECT card_id, duration_sec, CAST(M as string) as MM, HH, user_id FROM (
SELECT * FROM {{ref('u4_users_channel_progression_duration_formatted_part1_vw')}}
WHERE M >= 10)
),

select_columns_3 as(
    SELECT card_id, duration_hh_mm, duration_sec as duration_seconds, user_id
    FROM(
    SELECT card_id, duration_sec, CAST(HH as string) as HH, MM, user_id, concat(HH,':','MM') as duration_hh_mm
    FROM(
    SELECT card_id, duration_sec, HH, MM, user_id
    FROM select_columns_2
    UNION ALL 
    SELECT card_id, duration_sec, MM, HH, user_id
    FROM MMtable))
),


duration_hh_mm_not_available as(
SELECT card_id, duration_sec as duration_seconds, user_id, 'channel_cards' as duration_hh_mm FROM(
SELECT user_id, channel_id as card_id, duration_sec, (duration_sec/3600) as duration_hr, duration_sec/60 as duration_min
FROM(
SELECT user_id, channel_id, channel_progression_seconds as duration_sec
FROM(
SELECT user_id, channel_id, sum(duration_seconds) as channel_progression_seconds FROM(
SELECT user_id, CAST(card_id as float64) as card_id, channel_id, duration_seconds FROM {{ref('u3_users_structured_content_performance_data_explorer_vw')}}
WHERE channel_id IS NOT NULL 
and performance_metric = 'Total Completions')
GROUP BY user_id, channel_id))
WHERE duration_sec IS NULL) 
),

append_rows_3 as(
    SELECT card_id, duration_hh_mm, duration_seconds, user_id FROM select_columns_3
    UNION ALL 
    SELECT card_id, duration_hh_mm, duration_seconds, user_id FROM duration_hh_mm_not_available)

SELECT card_id as channel_id, duration_seconds as channel_progression_seconds, user_id, duration_hh_mm as channel_progression_hh_mm
FROM append_rows_3