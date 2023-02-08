  -- 1454_Glue_Users [U][2][Scorm Data Explorer]
  -- u2_users_scorm_data_explorer_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'p_week', 'data_type': 'timestamp'},
    cluster_by = ["user_id","event"],
    tags=['incremental']
  )
}}

SELECT
  Time, Card_ID, Event, User_ID, Scorm_Attempts, Scorm_Course_ID, Scorm_Registration_Success, Scorm_Score, 
  Scorm_Total_Seconds_Tracked, Scorm_Registration_Status, performance_metric, User_Full_Name, 
  User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, card_state, card_title, card_type, 
  content_structure, card_author_id, card_author_full_name, card_resource_url, 
  card_subtype, ecl_id, ecl_source_name,  is_public,  
  Duration_seconds, Duration_HHMM, card_level, average_rating, standard_card_type, published_at, external_id, 
  current_content_owner_full_name,timestamp_trunc(`Time`, week) as p_week
FROM (
  SELECT
    Time, Card_ID, Event, User_ID, Scorm_Attempts, Scorm_Course_ID, Scorm_Registration_Success, Scorm_Score, 
    Scorm_Total_Seconds_Tracked, Scorm_Registration_Status, performance_metric, User_Full_Name, 
    User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, external_id
  FROM (
    SELECT
      Time, Card_ID, Event, User_ID, Scorm_Attempts, Scorm_Course_ID, Scorm_Registration_Success, Scorm_Score, 
      Scorm_Total_Seconds_Tracked, Scorm_Registration_Status, 'Scorm Card Status' AS performance_metric
    FROM (
      SELECT
        Time, Card_ID, Event, User_ID, Scorm_Attempts, Scorm_Course_ID, Scorm_Registration_Success, Scorm_Score, 
        Scorm_Total_Seconds_Tracked, Scorm_Registration_Status, RANK() OVER(PARTITION BY User_ID, Card_ID ORDER 
        BY Time DESC) AS rank1
      FROM (
        SELECT
          card_id AS Card_ID, event AS Event, user_id AS User_ID, platform AS Platform, attributes AS 
          attributes, Time, scorm_attempts AS Scorm_Attempts, scorm_course_id AS Scorm_Course_ID, 
          scorm_registration_completion AS Scorm_Registration_Status, scorm_total_seconds_tracked AS 
          Scorm_Total_Seconds_Tracked, scorm_score AS Scorm_Score, scorm_registration_success AS 
          Scorm_Registration_Success
        FROM
          {{ref('u0_usercards_event_vw')}}
        WHERE
          Event = 'card_scorm_started'
          OR Event = 'card_scorm_completed') QUALIFY rank1 = 1)) add_constants
  LEFT OUTER JOIN (
    SELECT
      user_id AS user_id_1, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, 
      Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id
    FROM
      {{ref('u1_users_latest_metadata_vw')}}) u1_users
  ON
    add_constants.User_ID = u1_users.user_id_1) select_columns_1
LEFT OUTER JOIN (
  SELECT
    card_id AS card_id_1, author_id, card_author_full_name, card_state, card_subtype, card_type, 
    ecl_id, ecl_source_name, is_public, Duration_HHMM, Duration_seconds, published_at, card_title, created_at, 
    updated_at, card_level, average_rating, standard_card_type, card_resource_url, 
    current_content_owner_full_name, current_content_owner_id as card_author_id, content_structure
  FROM
    {{ref('c1_content_latest_metadata_vw')}}) c1_metadata
ON
  select_columns_1.Card_ID = c1_metadata.card_id_1