-- 1454_Glue_Groups [G][3] [Assignment Status] 
-- g3_groups_assignment_status_part1_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity': 'month'},
    cluster_by = ["assignment_state", "card_type"],
    tags=['incremental']
  )
}}

WITH
  select_columns_6 AS (
    --SELECT COLUMN 6
  SELECT
    User_Full_Name, User_ID, Email, Assignment_State, Time_Assignment_Started, Time_Completed, Assignment_Due_Date, Card_ID, Card_State,
    Card_Title, Card_Type, Is_User_Generated, Content_Structure, Card_Author_ID, Content_Status, Time_Group_Assignment_Created,
    Assignor_Full_Name, Assignor_ID, Group_ID, Assignment_Type, Group_Assignment_Association, User_Account_Status, Excluded_From_Leaderboard,
    Card_Author_Full_Name, Card_Resource_URL, Is_Live_Stream, Card_Subtype, ECL_ID, ECL_Source_Name, Is_Card_Promoted, Is_Public,
    Duration_seconds, Duration_HHMM, Card_Level, Average_Rating, Standard_Card_Type, Published_At, External_ID, Current_Content_Owner_Full_Name, Assigned_Date, org_id_s
  FROM (
    -- JOIN DATA 3(LEFT OUTER JOIN)
    SELECT
      *
    FROM (
        -- SELECT COLUMNS 4 , VALUE MAPPER , VALUE MAPPER 1 and ADD CONSTANTS
      SELECT
        User_Full_Name, User_ID, Email, CASE  WHEN Assignment_State = 'assigned' THEN 'not started'ELSE Assignment_State END as Assignment_State,
        Time_Assignment_Started, Time_Completed, Assignment_Due_Date, CASE WHEN Assignor_Full_Name IS NULL THEN 'Not Available'ELSE
        Assignor_Full_Name END as Assignor_Full_Name, Time_Group_Assignment_Created, Assignor_ID, Group_ID, User_Account_Status,
        Excluded_From_Leaderboard, Card_ID, Card_State, Card_Title, Card_Type,
        NULL as Is_User_Generated,
        Content_Structure,
        NULL as Card_Author_ID, Card_Author_Full_Name,
        card_resource_url,
        NULL as Is_Live_Stream, Card_Subtype, ECL_ID, ECL_Source_Name,
        NULL as Is_Card_Promoted, Is_Public,
        NULL as Content_Status,
        Duration_seconds,
        Duration_HHMM, Card_Level, Average_Rating, Standard_Card_Type, Published_At, External_ID,
        NULL as Current_Content_Owner_Full_Name, Assigned_Date, 'Assigned_to_Groups' AS Assignment_Type, org_id_s
      FROM (
        -- JOIN DATA 2(LEFT OUTER JOIN)
        SELECT
          *
        FROM (
          -- SELECT COLUMNS 3
          SELECT
             User_Full_Name, User_ID, Email, Assignable_ID, Assignment_State, Time_Assignment_Started, Time_Completed, Assignment_Due_Date,
             User_Full_Name_1 AS Assignor_Full_Name, Time_Group_Assignment_Created, Assignor_ID, Group_ID, User_Account_Status,
             Excluded_From_Leaderboard, External_ID, Assigned_Date, org_id_s
          FROM (
            -- JOIN DATA 1 (LEFT OUTER JOIN)
            SELECT
              *
            FROM (
                --SELECT COLUMNS 1
              SELECT
                User_Full_Name, User_ID, email, Assignable_ID, Assignment_State, Time_Assignment_Started, Time_Completed, Assignment_Due_Date,
                Time_Group_Assignment_created, Group_ID, Assignor_ID, User_Account_Status, Excluded_From_Leaderboard, external_id, Assigned_Date, org_id_s
              FROM (
                -- JOIN DATA (INNER JOIN)
                SELECT
                  *
                FROM (
                  -- SELECT COLUMN and Set Column Type
                  SELECT
                    CAST(card_id AS float64) AS Assignable_ID,
                    CAST(assignor_id AS float64) AS Assignor_ID,
                    CAST(assigned_user_id AS float64) AS User_ID_1,
                    assignment_state AS Assignment_State,
                    time_assignment_started AS Time_Assignment_Started,
                    time_completed AS Time_Completed,
                    assignment_due_date AS Assignment_Due_Date,
                    time_assignment_created AS Time_Group_Assignment_created,
                    CAST(group_id AS float64) AS Group_ID,
                    time_assigned AS Assigned_Date,
                    org_id_s
                  FROM
                    {{ref('g0_groups_assignments_performance_i_vw')}}) set_column_type
                INNER JOIN (
                  SELECT
                    CAST(user_id AS float64) AS User_ID, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email,
                    Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id
                  FROM
                    {{ ref('u1_users_latest_metadata_vw') }} ) set_column_type_1
                ON
                  set_column_type_1.User_ID = set_column_type.User_ID_1
                  )
              ) select_columns_1
            LEFT OUTER JOIN (
              SELECT
              --SELECT COLUMNS 2
                User_ID AS User_ID_1,
                User_Full_Name AS User_Full_Name_1
              FROM (
                SELECT
                  CAST(user_id AS float64) AS User_ID, User_Full_Name
                FROM
                  {{ ref('u1_users_latest_metadata_vw') }} ) ) AS select_columns_2
            ON
              select_columns_1.Assignor_ID = select_columns_2.User_ID_1 )) select_columns_3
        LEFT OUTER JOIN (
          -- SET COLUMN TYPE
          SELECT
            CAST(Card_ID AS float64) AS Card_ID, Content_Structure,
            author_id, card_author_full_name, card_state, card_subtype, card_type, ecl_id, ecl_source_name, is_public, published_at,
            card_title, created_at, updated_at, card_level, average_rating, standard_card_type, Duration_HHMM, Duration_seconds, card_resource_url
          FROM
            {{ref('c1_content_latest_metadata_vw')}}) set_column_type_2
        ON
          select_columns_3.Assignable_ID = set_column_type_2.Card_ID)) add_constants
    LEFT OUTER JOIN (
      -- SELECT COLUMNS 5 and SET COLUMN TYPE 3
      SELECT
        CAST(Group_ID AS float64) AS Group_ID_1,
        Group_Name AS Group_Assignment_Association
      FROM
        {{ref('g1_groups_latest_metadata_vw')}} ) set_column_type_3
    ON
      add_constants.Group_ID = set_column_type_3.Group_ID_1 ) )


-- SELECT COLUMN 7
SELECT
  User_Full_Name, User_ID, Email, Assignment_State, Time_Assignment_Started, Time_Completed, Assignment_Due_Date, Card_ID, Card_State, Card_Title,
  Card_Type, Is_User_Generated, Content_Structure, Card_Author_ID, Content_Status, Time_Group_Assignment_Created, Assignor_Full_Name, Assignor_ID,
  Group_ID, Assignment_Type, Assignment_Progression, Group_Name, Group_Status, User_Account_Status, Excluded_From_Leaderboard,
  Card_Author_Full_Name, Card_Resource_URL, Is_Live_Stream, Card_Subtype, ECL_ID, ECL_Source_Name, Is_Card_Promoted, Is_Public, Duration_seconds,
  Duration_HHMM, Group_Assignment_Association, Card_Level, Average_Rating, Standard_Card_Type, Published_At, External_ID, Group_User_Role,
  Current_Content_Owner_Full_Name, Assigned_Date, org_id_s, current_timestamp() AS etl_record_created_time
FROM (
  -- JOIN DATA 4(INNER JOIN)
  SELECT
    *
  FROM (
    SELECT
      *, '1. Not Started' AS Assignment_Progression FROM select_columns_6
    WHERE Assignment_State = 'not started'

    UNION ALL

    SELECT *, '2. Started' AS Assignment_Progression FROM select_columns_6
    WHERE Assignment_State = 'started'

    UNION ALL

    SELECT *, '3. Completed' AS Assignment_Progression FROM select_columns_6
    WHERE Assignment_State = 'completed'

    UNION ALL

    SELECT *, '4. Dismissed' AS Assignment_Progression FROM select_columns_6
    WHERE Assignment_State = 'dismissed') append_rows

  INNER JOIN (
    -- SET COLUMN TYPE 4 
    SELECT
      User_ID AS User_ID_1, CAST(Group_ID AS float64) AS Group_ID_1, Group_Name, Group_Status, Group_User_Role
    FROM
      {{ref('g2_groups_users_vw')}}) set_column_type_4
  ON
    append_rows.User_ID = set_column_type_4.User_ID_1
    AND append_rows.Group_ID = set_column_type_4.Group_ID_1 )