-- Channels [CH][0] [Overall Channel Duration - Total Seconds]
-- ch0_channels_overall_channel_duration_total_seconds_vw

WITH select_columns_1 as(
SELECT card_id, duration_seconds, channel_id FROM (
SELECT CAST(channel_id as int64) as channel_id, CAST(card_id as float64) as card_id FROM (
SELECT * FROM {{ref('c2_content_structure_metadata_vw')}}
WHERE channel_id IS NOT NULL )) channel_cards
LEFT OUTER JOIN 
(SELECT card_id as card_id_1, duration_seconds FROM {{ref('c0_content_content_duration_attributes_part2_final_vw')}}) card_durations
ON channel_cards.card_id =card_durations.card_id_1),

remove_duplicates as(
    SELECT distinct channel_id as channel_id_1 FROM select_columns_1
    WHERE duration_seconds IS NULL 
),

cards_with_duration as(
    SELECT * FROM select_columns_1
    WHERE duration_seconds IS NOT NULL 
),

join_data_2 as(
    SELECT distinct channel_id FROM cards_with_duration
    LEFT OUTER JOIN remove_duplicates
    ON cards_with_duration.channel_id = remove_duplicates.channel_id_1
),

join_data_1 as (
    SELECT channel_id, sum(duration_seconds) as total_channel_duration_seconds
    FROM(
    SELECT channel_id, duration_seconds, card_id 
    FROM (
    SELECT * FROM cards_with_duration
    LEFT OUTER JOIN 
    remove_duplicates
    ON cards_with_duration.channel_id = remove_duplicates.channel_id_1
    WHERE channel_id_1 IS NULL))
    GROUP BY channel_id 
)

SELECT * FROM join_data_1
UNION ALL 
SELECT *, null as total_channel_duration_seconds FROM join_data_2
