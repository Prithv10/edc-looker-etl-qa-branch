  -- g3_groups_journey_progression_overview_vw

SELECT
  group_id, user_id, group_name, group_status, total_journey_pathway_child_cards, journey_id, 
  journey_title, journey_pathway_id, journey_pathway_title,content_structure, total_cards_completed, 
  overall_completion_status, user_full_name, email, journey_pathway_progress, time_completed_journey as time_completed, 
  total_journey_cards, journey_completion_progress, journey_progress, 
  journey_pathway_completion_progress, journey_pathway_completion_status, user_account_status, 
  time_account_created, excluded_from_leaderboard, external_id
FROM (
  SELECT
    user_id as user_id_1, total_journey_pathway_child_cards, journey_id, journey_title, journey_pathway_id, journey_pathway_title, content_structure, total_cards_completed,
    overall_completion_status, user_full_name, email, journey_pathway_progress, total_journey_cards, time_completed_journey, journey_completion_progress, journey_progress, journey_pathway_completion_progress, 
    journey_pathway_completion_status, user_account_status, excluded_from_leaderboard, time_account_created, external_id
  FROM (
    SELECT
      *
    FROM
      {{ref('u3_users_journey_progression_overview_part6_vw')}}) append_rows_1
  LEFT OUTER JOIN (
    SELECT
      CAST(user_id AS float64) AS user_id_1, user_full_name, user_account_status, excluded_from_leaderboard, email, time_account_created, sign_in_count, time_account_suspended, external_id
    FROM
      {{ref('u1_users_latest_metadata_vw')}}) set_column_type
  ON
    append_rows_1.user_id = set_column_type.user_id_1) select_columns_8
RIGHT OUTER JOIN (
  SELECT
    group_id, group_name, group_status, CAST(user_id AS float64) AS user_id, group_user_role
  FROM
    {{ref('g2_groups_users_vw')}}) set_column_type_1
ON
  set_column_type_1.user_id = select_columns_8.user_id_1