  -- g3_groups_pathway_progression_overview_vw
SELECT
  group_id, group_name, group_status, user_id_1 AS user_id, total_pathway_child_cards, content_structure, total_cards_completed, pathway_progress, overall_completion_status, 
  time_completed, user_full_name, email, pathway_id, pathway_title, completion_progress, time_account_created, user_account_status, excluded_from_leaderboard, 
  pathway_progress_seconds, external_id
FROM (
  SELECT
    group_id, group_name, group_status, CAST(user_id AS float64) AS user_id, group_user_role, etl_record_created_time
  FROM
    {{ref('g2_groups_users_vw')}}) set_column_type_1
RIGHT OUTER JOIN (
  SELECT
    user_id AS user_id_1, total_pathway_child_cards, content_structure, total_cards_completed, pathway_progress, overall_completion_status, time_completed, user_full_name, email, 
    pathway_id, pathway_title, completion_progress, Time_Account_Created, User_Account_Status, Excluded_From_Leaderboard, pathway_progress_seconds, external_id
  FROM
    {{ref('u3_users_pathway_progression_overview_part4_final_vw')}}) select_columns_9
ON
  set_column_type_1.user_id = select_columns_9.user_id_1