-- u3_users_pathway_progression_overview_part4_final_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

SELECT
  user_id, total_pathway_child_cards, content_structure, total_cards_completed, pathway_progress, 
  overall_completion_status, time_completed, User_Full_Name, email, pathway_id, pathway_title, 
  completion_progress, Time_Account_Created, User_Account_Status, Excluded_From_Leaderboard, 
  pathway_progress_seconds, external_id,  current_timestamp() AS etl_record_created_time
FROM (
  SELECT
    user_id, time_completed, pathway_id, total_cards_completed, pathway_title, content_structure, 
    total_pathway_child_cards, pathway_progress_seconds, new_date2, overall_completion_status, 
    completion_progress, pathway_progress
  FROM
    {{ref('u3_users_pathway_progression_overview_part3_vw')}}) jointable1
LEFT OUTER JOIN (
  SELECT
    CAST(user_id AS float64) AS user_id_1, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, 
    email, Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id
  FROM
    {{ref('u1_users_latest_metadata_vw')}}) set_column_type
ON
  jointable1.user_id = set_column_type.user_id_1