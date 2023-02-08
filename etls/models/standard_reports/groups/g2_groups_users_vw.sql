-- 1454_Glue_Groups [G][2] [Group Users]
-- g2_groups_users_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'group_id', 'data_type': 'int64', 'range': {
            'end': 100,
            'interval': 10,
            'start': 0  
        }},
    cluster_by = ["Group_Name","Group_Status"],
    tags=['incremental']
  )
}}


SELECT
  Group_ID, Group_Name, Group_Status, CAST(Group_User_ID AS float64) AS User_ID, STRING_AGG(Group_User_Role, ",") AS Group_User_Role,current_timestamp() AS etl_record_created_time
FROM (
  SELECT
    *
  FROM (
    SELECT
      DISTINCT Group_ID, Group_Name, Group_Status
    FROM
      {{ref('g1_groups_latest_metadata_vw')}}) AS g1_groups_latest_metadata
  LEFT OUTER JOIN (
      -- SELECT COLUMNS 1 &REMOVE DUPLICATES
    SELECT
      DISTINCT Group_User_ID, Group_ID AS Group_ID_1, Group_User_Role
    FROM (
        -- RANK & WINDOW, FILTER ROWS 1
      SELECT
        Event, Group_ID, Group_User_ID, User_ID, Time, Group_User_Role, RANK() OVER (PARTITION BY Group_ID, Group_User_ID, group_user_role  ORDER BY Time DESC) AS rank FROM (
          --SELECT COLUMNS & FILTER ROWS
        SELECT
          event AS Event, team_id AS Group_ID, group_user_id AS Group_User_ID, user_id AS User_ID, Time, group_user_role AS Group_User_Role
        FROM
          {{ ref('g0_groups_core_event_vw') }}
        WHERE
          Event = 'group_user_added'
          OR Event = 'group_user_removed' )
        QUALIFY rank = 1 and Event = 'group_user_added' ) )AS g2_group_users_part1
  ON
    g1_groups_latest_metadata.Group_ID = g2_group_users_part1.Group_ID_1)
GROUP BY
  Group_ID, Group_Name, Group_Status, User_ID

