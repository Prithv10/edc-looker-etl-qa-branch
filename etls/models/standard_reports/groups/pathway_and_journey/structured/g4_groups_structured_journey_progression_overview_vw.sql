  -- g4_groups_structured_journey_progression_overview_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
	  tags=['incremental']
  )
}}

SELECT
  group_id, group_name, group_status, user_id_1 AS user_id, total_journey_pathway_child_cards, journey_id, journey_title, journey_pathway_id, 
  journey_pathway_title, content_structure, total_cards_completed, overall_completion_status, user_full_name, email, journey_pathway_progress, 
  total_journey_cards, time_completed, journey_completion_progress, journey_progress, journey_pathway_completion_progress, 
  journey_pathway_completion_status, channel_id, channel_name, carousel_name, is_carousel_enabled, badge_content, channel_content, carousel_content, 
  journey_content, pathway_content, channel_content_exclusivity, journey_state, total_channel_associations,  card_author_full_name, 
  card_author_id,  ecl_source_name, is_public,   excluded_from_leaderboard, user_account_status, 
  time_account_created, external_id, current_timestamp() AS etl_record_created_time
FROM (
  SELECT
    group_id, group_name, group_status, CAST(user_id AS float64) AS user_id, group_user_role, etl_record_created_time
  FROM
    {{ref('g2_groups_users_vw')}}) set_column_type
RIGHT OUTER JOIN (
  SELECT
    user_id AS user_id_1, total_journey_pathway_child_cards, journey_id, journey_title, journey_pathway_id, journey_pathway_title, 
    content_structure, total_cards_completed, overall_completion_status, user_full_name, email, journey_pathway_progress, total_journey_cards, 
    time_completed, journey_completion_progress, journey_progress, journey_pathway_completion_progress, journey_pathway_completion_status, 
    channel_id, channel_name, carousel_name, is_carousel_enabled, badge_content, channel_content, carousel_content, journey_content, 
    pathway_content, channel_content_exclusivity, journey_state, total_channel_associations,  card_author_full_name, card_author_id, 
     user_account_status, excluded_from_leaderboard, time_account_created,  ecl_source_name,  
    is_public, external_id
  FROM
    {{ref('u4_users_structured_journey_progression_overview_vw')}}) journey_progression_structure
ON
  set_column_type.user_id = journey_progression_structure.user_id_1