-- c0_content_content_duration_attributes_part2_final_vw

With select_columns_2 as(
SELECT card_id, duration_sec, HH, CONCAT(zero,M) as MM, ecl_id, ecl_source_name, card_subtype FROM(
SELECT card_id, duration_sec, CAST(M as string) as M, HH, ecl_id, ecl_source_name, card_subtype, '0' as zero
FROM(
SELECT card_id, duration_sec, M, HH, ecl_id, ecl_source_name, card_subtype FROM {{ref('c0_content_content_duration_attributes_part1_vw')}}
WHERE M < 10))),

MMtable as (
    SELECT card_id, duration_sec, CAST(M as string) as MM, HH, ecl_id, ecl_source_name, card_subtype
    FROM(
    SELECT card_id, duration_sec, M, HH, ecl_id, ecl_source_name, card_subtype FROM {{ref('c0_content_content_duration_attributes_part1_vw')}}
    WHERE M >= 10)
),

select_columns_3 as(
    SELECT card_id, duration_hh_mm, duration_sec as duration_seconds, MM, CAST(HH as int64) as duration_hours, ecl_id, ecl_source_name, card_subtype
    FROM(
    SELECT *, concat(HH,':',MM) as duration_hh_mm FROM (
    select card_id, duration_sec, MM, HH, ecl_id, ecl_source_name, card_subtype
    from select_columns_2
    UNION ALL 
    select card_id, duration_sec, MM, HH, ecl_id, ecl_source_name, card_subtype
    from MMtable))
)

SELECT card_id, duration_seconds, duration_hh_mm, duration_hours 
FROM(
SELECT card_id, duration_seconds, MM, duration_hours, ecl_id, ecl_source_name, card_subtype, duration_hh_mm
FROM select_columns_3
UNION ALL 
SELECT card_id, duration_sec as duration_seconds, null as MM, duration_hr as duration_hours, ecl_id, ecl_source_name, card_subtype, 'Missing Card Duration' as duration_hh_mm FROM(
SELECT Distinct card_id, duration_sec, ecl_id, ecl_source_name, card_subtype, (duration_sec/3600) as duration_hr, (duration_sec/60) as duration_min
FROM(
SELECT CAST(card_id as float64) as card_id, card_duration as duration_sec, ecl_id, card_source_name as ecl_source_name, card_subtype, time,
RANK() OVER(PARTITION BY card_id ORDER BY time desc) as rankcol
FROM {{ref('u0_usercards_event_vw')}}
QUALIFY rankcol = 1)
WHERE duration_sec IS NULL)
)

