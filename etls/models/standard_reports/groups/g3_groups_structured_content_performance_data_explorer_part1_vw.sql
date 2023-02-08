-- 1454_Glue_Groups [G][3] [Structured Content Performance Data Explorer]
-- g3_groups_structured_content_performance_data_explorer_part1_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp'},
    tags=['incremental']
  )
}}


SELECT 
  Pathway_ID, Card_ID, Card_Type, Card_Title, Pathway_State, Pathway_Title, Channel_ID, Channel_Name, Carousel_Name, Channel_Position, Is_Carousel_Enabled, Overall_Content_Structure_ID, 
  Journey_ID, Journey_Title, Journey_Pathway_ID, Journey_Pathway_Title, Journey_State, Card_State, Pathway_Badge_Title, Journey_Badge_Title, Journey_Pathway_Badge_Title, 
  Badge_Content, Channel_Content, Journey_Content, Pathway_Content, Journey_Pathway_Content, Carousel_Content,  Card_Author_ID, Card_Author_Full_Name, 
   Overall_Content_Structure_Title, Total_Channel_Associations, Overall_Content_Structure, Channel_Content_Exclusivity, User_ID, User_Full_Name, Email, Event, 
  Shared_To_User_ID, Shared_To_Group_ID, Time, Platform, Performance_metric, Comment_ID, Comment_message, Follower_ID, Followed_User_ID, Shared_To_User_Full_Name, 
  Following_User_Full_Name, Follower_User_Full_Name, Shared_To_Group_Name, Group_ID, Group_Name, Group_Status, Content_Structure, Excluded_From_Leaderboard, Time_Account_Created, Assigned_Content, 
  User_Account_Status,  Card_Subtype, ECL_ID, ECL_Source_Name,  Is_Public, Card_Level, Average_Rating, External_ID, Card_Rating, Group_User_Role , current_timestamp() AS etl_record_created_time
FROM (
  SELECT
    *
  FROM (
    SELECT
      *
    FROM
      {{ref('u3_users_structured_content_performance_data_explorer_vw')}}) append_rows
  LEFT OUTER JOIN (
    SELECT
      Group_ID, Group_Name, Group_Status, User_ID AS User_ID_1, Group_User_Role
    FROM
      {{ref('g2_groups_users_vw')}}) g2_groups_users
  ON
    append_rows.User_ID = g2_groups_users.User_ID_1)