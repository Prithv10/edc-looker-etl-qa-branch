-- 1454_Glue Users [U][2] [Quiz & Poll Responses]
-- u2_users_quiz_and_poll_responses_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'p_week', 'data_type': 'timestamp'},
    tags=['incremental']
  )
}}

WITH 
 -- card_type_poll
 card_type_poll AS (
  SELECT time, user_id, card_id, event, poll_option_id, poll_option_label AS response, "Poll" AS card_type, 1 AS total_responses, "First Response" AS
         response_type, "Poll Response" AS is_correct, quiz_option_id
          FROM 
  (
    SELECT time, user_id, card_id, event, card_type, poll_option_id, poll_option_label,quiz_option_id, RANK() OVER
           (PARTITION BY CAST(user_id AS int64), CAST(card_id AS int64) ORDER BY time ASC) AS rank FROM 
    (
      SELECT time, CAST(user_id AS float64) AS user_id, CAST(card_id AS float64) AS card_id, event,
             card_type, is_correct, quiz_option_id, quiz_option_label, poll_option_id,
             poll_option_label FROM
        {{ ref('u0_usercards_event_vw') }}
      WHERE
        card_id IS NOT NULL
        AND user_id IS NOT NULL)
    WHERE
      event = "card_poll_response_created" QUALIFY rank = 1)),
  
  
  -- latest_response_multi_response_users
  latest_response_multi_response_users AS(
  SELECT time, user_id, card_id, event, card_type, is_correct, quiz_option_id, quiz_option_label FROM 
  (
    SELECT time, CAST(user_id AS float64) AS user_id, CAST(card_id AS float64) AS card_id, event, 
           card_type, is_correct, quiz_option_id, quiz_option_label, poll_option_id, 
           poll_option_label FROM
      {{ ref('u0_usercards_event_vw') }}
    WHERE
      card_id IS NOT NULL
      AND user_id IS NOT NULL)
  WHERE
    event = "card_quiz_response_created" ),
  
  
  -- append_rows
  append_rows AS (
    SELECT time, user_id, card_id, event, card_type, is_correct, quiz_option_id, quiz_option_label,
           response_type FROM 
    (
      SELECT * FROM 
      (
        SELECT time, user_id, card_id, event, card_type, is_correct, quiz_option_id,
               quiz_option_label, "Latest Response" AS response_type FROM 
        (
          SELECT *, RANK() OVER (PARTITION BY CAST(user_id AS int64), CAST(card_id AS int64) ORDER 
                 BY time DESC) AS rank FROM latest_response_multi_response_users QUALIFY rank = 1))
                 AS latest_response
        LEFT OUTER JOIN (
          SELECT time AS time_1, user_id AS user_id_1, card_id AS card_id_1, event AS event_1, 
                 card_type AS car_type_1, is_correct AS is_correct_1, quiz_option_id AS 
                 quiz_option_id_1, quiz_option_label AS 
                 quiz_option_label_1, "First Response" AS response_type_1 FROM 
          (
            SELECT *, RANK() OVER (PARTITION BY CAST(user_id AS int64), CAST(card_id AS int64) ORDER
                   BY time ASC) AS rank FROM latest_response_multi_response_users QUALIFY rank = 1))
                   AS first_response
        ON
          latest_response.user_id = first_response.user_id_1
          AND latest_response.card_id = first_response.card_id_1
          AND latest_response.time = first_response.time_1
        WHERE
          user_id_1 IS NULL)
  UNION ALL (
    SELECT time, user_id, card_id, event, card_type, is_correct, quiz_option_id, quiz_option_label, 
           "First Response" AS response_type FROM 
    (
      SELECT *, RANK() OVER (PARTITION BY CAST(user_id AS int64), CAST(card_id AS int64) ORDER BY 
             time ASC) AS rank FROM latest_response_multi_response_users QUALIFY rank = 1)) ),
  
  
  -- card_type_quiz
  card_type_quiz AS (
  SELECT time, CAST(user_id AS float64) AS user_id, CAST(card_id AS float64) AS card_id, event, NULL 
         AS poll_option_id, quiz_option_label AS response, CASE WHEN card_type = "poll" THEN "quiz"ELSE 
         card_type END AS card_type, total_responses,
         response_type, is_correct, quiz_option_id
  FROM (
    SELECT * FROM
      append_rows
    LEFT OUTER JOIN (
      SELECT user_id_1,card_id_1,COUNT(quiz_option_id) AS total_responses
      FROM (
        SELECT time, user_id AS user_id_1, card_id AS card_id_1, event, card_type, is_correct, quiz_option_id, quiz_option_label FROM 
        (
          SELECT time, CAST(user_id AS float64) AS user_id, CAST(card_id AS float64) AS card_id, 
                 event, card_type, is_correct, quiz_option_id, quiz_option_label, poll_option_id, 
                 poll_option_label FROM
            {{ ref('u0_usercards_event_vw') }}
          WHERE
            card_id IS NOT NULL
            AND user_id IS NOT NULL)
        WHERE
          event = "card_quiz_response_created")
      GROUP BY
        user_id_1,
        card_id_1) AS total_responses_per_quiz
    ON
      append_rows.user_id = total_responses_per_quiz.user_id_1
      AND append_rows.card_id = total_responses_per_quiz.card_id_1 ) ),
  
  
  -- append_rows_1
  append_rows_1 AS (
  SELECT * FROM
    card_type_poll
  UNION ALL
  SELECT * FROM
    card_type_quiz),
  
  
  -- select_columns_2
  select_columns_2 AS (
  SELECT time, user_id_1 AS user_id, card_id, event, card_type, response, poll_option_id, 
         is_correct, quiz_option_id, response_type, total_responses, user_full_name, email, 
         time_account_created, user_account_status, excluded_from_leaderboard FROM 
  (
    SELECT * FROM
      append_rows_1
    LEFT OUTER JOIN (
      SELECT user_id, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, 
             Time_Account_Created, sign_in_count, Time_Account_Suspended, CURRENT_TIMESTAMP() AS 
             etl_record_created_time, user_id AS user_id_1 FROM
        {{ ref('u1_users_latest_metadata_vw') }} ) AS u1_latest_metadata
    ON
      append_rows_1.user_id = u1_latest_metadata.user_id_1) )


-- select_columns_3
SELECT time, user_id, card_id, event, card_type, response, poll_option_id, quiz_option_id, 
       response_type, total_responses, user_full_name, email, time_account_created, 
       user_account_status, excluded_from_leaderboard, CASE WHEN is_correct = "true" THEN 
       "Correct"WHEN is_correct = "false" THEN "Incorrect"ELSE is_correct END AS is_correct, 
       card_resource_url, card_state, card_subtype, card_title, ecl_source_name, is_public, 
       content_structure, current_content_owner_id AS card_author_id, card_author_full_name, 
       card_level, average_rating, standard_card_type, published_at, current_content_owner_full_name,
       timestamp_trunc(`Time`, week) as p_week FROM 
(
  SELECT * FROM 
  (
    SELECT time, user_id, card_id, event, card_type, response, poll_option_id, is_correct, 
           quiz_option_id, response_type, total_responses, user_full_name, email, 
           time_account_created, user_account_status, excluded_from_leaderboard
           FROM select_columns_2) select_columns_2_1
    LEFT OUTER JOIN (
      SELECT card_id AS card_id_1, current_content_owner_id, current_content_owner_full_name,
             card_state, card_subtype, card_type AS card_type_1, ecl_id, ecl_source_name, is_public, 
             Duration_HHMM, Duration_seconds, published_at, card_title, created_at, updated_at, 
             card_level, average_rating, standard_card_type, card_resource_url, content_structure, 
             author_id, card_author_full_name, etl_record_created_time
      FROM
        {{ ref('c1_content_latest_metadata_vw') }}) AS c1_latest_metadata
    ON
      select_columns_2_1.card_id = c1_latest_metadata.card_id_1)