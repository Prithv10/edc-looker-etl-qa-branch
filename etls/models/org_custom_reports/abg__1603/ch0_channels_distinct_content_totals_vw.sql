-- Channels [CH][0] [Distinct Content Totals]
-- ch0_channels_distinct_content_totals

SELECT channel_id,COUNT(card_id) AS total_channel_content
FROM (
  SELECT DISTINCT card_id,channel_id
  FROM
    {{ref('c2_content_structure_metadata_vw')}}
  WHERE
    channel_id IS NOT NULL
    AND card_id IS NOT NULL )
GROUP BY channel_id