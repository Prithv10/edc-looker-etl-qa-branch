  -- 1454_Glue_Quiz[U][2][Data Explorer]
  -- u2_quiz_data_explorer_part1_vw
WITH
  select_columns AS(
  SELECT
    Time, CAST(card_id AS float64) AS card_id, CAST(user_id AS float64) AS user_id, quiz_passing_criteria, 
    new_val AS new_value, quiz_option_id, event, quiz_reanswerable, quiz_option_label, quiz_attempt_id, 
    quiz_attempt_passed, quiz_option_is_correct, quiz_id, quiz_question_id, changed_column, title AS card_title, 
    quiz_question_label, quiz_questions_passed_count AS quiz_questions_passed
  FROM
    {{ref('u0_usercards_event_vw')}}),

  select_columns_26 AS(
  SELECT
    Time, card_id, event, quiz_id, quiz_attempt_id, user_id, total_quiz_attempts, quiz_attempt_passed, 
    quiz_questions_passed
  FROM (
      -- total quiz attempts
    SELECT
      user_id AS user_id_1, quiz_id AS quiz_id_1, total_quiz_attempts
    FROM (
      SELECT
        user_id, quiz_id, COUNT(DISTINCT Time) AS total_quiz_attempts
      FROM (
        SELECT
          *
        FROM
          select_columns
        WHERE
          event = 'card_quiz_attempt_response_edited'
          OR event = 'card_quiz_attempt_response_created')
      GROUP BY
        user_id,
        quiz_id)) total_quiz_attempts_1
        -- join data 6 
  LEFT OUTER JOIN (
      -- select columns 8 
    SELECT
      Time, card_id, event, quiz_id, quiz_attempt_id, user_id, quiz_attempt_passed, quiz_questions_passed
    FROM
      select_columns
    WHERE
      event = 'card_quiz_attempt_response_created') select_columns_8
  ON
    select_columns_8.quiz_id = total_quiz_attempts_1.quiz_id_1
    AND select_columns_8.user_id = total_quiz_attempts_1.user_id_1),


  select_columns_9 AS(
  SELECT
    Time, card_id, quiz_attempt_id, quiz_id, quiz_question_id, changed_column, quiz_question_label, event, 
    new_value
  FROM (
    SELECT
      Time, card_id, quiz_attempt_id, quiz_id, quiz_question_id, changed_column, quiz_question_label, event, 
      new_value, RANK() OVER(PARTITION BY quiz_id, quiz_question_id ORDER BY Time DESC) AS rank1
    FROM (
      SELECT
        Time, card_id, quiz_attempt_id, quiz_id, quiz_question_id, changed_column, quiz_question_label, event, 
        new_value
      FROM
        select_columns
      WHERE
        event IN ('card_quiz_question_created',
          'card_quiz_question_edited',
          'card_quiz_question_deleted'))
      QUALIFY rank1 = 1)
      WHERE event != 'card_quiz_question_deleted' )
-- Select columns 7 
SELECT
  card_id, quiz_attempt_id, quiz_id, quiz_question_id, changed_column, quiz_question_label, user_id, 
  total_quiz_attempts, Time, event, quiz_attempt_passed, quiz_questions_passed
FROM (
  SELECT
    Time,
    card_id, quiz_attempt_id, quiz_id, quiz_question_id, changed_column, quiz_question_label
  FROM
    select_columns_9
  WHERE
    event = 'card_quiz_question_created'
    -- append rows 1 
  UNION ALL
  SELECT
    Time, card_id, quiz_attempt_id, quiz_id, quiz_question_id, changed_column, new_value AS quiz_question_label
  FROM
    select_columns_9
  WHERE
    event = 'card_quiz_question_edited') select_columns_12
    -- inner join - to get user submitted questions
INNER JOIN (
  SELECT
    Time AS time_1, card_id AS card_id_1, event, quiz_id AS quiz_id_1, quiz_attempt_id AS quiz_attempt_id_1, 
    user_id, total_quiz_attempts, quiz_attempt_passed, quiz_questions_passed
  FROM
    select_columns_26) select_columns_26_1
ON
  select_columns_12.quiz_id = select_columns_26_1.quiz_id_1