-- 1454_Glue_Users [U][2] [Pathway & Journey Progression Data Explorer]
-- g3_groups_journey_progression_data_explorer_part1_vw

-- select columns 14
SELECT group_id, group_name, group_status, content_structure, journey_id, journey_title,
       journey_badge_title, journey_pathway_id, journey_pathway_title, journey_pathway_badge_title,
       card_id, card_title, card_type, user_id, time_completed, user_full_name, email,
       badge_content, journey_content, pathway_content, journey_pathway_content,
       excluded_from_leaderboard, user_account_status, Duration_seconds, Duration_HHMM,
       external_id, current_content_owner_full_name FROM 
  (
  SELECT * FROM 
  (
    SELECT CAST(user_id AS float64) AS Group_User_ID, group_id, group_name, group_status FROM
      {{ ref('g2_groups_users_vw') }} )AS select_columns_4
  -- join data 4
  RIGHT OUTER JOIN 
  (
    SELECT * FROM
      {{ ref('u2_users_journey_progression_data_explorer_vw') }} )AS select_columns_12
  ON
    select_columns_4.Group_User_ID = select_columns_12.User_ID)