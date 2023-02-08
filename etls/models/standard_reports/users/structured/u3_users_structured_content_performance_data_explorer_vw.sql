-- 1454_Glue_Users [U][3] [Structured Content Performance Data Explorer]
-- u3_users_structured_content_performance_data_explorer_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity':'year'},
    cluster_by = ['Event'],
    tags=['incremental']
  )
}}

WITH
  select_columns_1 AS (
  SELECT
    Pathway_ID, Card_ID, Card_Type, Pathway_State, Card_Title, Pathway_Title, Channel_ID, Channel_Name, Carousel_Name, Channel_Position, Is_Carousel_Enabled,
    Overall_Content_Structure_ID, Journey_ID, Journey_Title, Journey_Pathway_ID, Journey_Pathway_Title, Journey_State, Card_State, Pathway_Badge_Title,
    Journey_Badge_Title, Journey_Pathway_Badge_Title, Badge_Content, Channel_Content, Journey_Content, Pathway_Content, Journey_Pathway_Content,
    Carousel_Content,  Card_Author_ID, Card_Author_Full_Name,  Overall_Content_Structure_Title,
    Total_Channel_Associations, Overall_Content_Structure, Channel_Content_Exclusivity, User_ID, User_Full_Name, Email, Event, Shared_To_User_ID,
    Shared_To_Group_ID, Time, Platform, Performance_metric, Comment_ID, Comment_message, Follower_ID, Followed_User_ID, Shared_To_User_Full_Name,
    Following_User_Full_Name, Follower_User_Full_Name, Shared_To_Group_Name, Content_Structure, Excluded_From_Leaderboard, Time_Account_Created,
    Assigned_Content, User_Account_Status,  Card_Subtype, ECL_ID, ECL_Source_Name,  Is_Public, Card_Level,
    Average_Rating, External_ID, Card_Rating, Duration_seconds
  FROM (
    SELECT
      *
    FROM (
      SELECT
        *
      FROM
       {{ref('c2_content_structure_metadata_vw')}}) c2_content
    LEFT OUTER JOIN (
      SELECT
        Card_ID AS Card_ID_1, User_ID, User_Full_Name, Email, Event, Shared_To_User_ID, Shared_To_Group_ID, Time, Platform, Performance_metric,
        Comment_ID, Comment_message, Follower_ID, Followed_User_ID, Shared_To_User_Full_Name, Following_User_Full_Name,
        Follower_User_Full_Name, Shared_To_Group_Name, Content_Structure, User_Account_Status, Assigned_Content, Excluded_From_Leaderboard,
        Time_Account_Created, External_ID, Card_Rating
      FROM
        {{ref('u2_users_performance_part5_final_results_vw')}}) select_columns
    ON
      c2_content.Card_ID = select_columns.Card_ID_1)  ),


final_select as(
    SELECT
      Pathway_ID, Card_ID, Card_Type, Pathway_State, Card_Title, Pathway_Title, Channel_ID, Channel_Name, Carousel_Name, Channel_Position,
      Is_Carousel_Enabled, Overall_Content_Structure_ID, Journey_ID, Journey_Title, Journey_Pathway_ID, Journey_Pathway_Title, Journey_State, Card_State,
      Pathway_Badge_Title, Journey_Badge_Title, Journey_Pathway_Badge_Title, Badge_Content, Channel_Content, Journey_Content, Pathway_Content, 
      Journey_Pathway_Content, Carousel_Content,  Card_Author_ID, Card_Author_Full_Name,  
      Overall_Content_Structure_Title, Total_Channel_Associations, Overall_Content_Structure, Channel_Content_Exclusivity, User_ID, 
      User_Full_Name, Email, Event, Shared_To_User_ID, Shared_To_Group_ID, Time, Platform, Performance_metric, Comment_ID, Comment_message, 
      Follower_ID, Followed_User_ID, Shared_To_User_Full_Name, Following_User_Full_Name, Follower_User_Full_Name, Shared_To_Group_Name, CASE 
      WHEN Content_Structure = 'Pathway' THEN 'Pathway Container' ELSE Content_Structure END AS Content_Structure, Excluded_From_Leaderboard, 
      Time_Account_Created, Assigned_Content, User_Account_Status,  Card_Subtype, ECL_ID, ECL_Source_Name,  
      Is_Public, Card_Level, Average_Rating, External_ID, Card_Rating, Duration_seconds
    FROM
      select_columns_1
    WHERE
      Card_Type = 'pathway container'
    UNION ALL
    SELECT
      Pathway_ID, Card_ID, Card_Type, Pathway_State, Card_Title, Pathway_Title, Channel_ID, Channel_Name, Carousel_Name, Channel_Position,
      Is_Carousel_Enabled, Overall_Content_Structure_ID, Journey_ID, Journey_Title, Journey_Pathway_ID, Journey_Pathway_Title, Journey_State, Card_State, 
      Pathway_Badge_Title, Journey_Badge_Title, Journey_Pathway_Badge_Title, Badge_Content, Channel_Content, Journey_Content, Pathway_Content, 
      Journey_Pathway_Content, Carousel_Content,  Card_Author_ID, Card_Author_Full_Name,  
      Overall_Content_Structure_Title, Total_Channel_Associations, Overall_Content_Structure, Channel_Content_Exclusivity, User_ID, 
      User_Full_Name, Email, Event, Shared_To_User_ID, Shared_To_Group_ID, Time, Platform, Performance_metric, Comment_ID, Comment_message, 
      Follower_ID, Followed_User_ID, Shared_To_User_Full_Name, Following_User_Full_Name, Follower_User_Full_Name, Shared_To_Group_Name, CASE 
      WHEN Content_Structure = 'Journey' THEN 'Journey Container' ELSE Content_Structure END AS Content_Structure, Excluded_From_Leaderboard, 
      Time_Account_Created, Assigned_Content, User_Account_Status,  Card_Subtype, ECL_ID, ECL_Source_Name,  
      Is_Public, Card_Level, Average_Rating, External_ID, Card_Rating, Duration_seconds
    FROM
      select_columns_1
    WHERE
      Card_Type = 'journey container'
    UNION ALL
    SELECT
      Pathway_ID, Card_ID, Card_Type, Pathway_State, Card_Title, Pathway_Title, Channel_ID, Channel_Name, Carousel_Name, Channel_Position, 
      Is_Carousel_Enabled, Overall_Content_Structure_ID, Journey_ID, Journey_Title, Journey_Pathway_ID, Journey_Pathway_Title, Journey_State, Card_State, 
      Pathway_Badge_Title, Journey_Badge_Title, Journey_Pathway_Badge_Title, Badge_Content, Channel_Content, Journey_Content, Pathway_Content, 
      Journey_Pathway_Content, Carousel_Content,  Card_Author_ID, Card_Author_Full_Name, 
      Overall_Content_Structure_Title, Total_Channel_Associations, Overall_Content_Structure, Channel_Content_Exclusivity, User_ID, 
      User_Full_Name, Email, Event, Shared_To_User_ID, Shared_To_Group_ID, Time, Platform, Performance_metric, Comment_ID, Comment_message, 
      Follower_ID, Followed_User_ID, Shared_To_User_Full_Name, Following_User_Full_Name, Follower_User_Full_Name, Shared_To_Group_Name, CASE 
      WHEN Content_Structure = 'Pathway' THEN 'Journey Pathway Container' ELSE Content_Structure END AS Content_Structure, 
      Excluded_From_Leaderboard, Time_Account_Created, Assigned_Content, User_Account_Status,  Card_Subtype, ECL_ID, 
      ECL_Source_Name,  Is_Public, Card_Level, Average_Rating, External_ID, Card_Rating, Duration_seconds 
    FROM 
      select_columns_1 
    WHERE 
      Card_Type = 'journey pathway container'
    UNION ALL 
    SELECT Pathway_ID, Card_ID, Card_Type, Pathway_State, Card_Title, Pathway_Title, Channel_ID, Channel_Name, 
      Carousel_Name, Channel_Position, Is_Carousel_Enabled, Overall_Content_Structure_ID, Journey_ID, Journey_Title, Journey_Pathway_ID, 
      Journey_Pathway_Title,  Journey_State, Card_State, Pathway_Badge_Title, Journey_Badge_Title, Journey_Pathway_Badge_Title, Badge_Content, Channel_Content, 
      Journey_Content, Pathway_Content, Journey_Pathway_Content, Carousel_Content,  Card_Author_ID, Card_Author_Full_Name, 
       Overall_Content_Structure_Title, Total_Channel_Associations, Overall_Content_Structure, Channel_Content_Exclusivity, 
      User_ID, User_Full_Name, Email, Event, Shared_To_User_ID, Shared_To_Group_ID, Time, Platform, Performance_metric, Comment_ID, 
      Comment_message, Follower_ID, Followed_User_ID, Shared_To_User_Full_Name, Following_User_Full_Name, Follower_User_Full_Name,
      Shared_To_Group_Name, Content_Structure, Excluded_From_Leaderboard, Time_Account_Created, Assigned_Content, User_Account_Status, 
       Card_Subtype, ECL_ID, ECL_Source_Name,  Is_Public, Card_Level, Average_Rating, External_ID, Card_Rating, Duration_seconds
    FROM
      select_columns_1
    WHERE
      Card_Type != 'pathway container'
      AND Card_Type != 'journey container'
      AND Card_Type != 'journey pathway container')

SELECT *, current_timestamp() AS etl_record_created_time from final_select 

      