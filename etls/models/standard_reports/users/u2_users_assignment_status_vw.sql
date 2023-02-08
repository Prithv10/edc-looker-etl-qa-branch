-- 1454_Glue_Users [U][2] [Assignment Status] 
-- u2_users_assignment_status_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}


 
WITH select_column_4 AS (
  SELECT User_Full_Name, User_ID, Email, Assignor_ID,
    CASE
      WHEN Assignment_State = 'assigned' THEN 'not started'
    ELSE
    Assignment_State END AS Assignment_State, Time_Assignment_Started, Time_Completed, Assignment_Due_Date, Time_Assignment_Created, Card_ID, card_state, card_title, card_type,  content_structure, card_author_id, card_author_full_name, card_resource_url,  card_subtype, ecl_id, ecl_source_name,  is_public,  duration_seconds, Duration_HHMM, User_Account_Status, Excluded_From_Leaderboard, card_level, average_rating, standard_card_type, published_at, External_ID, current_content_owner_full_name, 'Assigned to Individual' as Assignment_Type,
    CASE
      WHEN Assignor_Full_Name IS NULL THEN 'Not Available'
    ELSE
      Assignor_Full_Name
    END AS Assignor_Full_Name
  
  FROM(
    select * FROM 
  (
      -- select column 3
      SELECT User_Full_Name, User_ID, Email, Assignable_ID, Assignor_ID, Assignment_state, Time_Assignment_Started, Time_Completed, Assignment_Due_Date,  Time_Assignment_Created, User_Full_Name_1 as Assignor_Full_Name, User_Account_Status, Excluded_From_Leaderboard, External_ID FROM (
        SELECT * FROM
      -- select column 1
          (
          SELECT User_Full_Name, User_ID, Email, Assignable_ID, Assignor_ID, Assignment_State, Time_Assignment_Started, Time_Completed, Assignment_Due_Date, Time_Assignment_Created, Time_Account_Created, User_Account_Status, Excluded_From_Leaderboard, External_ID FROM (
            SELECT * FROM
              -- set column type
              (
              SELECT CAST(User_ID AS float64) AS User_ID, CAST(Assignable_ID AS float64) AS Assignable_ID, CAST(Assignor_ID AS float64) AS Assignor_ID, assignment_state AS Assignment_State, time_assignment_started AS Time_Assignment_Started, time_completed AS Time_Completed, assignment_due_date AS Assignment_Due_Date, time_assignment_created AS Time_Assignment_Created FROM
      -- select column
                (
                SELECT card_id AS Assignable_ID, assignor_id AS Assignor_ID, assigned_user_id AS User_ID, assignment_state AS Assignment_State, time_assignment_started AS Time_Assignment_Started, time_completed AS Time_Completed, assignment_due_date AS Assignment_Due_Date, time_assignment_created AS Time_Assignment_Created FROM
                  {{ ref('u0_user_assignment_performance_i_vw') }} )) select_column
-- Join data
            
            INNER JOIN
            
              -- set column type 1
              (
              SELECT CAST(user_id AS float64) AS User_ID_1, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, sign_in_count, Time_Account_Suspended, External_ID FROM
                {{ ref('u1_users_latest_metadata_vw') }} ) set_column_type_1
            ON
              select_column.User_ID = set_column_type_1.User_ID_1 ))select_column_1
-- Join data 1
        
        LEFT OUTER JOIN
        
      -- select column 2
          (
          SELECT User_ID AS User_ID_1, User_Full_Name AS User_Full_Name_1 FROM 
          (
            SELECT  CAST(user_id AS float64) AS User_ID, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, sign_in_count, Time_Account_Suspended, External_ID FROM
              {{ ref('u1_users_latest_metadata_vw') }} ) ) select_column_2
        ON
          select_column_1.Assignor_ID = select_column_2.User_ID_1 ))select_column_3
-- join data 2
    
    LEFT OUTER JOIN (
    
      SELECT CAST(Card_ID AS float64) AS Card_ID, author_id, card_author_full_name, current_content_owner_id AS card_author_id, card_resource_url, Duration_HHMM, current_content_owner_full_name, card_state, content_structure, card_subtype, card_type, ecl_id, ecl_source_name, is_public, Duration_seconds, published_at, card_title, created_at, updated_at, card_level, average_rating, standard_card_type FROM
        {{ ref('c1_content_latest_metadata_vw') }} )set_column_type_2
    ON
      select_column_3.Assignable_ID = set_column_type_2.Card_ID ))
 
-- append rows
SELECT *,current_timestamp() AS etl_record_created_time FROM 
( 
    SELECT *, '1. Not Started' AS Assignment_Progression FROM select_column_4
    WHERE Assignment_State = 'not started'
    
    UNION ALL
    
    SELECT *, '2. Started' AS Assignment_Progression FROM select_column_4
    WHERE Assignment_State = 'started'
    
    UNION ALL
    
    SELECT *, '3. Completed' AS Assignment_Progression FROM select_column_4
    WHERE Assignment_State = 'completed'
    
    UNION ALL
    
    SELECT *, '4. Dismissed' AS Assignment_Progression FROM select_column_4
    WHERE Assignment_State = 'dismissed' )
 

