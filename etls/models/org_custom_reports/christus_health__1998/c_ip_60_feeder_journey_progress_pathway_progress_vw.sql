-- c_ip_60_feeder_journey_progress_pathway_progress_vw
-- C-IP-60 [FEEDER] JOURNEY PROGRESS + PATHWAY PROGRESS

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity':'month'},
    cluster_by = ['completion_status'],
    tags=['incremental']
  )
}}


WITH append_rows AS 
(
  SELECT user_id, user_full_name, journey_id AS journey_pathway_id, journey_title AS journey_pathway_title, journey_progress AS cards_completed, 
  journey_completion_progress AS completion_progress, overall_completion_status, time_completed, modified_completions, content_structure
  FROM 
  (
    SELECT user_id, user_full_name, journey_id, journey_title, journey_progress, overall_completion_status, time_completed, content_structure, 
    CAST(journey_completion_progress AS int64) AS journey_completion_progress, modified_completions
    FROM 
    (
      SELECT user_id, user_full_name, journey_id, journey_title, journey_progress, overall_completion_status, time_completed, content_structure,                
      modified_completions,
        CASE
          WHEN `journey_completion_progress`>100.0 THEN 100.0
        ELSE
        `journey_completion_progress`
      END AS journey_completion_progress
      FROM 
      (
        SELECT
          CASE
            WHEN `journey_completion_progress`= 0.98 THEN 'Completed (98)'
            WHEN `overall_completion_status`='Completed' THEN 'Completed'
          ELSE
          'Started'
        END AS modified_completions,user_id, user_full_name, journey_id, journey_title, journey_progress, `journey_completion_progress`*100 AS 
        journey_completion_progress,overall_completion_status, time_completed, content_structure
        FROM 
        (
          SELECT DISTINCT user_id, user_full_name, journey_id, journey_title, journey_progress, journey_completion_progress, 
          overall_completion_status, time_completed, content_structure, NULL AS modified_completion
          FROM
            {{ref('g4_groups_structured_journey_progression_overview_vw')}}))))
  
  UNION ALL
  
  SELECT user_id, user_full_name, pathway_id AS journey_pathway_id, pathway_title AS journey_pathway_title, pathway_progress AS cards_completed,
  completion_progress, overall_completion_status, time_completed, modified_completion, content_structure
  FROM 
  (
    SELECT  modified_completion, user_id, user_full_name, pathway_id, pathway_title, pathway_progress, overall_completion_status, time_completed, 
    CAST(completion_progress AS int64) AS completion_progress, content_structure
    FROM 
    (
      SELECT  modified_completion, user_id, user_full_name, pathway_id, pathway_title, pathway_progress, overall_completion_status, time_completed,
        CASE
          WHEN `completion_progress`>100.0 THEN 100.0
        ELSE
        `completion_progress`
      END
        AS completion_progress,
        content_structure
      FROM 
      (
        SELECT
          CASE
            WHEN `completion_progress`= 0.98 THEN 'Completed (98)'
            WHEN `overall_completion_status`='Completed' THEN 'Completed'
          ELSE
          'Started'
        END
          AS modified_completion,
          user_id, user_full_name, pathway_id, pathway_title, pathway_progress, overall_completion_status, time_completed, 
          `completion_progress`*100 AS completion_progress, content_structure
        FROM 
        (
          SELECT DISTINCT user_id, user_full_name, pathway_id, pathway_title, pathway_progress, overall_completion_status, time_completed, 
          completion_progress, content_structure, NULL AS modified_completion
          FROM
            {{ref('g4_groups_structured_pathway_progression_overview_vw')}})))))


SELECT user_id, user_full_name, content_structure, journey_pathway_id, journey_pathway_title, content_progress, completion_status, cards_completed, 
completion_progress, time_completed, completion_progress_category, current_timestamp() as etl_record_created_time
FROM 
(
  SELECT user_id, user_full_name, journey_pathway_id, journey_pathway_title, cards_completed, completion_progress, overall_completion_status, 
  time_completed, modified_completions, content_structure,
    CASE
      WHEN (`completion_progress`>=98)THEN 'Completed'
      WHEN (`completion_progress`>=80
      AND `completion_progress`< 98) THEN '80 - 98 %'
      WHEN (`completion_progress`>=60 AND `completion_progress`< 80) THEN '60 - 79 %'
      WHEN (`completion_progress`>=40
      AND `completion_progress`< 60) THEN '40 - 59 %'
      WHEN (`completion_progress`>=20 AND `completion_progress`< 40) THEN '20 - 39 %'
      WHEN (`completion_progress`< 20) THEN '1 - 19 %'
    ELSE
    'Viewed Only'
  END AS completion_progress_category,
    CASE
      WHEN `modified_completions`= 'Completed (98)' THEN 'Completed'
      WHEN `modified_completions`= 'Completed' THEN 'Completed'
    ELSE
    'Not Completed'
  END AS completion_status,
    CASE
      WHEN `modified_completions`= 'Completed (98)' THEN 'Completed'
      WHEN `modified_completions`= 'Completed' THEN 'Completed'
    ELSE
    'Started'
  END AS content_progress
  FROM (
    SELECT *, 'Viewed Only' AS completion_progress_category, 'Not Completed' AS completion_status, 'Started' AS content_progress
    FROM
      append_rows))