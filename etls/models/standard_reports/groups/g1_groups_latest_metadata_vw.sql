-- Groups [G][1] [Latest Metadata]
-- g1_groups_latest_metadata_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    
    partition_by = {'field': 'Group_ID', 'data_type': 'int64', 'range': {
            'end': 100,
            'interval': 10,
            'start': 0
        }
        } ,
    tags=['incremental']
  )
}}

SELECT org_id_s, Group_ID, Group_Name,
  CASE
    WHEN Group_Status IS NULL THEN 'Active'
    ELSE
    Group_Status
END
  AS Group_Status,
  current_timestamp() AS etl_record_created_time
FROM (
  SELECT Group_ID, Group_Name, Group_Status, org_id_s
  FROM (
    SELECT
      *
    FROM (
      SELECT DISTINCT (Group_ID),Group_Name, org_id_s
      FROM (
        SELECT
          *,
          RANK() OVER (PARTITION BY Group_ID ORDER BY Time DESC) AS rank
        FROM (
          SELECT team_id AS Group_ID, team_name AS Group_Name,event AS Event, Time, org_id_s
          FROM
            {{ ref('g0_groups_core_event_vw') }}
          WHERE
            team_name IS NOT NULL
            AND team_name != '' )QUALIFY rank = 1) )AS g1_latest_metadata_remove_duplicates
    LEFT OUTER JOIN (
      SELECT Group_ID AS Group_ID_1, "Deleted" AS Group_Status
      FROM (
        SELECT Time, Event, Group_ID
        FROM (
          SELECT team_id AS Group_ID, team_name AS Group_Name, event AS Event, Time
          FROM
            {{ ref('g0_groups_core_event_vw') }}) 
        WHERE
          Event = 'group_deleted') ) AS g1_latest_metadata_group_status
    ON
      g1_latest_metadata_remove_duplicates.Group_ID = g1_latest_metadata_group_status.Group_ID_1))
   
