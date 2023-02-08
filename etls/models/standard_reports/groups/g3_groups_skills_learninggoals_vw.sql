  -- 1454_Glue_Groups [G][3] [Skills & Learning Goals]
  -- g3_groups_skills_learninggoals_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

SELECT user_id, User_Full_Name, email, Time_Account_Created, User_Account_Status, Time, event,
 topic_type, topic_label, Group_ID, Group_Name, Group_Status, Excluded_From_Leaderboard, external_id,
  sign_in_count, Time_Account_Suspended, topic_label_1, current_timestamp() AS etl_record_created_time
FROM 
(
  SELECT * FROM
    {{ ref('u2_users_skills_learninggoals_vw') }} u2
  
  INNER JOIN (
    
    SELECT Group_ID, Group_Name, Group_Status, User_ID AS User_ID_1, Group_User_Role FROM
      {{ ref('g2_groups_users_vw') }} )g2
  ON
    u2.user_id = g2.User_ID_1)
 

