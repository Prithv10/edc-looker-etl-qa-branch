  -- 1454_Glue_Channels [CH][1] [Latest Metadata]
  -- ch1_channel_latest_metadata_vw

  -- Value Mapper

SELECT
  Channel_ID, Channel_Name, Is_Channel_Private, Is_ECL_Enabled, Is_Channel_Curated, org_id_s, CASE WHEN Channel_Status IS NULL THEN 'Active'ELSE Channel_Status END AS Channel_Status
FROM (
  SELECT
    Channel_ID, Channel_Name, Channel_Status, Is_Channel_Private, Is_ECL_Enabled, Is_Channel_Curated, org_id_s
  FROM (
      -- LEFT OUTER JOIN
    SELECT
      *
    FROM
      -- First TABLE Flow
      (
      SELECT
        DISTINCT (Channel_ID), Channel_Name, Is_Channel_Private, Is_ECL_Enabled, Is_Channel_Curated, org_id_s
      FROM (
        SELECT
          channel_id AS Channel_ID, channel_label AS Channel_Name, channel_is_private AS Is_Channel_Private, event AS Event, Time, is_ecl_enabled AS Is_ECL_Enabled, 
          is_channel_curated AS Is_Channel_Curated, org_id_s, RANK() OVER (PARTITION BY Channel_ID ORDER BY Time DESC) AS rank
        FROM
          {{ref('ch0_channel_core_event_vw')}}

          QUALIFY rank = 1 and Channel_ID IS NOT NULL ) )AS ch1_channel_latest_metadata_remove_duplicates
    LEFT OUTER JOIN
      -- Second TABLE Flow
      (
      SELECT
        Channel_ID AS Channel_ID_1, "Deleted" AS Channel_Status
      FROM 
          {{ref('ch0_channel_core_event_vw')}}
      WHERE
        Event = 'channel_deleted'  ) AS ch1_channel_latest_metadata_add_constants
    ON
      ch1_channel_latest_metadata_remove_duplicates.Channel_ID = ch1_channel_latest_metadata_add_constants.Channel_ID_1 ) )