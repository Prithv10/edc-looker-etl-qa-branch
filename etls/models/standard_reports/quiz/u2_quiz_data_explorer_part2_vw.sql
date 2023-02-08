  -- u2_quiz_data_explorer_part2_vw
WITH
  select_columns AS(
  SELECT
    Time, CAST(card_id AS float64) AS card_id, CAST(user_id AS float64) AS user_id, 
    quiz_passing_criteria, new_val AS new_value, quiz_option_id, event, quiz_reanswerable, 
    quiz_option_label, quiz_attempt_id, quiz_attempt_passed, quiz_option_is_correct, quiz_id, 
    quiz_question_id, changed_column, title AS card_title, quiz_question_label, 
    quiz_questions_passed_count AS quiz_questions_passed
  FROM
    {{ref('u0_usercards_event_vw')}}),


  join_data_3 AS (
  SELECT
    *
  FROM (
      -- select columns 13
    SELECT
      quiz_id, event, quiz_passing_criteria, CASE WHEN quiz_reanswerable = '0' THEN 'false'WHEN 
      quiz_reanswerable = '1' THEN 'true'ELSE quiz_reanswerable END AS quiz_reanswerable
    FROM
      select_columns
    WHERE
      event = 'card_quiz_created') select_columns_13
      -- join data 3 
  LEFT OUTER JOIN (
      -- select columns 16
    SELECT
      quiz_id AS quiz_id_1, quiz_passing_criteria AS quiz_passing_criteria_1
    FROM (
      SELECT
        quiz_id, new_value AS quiz_passing_criteria, RANK() OVER(PARTITION BY quiz_id ORDER BY 
        Time DESC) AS rank1
      FROM (
        SELECT
          Time, quiz_id, event, changed_column, new_value
        FROM
          select_columns
        WHERE
          event ='card_quiz_deleted'
          AND changed_column ='passing_criteria') QUALIFY rank1 = 1)) select_columns_17
  ON
    select_columns_13.quiz_id = select_columns_17.quiz_id_1),


  append_rows_2 AS(
  SELECT
    quiz_id, quiz_passing_criteria, quiz_reanswerable
  FROM
    join_data_3
  WHERE
    quiz_id_1 IS NULL
  UNION ALL
  SELECT
    quiz_id, quiz_passing_criteria_1 as quiz_passing_criteria, quiz_reanswerable
  FROM
    join_data_3
  WHERE
    quiz_id_1 IS NOT NULL),


  select_columns_16 AS(
  SELECT
    quiz_id AS quiz_id_1,
    new_value AS quiz_reanswerable_1
  FROM (
    SELECT
      Time, quiz_id, event, changed_column, new_value, RANK() OVER(PARTITION BY quiz_id ORDER 
      BY Time DESC) AS rank1
    FROM (
        -- select columns 15
      SELECT
        Time, quiz_id, event, changed_column, new_value
      FROM
        select_columns
      WHERE
        event ='card_quiz_edited'
        AND changed_column = 'reanswerable') QUALIFY rank1 = 1)),

  join_data_4 AS (
  SELECT
    *
  FROM
    append_rows_2
  LEFT OUTER JOIN
    select_columns_16
  ON
    append_rows_2.quiz_id = select_columns_16.quiz_id_1),


  append_rows_3 AS(
  SELECT
    quiz_id, quiz_reanswerable, quiz_passing_criteria
  FROM
    join_data_4
  WHERE
    quiz_id_1 IS NULL
  UNION ALL
  SELECT
    quiz_id, quiz_reanswerable_1 AS quiz_reanswerable, quiz_passing_criteria
  FROM
    join_data_4
  WHERE
    quiz_id_1 IS NOT NULL)
    
SELECT
  quiz_id, quiz_reanswerable, quiz_passing_criteria
FROM
  append_rows_3