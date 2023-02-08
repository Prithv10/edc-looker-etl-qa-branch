-- u3_users_pathway_journey_progression_overview_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity': 'year'},
    tags=['incremental']
  )
}}

WITH
  u2_removed_shared_pathways AS (
  SELECT
    DISTINCT Pathway_ID, Card_ID, User_ID, Content_Structure, 
    Time_Completed, Duration_seconds
  FROM
    {{ref('u2_users_pathway_progression_data_explorer_vw')}}
  WHERE
    Time_Completed IS NOT NULL
    AND Pathway_ID IS NOT NULL
    AND User_ID IS NOT NULL),

  join_data_9 AS(
  SELECT
    *
  FROM
    u2_removed_shared_pathways AS removed_shared_pathways
  LEFT OUTER JOIN (
    SELECT
      User_ID AS User_ID_1, Content_Structure AS Content_Structure_1, 
      Pathway_ID AS Pathway_ID_1, SUM(Duration_seconds) AS 
      Pathway_Progress_seconds
    FROM
      u2_removed_shared_pathways
    GROUP BY
      User_ID_1,
      Content_Structure_1,
      Pathway_ID_1) group_by_1
  ON
    removed_shared_pathways.User_ID = group_by_1.User_ID_1
    AND removed_shared_pathways.Content_Structure = group_by_1.Content_Structure_1
    AND removed_shared_pathways.Pathway_ID = group_by_1.Pathway_ID_1)

SELECT
  User_ID, Pathway_ID, Content_Structure, Pathway_Progress_seconds, COUNT 
  (Time_Completed) AS Total_Cards_Completed, current_timestamp() as etl_record_created_time
FROM (
  SELECT
    User_ID, Content_Structure, Pathway_ID, Time_Completed, Card_ID, 
    Pathway_Progress_seconds, Duration_seconds
  FROM
    join_data_9)
GROUP BY
  1,
  2,
  3,
  4
  ---