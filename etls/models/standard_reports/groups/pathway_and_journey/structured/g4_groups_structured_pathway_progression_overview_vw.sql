  -- g4_groups_structured_pathway_progression_overview_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
	  tags=['incremental']
  )
}}

SELECT
  group_id, group_name, group_status, user_id_1 AS user_id, total_pathway_child_cards, content_structure, total_cards_completed, pathway_progress, 
  overall_completion_status, time_completed, user_full_name, email, pathway_id, pathway_title, completion_progress, channel_id, channel_name, carousel_name, 
  is_carousel_enabled, pathway_badge_title, badge_content, channel_content, carousel_content, journey_content, pathway_content, 
  channel_content_exclusivity, pathway_state, total_channel_associations,  card_author_full_name, card_author_id,  
  time_account_created, user_account_status, excluded_from_leaderboard, ecl_source_name,  is_public,  
  pathway_progress_seconds, external_id, current_timestamp() AS etl_record_created_time
FROM (
  SELECT
    *
  FROM (
    SELECT
      Group_ID, Group_Name, Group_Status, CAST(User_ID AS float64) AS user_id, Group_User_Role, CURRENT_TIMESTAMP() AS etl_record_created_time
    FROM
      {{ref('g2_groups_users_vw')}}) set_column_type
  RIGHT OUTER JOIN (
    SELECT
      user_id AS user_id_1, total_pathway_child_cards, content_structure, total_cards_completed, pathway_progress, overall_completion_status, 
      time_completed, user_full_name, email, pathway_id, pathway_title, completion_progress, time_account_created, user_account_status, 
      excluded_from_leaderboard, channel_id, channel_name, carousel_name, is_carousel_enabled, pathway_badge_title, badge_content, channel_content, 
      carousel_content, journey_content, pathway_content, channel_content_exclusivity, pathway_state, total_channel_associations,  
      card_author_full_name, card_author_id,  ecl_source_name,  is_public,  
      pathway_progress_seconds, external_id
    FROM
      {{ref('u4_users_structured_pathway_progression_overview_vw')}}) pathway_progression_structure
  ON
    set_column_type.user_id = pathway_progression_structure.user_id_1)