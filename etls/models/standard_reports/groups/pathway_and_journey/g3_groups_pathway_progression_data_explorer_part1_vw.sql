-- 1454_Glue_Users [U][2] [Pathway & Journey Progression Data Explorer]
-- g3_groups_pathway_progression_data_explorer_part1_vw

-- select columns 13
SELECT group_id, group_name, group_status, content_structure, pathway_id,
       pathway_title, pathway_badge_title, card_id, card_title, card_type, user_id, time_completed,
       user_full_name, email, badge_content, journey_content, pathway_content, 
       journey_pathway_content, excluded_from_leaderboard, Duration_seconds, Duration_HHMM,
       user_account_status, external_id, current_content_owner_full_name FROM 
(
  SELECT * FROM 
  (
    SELECT
      CAST(user_id AS float64) AS Group_User_ID, group_id, group_name, group_status FROM
      {{ ref('g2_groups_users_vw') }} )AS select_columns_4
  -- join data 3
  RIGHT OUTER JOIN 
  (
    SELECT * FROM
      {{ ref('u2_users_pathway_progression_data_explorer_vw') }})AS select_columns_11
  ON
    select_columns_4.Group_User_ID = select_columns_11.User_ID)