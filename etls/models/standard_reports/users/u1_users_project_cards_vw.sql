  -- 1454_Glue Users [U][1] [Project Cards]
  -- u1_users_project_cards_vw 
  
WITH
  select_columns_2 AS(
      -- SELECT COLUMNS 2
  SELECT
    Time, card_id, event, changed_column, old_value, new_value AS grade, user_id_1 AS submitter_id, user_id AS grader_id, project_card_submission_id, project_card_submission_url
  FROM (
      -- SELECT COLUMNS 3
    SELECT
      Time, card_id, user_id, CASE WHEN event ='card_submission_grade_edited' THEN 'card_submission_graded' ELSE event END AS event, project_card_submission_id, changed_column, 
      old_value, new_value, project_card_submission_url
    FROM (
      SELECT
        *,
        RANK() OVER(PARTITION BY project_card_submission_id ORDER BY Time DESC) AS rank1
      FROM (
        SELECT
          Time, card_id, user_id, event, project_card_submission AS project_card_submission_url, project_card_submission_id, changed_column, old_val AS old_value, new_val AS 
          new_value, grade_range, grader_type, grading_system, submitter_type
        FROM
          {{ref('u0_usercards_event_vw')}}
        WHERE
          event IN ('card_submission_created',
            'card_submission_deleted',
            'card_submission_graded',
            'card_submission_grade_edited')
          AND project_card_submission_id IS NOT NULL)
        QUALIFY rank1 = 1)WHERE event != 'card_submission_deleted' ) graded_edited
        -- JOIN DATA
  INNER JOIN (
      -- SELECT COLUMNS 1
    SELECT
      project_card_submission_id AS project_card_submission_id_1,
      user_id AS user_id_1
    FROM (
      SELECT
        *,
        RANK() OVER(PARTITION BY project_card_submission_id ORDER BY Time ASC) AS rank1
      FROM (
        SELECT
          Time, card_id, user_id, event, project_card_submission AS project_card_submission_url, project_card_submission_id, changed_column, old_val AS old_value, new_val AS 
          new_value, grade_range, grader_type, grading_system, submitter_type
        FROM
          {{ref('u0_usercards_event_vw')}}
        WHERE
          event IN ('card_submission_created',
            'card_submission_deleted',
            'card_submission_graded',
            'card_submission_grade_edited')
          AND project_card_submission_id IS NOT NULL) QUALIFY rank1 = 1)) select_columns_1
  ON
    graded_edited.project_card_submission_id = select_columns_1.project_card_submission_id_1),

  append_rows AS(
  SELECT
    *,
    'Submitted' AS submission_status
  FROM
    select_columns_2
  WHERE
    event = 'card_submission_created'
  UNION ALL
  SELECT
    *,
    'Graded' AS submission_status
  FROM
    select_columns_2
  WHERE
    event = 'card_submission_graded'),


  set_column_type AS(
  SELECT
    Time, CAST(card_id AS float64) AS card_id, event, changed_column, old_value, submitter_id, grader_id, submission_status, grade, grade_range, grader_type, grading_system, 
    submitter_type, project_card_submission_id, project_card_submission_url
  FROM (
    SELECT
      Time, card_id, event, changed_column, old_value, submitter_id, grader_id, submission_status, grade, project_card_submission_id, project_card_submission_url
    FROM
      append_rows) select_columns_4
      -- JOIN DATA 5
  LEFT OUTER JOIN (
    SELECT
      card_id AS card_id_1, grade_range, grader_type, grading_system, submitter_type
    FROM (
      SELECT
        Time, card_id, user_id, event, project_card_submission AS project_card_submission_url, project_card_submission_id, changed_column, old_val AS old_value, new_val AS new_value, 
        grade_range, grader_type, grading_system, submitter_type
      FROM
        {{ref('u0_usercards_event_vw')}}
      WHERE
        event = 'card_created_with_project'
        AND grade_range IS NOT NULL)) all_project_cards
  ON
    select_columns_4.card_id = all_project_cards.card_id_1)

    
  -- SELECT COLUMNS 8
SELECT
  Time, card_id, event, grade_range, grader_type, grading_system, project_card_submission_id, submitter_type, changed_column, old_value, submitter_id, grader_id, submission_status, 
  grade, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name,   is_public,  
  content_structure, card_author_id,  card_author_full_name, submitter_full_name, email, time_account_created, sign_in_count, user_account_status, 
  excluded_from_leaderboard, user_full_name AS grader_full_name, project_card_submission_url, card_level, average_rating, standard_card_type, published_at, external_id, 
  current_content_owner_full_name
FROM (
    -- SELECT COLUMNS 6
  SELECT
    Time, card_id, event, grade_range, grader_type, grading_system, project_card_submission_id, submitter_type, changed_column, old_value, submitter_id, CAST(grader_id AS float64) AS 
    grader_id, submission_status, grade, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name,   is_public, 
     content_structure, card_author_id,  card_author_full_name, user_full_name AS submitter_full_name, email, time_account_created, sign_in_count, 
    user_account_status, excluded_from_leaderboard, project_card_submission_url, card_level, average_rating, standard_card_type, published_at, external_id, 
    current_content_owner_full_name
  FROM (
    SELECT
      Time, card_id, event, grade_range, grader_type, grading_system, project_card_submission_id, submitter_type, changed_column, old_value, CAST(submitter_id AS float64) AS 
      submitter_id, grader_id, submission_status, grade, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name,   
      is_public,  content_structure, card_author_id,  card_author_full_name, project_card_submission_url, card_level, average_rating, 
      standard_card_type, published_at, current_content_owner_full_name
    FROM
      set_column_type
      -- JOIN DATA 1
    LEFT OUTER JOIN (
      SELECT
        CAST(card_id AS float64) AS card_id_1, author_id, card_author_full_name, card_state,  card_subtype, card_type, ecl_id, ecl_source_name, is_public, 
        Duration_HHMM, Duration_seconds, published_at, card_title, created_at, updated_at, card_level, average_rating, standard_card_type, card_resource_url,  
          current_content_owner_full_name, content_structure, current_content_owner_id AS card_author_id
      FROM
        {{ref('c1_content_latest_metadata_vw')}}) set_column_type_1
    ON
      set_column_type.card_id = set_column_type_1.card_id_1) set_column_type_2
    -- JOIN DATA 2
  LEFT OUTER JOIN
    {{ref('u1_users_latest_metadata_vw')}} u1_latest
  ON
    set_column_type_2.submitter_id = u1_latest.user_id) set_column_type_3
  -- JOIN DATA 3
LEFT OUTER JOIN (
  SELECT
    user_id, user_full_name
  FROM
    {{ref('u1_users_latest_metadata_vw')}}) select_columns_7
ON
  set_column_type_3.grader_id = select_columns_7.user_id