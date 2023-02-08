-- u1_users_total_unique_views
-- 1603_Users [U][1] [Total Unique Views]

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    tags=['incremental']
  )
}}

SELECT DISTINCT time, CAST(card_id AS float64) AS card_id, event, CAST(user_id AS float64) AS user_id, platform, user_agent, 'Total Unique Card Views' AS performance_metric, current_timestamp() as etl_record_created_time
FROM (
  SELECT *, RANK() OVER (PARTITION BY card_id, user_id ORDER BY TIME ASC) AS rankcol
  FROM (
    SELECT
      event, card_id, attributes, platform, user_agent, time, user_id
    FROM
      {{ref('u0_usercards_event_vw')}}
    WHERE
      card_id IS NOT NULL
      AND user_id IS NOT NULL
      AND event = 'card_viewed'
      AND attributes IS NULL
      OR attributes IN ("standalone")) QUALIFY rankcol=1)