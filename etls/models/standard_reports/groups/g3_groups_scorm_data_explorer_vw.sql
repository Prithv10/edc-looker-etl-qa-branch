  -- 1454_Glue_Groups [G][3][Scorm Data Explorer] 
  -- g3_groups_scorm_data_explorer_vw

  
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
  User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, card_state, card_title, 
  card_type,  content_structure, card_author_id, card_author_full_name, 
  card_resource_url,  card_subtype, ecl_id, ecl_source_name,  is_public, 
   Duration_seconds, Duration_HHMM, Group_ID, Group_Name, Group_Status, card_level, 
  average_rating, standard_card_type, published_at, Group_User_Role, external_id, current_content_owner_full_name,
  timestamp_trunc(`Time`, week) as p_week
FROM (
  SELECT
    *
  FROM
    {{ref('u2_users_scorm_data_explorer_vw')}}) select_columns_2
LEFT OUTER JOIN (
  SELECT
    Group_ID, Group_Name, Group_Status, User_ID AS User_ID_1, Group_User_Role
  FROM
    {{ref('g2_groups_users_vw')}}) g2_groups
ON
  select_columns_2.user_id = g2_groups.User_ID_1