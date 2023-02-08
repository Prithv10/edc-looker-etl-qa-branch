-- 1603_ Users [U][1] [Completions]
-- u1_users_completions

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    tags=['incremental']
  )
}}

WITH set_column_type_1 AS (
  SELECT CAST(user_id AS float64) AS user_id,CAST(card_id AS float64) AS card_id, time, 'card_marked_as_complete' AS event, 'web' AS platform, 'not captured' AS user_agent
  FROM ((
      SELECT CAST(user_id AS int64) AS user_id, CAST(card_id AS int64) AS card_id, time
      FROM (
        SELECT user_id, completable_id AS card_id, completed_at AS time
        FROM (
          SELECT user_id, completable_id, completed_at, completed_percentage, updated_at
          FROM (
            SELECT * FROM
              {{ref('user_content_completions_dim_0_vw')}}
            WHERE
              completed_at IS NOT NULL)
          UNION ALL
          SELECT user_id, completable_id, updated_at AS completed_at, completed_percentage, completed_at AS updated_at
          FROM (
            SELECT * FROM
              {{ref('user_content_completions_dim_0_vw')}}
            WHERE
              completed_at IS NULL)))) AS card_user_id_decimal1
    LEFT OUTER JOIN (
      SELECT time AS time_1, CAST(card_id AS int64) AS card_id_1, platform, user_agent, event, CAST(user_id AS int64) AS user_id_1
      FROM (
        SELECT *, RANK() OVER (PARTITION BY card_id, user_id ORDER BY TIME DESC) AS rankcol
        FROM (
          SELECT time, card_id, platform, user_agent, event, user_id
          FROM
            {{ref('u0_usercards_event_vw')}}
          WHERE
            event = 'card_marked_as_complete'
            OR event = 'card_marked_as_uncomplete') QUALIFY rankcol=1)
      WHERE
        event = 'card_marked_as_complete'
        AND card_id IS NOT NULL) AS set_column_type
    ON
      card_user_id_decimal1.user_id = set_column_type.user_id_1
      AND card_user_id_decimal1.card_id = set_column_type.card_id_1)
  WHERE
    card_id IS NOT NULL
    AND user_id_1 IS NULL),
  
  set_column_type_2 AS (
  SELECT CAST(user_id AS float64) AS user_id, CAST(card_id AS float64) AS card_id, time_1 AS time, event, platform, user_agent
  FROM ((
      SELECT CAST(user_id AS int64) AS user_id, CAST(card_id AS int64) AS card_id, time
      FROM (
        SELECT user_id, completable_id AS card_id, completed_at AS time
        FROM (
          SELECT user_id, completable_id, completed_at, completed_percentage, updated_at
          FROM (
            SELECT * FROM
              {{ref('user_content_completions_dim_0_vw')}}
            WHERE
              completed_at IS NOT NULL)
          UNION ALL
          SELECT user_id, completable_id, updated_at AS completed_at, completed_percentage, completed_at AS updated_at
          FROM (
            SELECT * FROM
              {{ref('user_content_completions_dim_0_vw')}}
            WHERE
              completed_at IS NULL)))) AS card_user_id_decimal1
    LEFT OUTER JOIN (
      SELECT time AS time_1, CAST(card_id AS int64) AS card_id_1, platform, user_agent, event, CAST(user_id AS int64) AS user_id_1
      FROM (
        SELECT *, RANK() OVER (PARTITION BY card_id, user_id ORDER BY TIME DESC) AS rankcol
        FROM (
          SELECT time, card_id, platform, user_agent, event, user_id
          FROM
            {{ref('u0_usercards_event_vw')}}
          WHERE
            event = 'card_marked_as_complete'
            OR event = 'card_marked_as_uncomplete') QUALIFY rankcol=1)
      WHERE
        event = 'card_marked_as_complete'
        AND card_id IS NOT NULL) AS set_column_type
    ON
      card_user_id_decimal1.user_id = set_column_type.user_id_1
      AND card_user_id_decimal1.card_id = set_column_type.card_id_1)
  WHERE
    card_id IS NOT NULL
    AND card_id_1 IS NOT NULL)

SELECT time, card_id, event, user_id, platform, user_agent, 'Total Completions' AS performance_metric, Current_timestamp() as etl_record_created_time
FROM (
  SELECT * FROM set_column_type_1
  UNION ALL
  SELECT  * FROM set_column_type_2)
