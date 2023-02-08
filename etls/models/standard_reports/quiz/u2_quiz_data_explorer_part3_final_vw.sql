  -- u2_quiz_data_explorer_part3_final_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'p_week', 'data_type': 'timestamp'},
    cluster_by = ["event"],
    tags=['incremental']
  )
}}

WITH
  select_columns_21 AS(
  SELECT
    card_id, quiz_attempt_id, quiz_id, quiz_question_id, changed_column, quiz_question_label, user_id, 
    quiz_reanswerable, quiz_passing_criteria, total_quiz_attempts, Time, event, quiz_attempt_passed, 
    quiz_questions_passed
  FROM
    {{ref('u2_quiz_data_explorer_part1_vw')}} select_columns_7
    -- join data 5
  INNER JOIN (
    SELECT
      quiz_id AS quiz_id_1, quiz_reanswerable, quiz_passing_criteria
    FROM
      {{ref('u2_quiz_data_explorer_part2_vw')}}) select_columns_20
  ON
    select_columns_7.quiz_id = select_columns_20.quiz_id_1),

  append_rows AS(
  SELECT
    Time, CAST(card_id AS float64) AS card_id, CAST(user_id AS float64) AS user_id, quiz_passing_criteria, 
    new_val AS new_value, quiz_option_id, event, quiz_reanswerable, quiz_option_label, quiz_attempt_id, 
    quiz_attempt_passed, quiz_option_is_correct, quiz_id, quiz_question_id, changed_column, title AS 
    card_title, quiz_question_label, quiz_questions_passed_count AS quiz_questions_passed
  FROM
    {{ref('u0_usercards_event_vw')}}
    -- quiz reanswer
  WHERE
    event ='card_quiz_question_response_edited'
    AND changed_column = 'response'
  UNION ALL
  SELECT
    Time, CAST(card_id AS float64) AS card_id, CAST(user_id AS float64) AS user_id, quiz_passing_criteria, 
    new_val AS new_value, quiz_option_id, event, quiz_reanswerable, quiz_option_label, quiz_attempt_id, 
    quiz_attempt_passed, quiz_option_is_correct, quiz_id, quiz_question_id, changed_column, title AS 
    card_title, quiz_question_label, quiz_questions_passed_count AS quiz_questions_passed
  FROM
    {{ref('u0_usercards_event_vw')}}
    -- quiz response
  WHERE
    event ='card_quiz_question_response_created'),


  select_columns_2 AS(
  SELECT
    Time, card_id, event, quiz_option_id, quiz_option_label, quiz_option_is_correct, quiz_question_id, 
    CAST(user_id AS float64) AS user_id, quiz_id, rank1
  FROM (
    SELECT
      Time, card_id, event, quiz_option_id, quiz_option_label, quiz_option_is_correct, quiz_question_id, 
      user_id, quiz_id, RANK() OVER(PARTITION BY CAST(user_id AS int64), quiz_id, quiz_question_id ORDER 
      BY Time DESC) AS rank1
    FROM
      append_rows QUALIFY rank1 = 1)),
      
  append_rows_4 AS(
  SELECT
    Time, card_id, event, quiz_option_id, quiz_reanswerable, quiz_option_label, quiz_attempt_id, 
    quiz_attempt_passed, quiz_option_is_correct, quiz_id, quiz_question_id, user_id, quiz_question_label, 
    quiz_passing_criteria, total_quiz_attempts, quiz_questions_passed
  FROM
    select_columns_2
    -- JOIN DATA 2
  LEFT OUTER JOIN (
    SELECT
      card_id AS card_id_1, quiz_attempt_id, quiz_id AS quiz_id_1, quiz_question_id AS quiz_question_id_1, 
      changed_column, quiz_question_label, user_id AS user_id_1, quiz_reanswerable, quiz_passing_criteria, 
      total_quiz_attempts, Time AS time_1, event AS event_1, quiz_attempt_passed, quiz_questions_passed
    FROM
      select_columns_21) select_columns_21
  ON
    select_columns_2.quiz_question_id = select_columns_21.quiz_question_id_1
    AND select_columns_2.user_id = select_columns_21.user_id_1
  UNION ALL
  SELECT
    Time, card_id, event, quiz_option_id, quiz_reanswerable, quiz_option_label, quiz_attempt_id, 
    quiz_attempt_passed, quiz_option_is_correct, quiz_id, quiz_question_id, user_id, quiz_question_label, 
    quiz_passing_criteria, total_quiz_attempts, quiz_questions_passed
  FROM
    select_columns_21
    -- JOIN DATA 7
  LEFT OUTER JOIN (
    SELECT
      Time AS time_1, card_id AS card_id_1, event AS event_1, quiz_option_id, quiz_option_label, 
      quiz_option_is_correct, quiz_question_id AS quiz_question_id_1, user_id AS user_id_1, quiz_id AS 
      quiz_id_1
    FROM
      select_columns_2) select_columns_2
  ON
    select_columns_21.quiz_id = select_columns_2.quiz_id_1
    AND select_columns_21.user_id = select_columns_2.user_id_1
  WHERE
    quiz_question_id_1 IS NULL)
  -- FINAL
  -- select columns 4
SELECT
  Time, card_id, event, quiz_option_id, quiz_reanswerable, quiz_option_label, quiz_attempt_id, 
  quiz_attempt_passed, quiz_option_is_correct, quiz_id, quiz_question_id, user_id, card_resource_url, 
  card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, is_public, content_structure, 
  card_author_id, card_author_full_name, user_full_name, email, time_account_created, user_account_status, 
  excluded_from_leaderboard, quiz_question_label, quiz_passing_criteria, total_quiz_attempts, 
  quiz_questions_passed, card_level, average_rating, published_at, standard_card_type, external_id, 
  current_content_owner_full_name,timestamp_trunc(`Time`, week) as p_week
FROM (
    -- select columns 3
  SELECT
    Time, card_id, event, quiz_option_id, quiz_reanswerable, quiz_option_label, quiz_attempt_id, 
    quiz_attempt_passed, quiz_option_is_correct, quiz_id, quiz_question_id, user_id, card_resource_url, 
    card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, is_public, 
    content_structure, card_author_id, card_author_full_name, quiz_question_label, 
    quiz_passing_criteria, total_quiz_attempts, quiz_questions_passed, card_level, average_rating, 
    standard_card_type, published_at, current_content_owner_full_name
  FROM (
    SELECT
      DISTINCT Time, card_id, event, quiz_option_id, 
      CASE WHEN quiz_reanswerable = 'true' THEN 'Y'WHEN quiz_reanswerable = 'false' THEN 'N'ELSE 
      quiz_reanswerable END AS quiz_reanswerable, 
      CASE WHEN quiz_option_label IS NULL THEN 'Submitted without Quiz Response'ELSE quiz_option_label END 
      AS quiz_option_label, quiz_attempt_id, 
      CASE WHEN quiz_attempt_passed = 'true' THEN 'Passed'WHEN quiz_attempt_passed = 'false' THEN 
      'Failed'ELSE quiz_attempt_passed END AS quiz_attempt_passed, 
      CASE WHEN quiz_option_is_correct IS NULL THEN 'N'WHEN quiz_option_is_correct = 'false' THEN 'N'WHEN 
      quiz_option_is_correct = 'true' THEN 'Y'ELSE quiz_option_is_correct END AS quiz_option_is_correct, 
      quiz_id, quiz_question_id, user_id, quiz_question_label, quiz_passing_criteria, 
      CASE WHEN total_quiz_attempts IS NULL THEN 1 ELSE total_quiz_attempts END AS total_quiz_attempts, 
      quiz_questions_passed
    FROM
      append_rows_4) quiz_pass_fail
  LEFT OUTER JOIN (
    SELECT
      card_id AS card_id_1, author_id, card_author_full_name, card_state, card_subtype, card_type, ecl_id, 
      ecl_source_name, is_public, Duration_HHMM, Duration_seconds, published_at, card_title, created_at, 
      updated_at, card_level, average_rating, standard_card_type, card_resource_url, 
      current_content_owner_full_name, content_structure, current_content_owner_id as card_author_id/*
content_status has same data as card_state 
is_card_promoted, is_live_stream, is_user_generated, content_status removed in c1_content_latest_metadata_vw 
Need to check card_author_id (author_id is renamed to current_content_owner_id in c1_content_latest_metadata_vw)
*/
    FROM
      {{ref('c1_content_latest_metadata_vw')}}) c1_latest
  ON
    quiz_pass_fail.card_id = c1_latest.card_id_1) join_data_1_select_column_3
LEFT OUTER JOIN (
  SELECT
    user_id AS user_id_1, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, 
    Time_Account_Created, sign_in_count, time_account_suspended, external_id
  FROM
    {{ref('u1_users_latest_metadata_vw')}}) u1_latest
ON
  join_data_1_select_column_3.user_id = u1_latest.user_id_1