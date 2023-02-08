  -- u4_users_structured_pathway_progression_overview_vw
SELECT
  user_id, total_pathway_child_cards, content_structure, total_cards_completed, pathway_progress, 
  overall_completion_status, time_completed, user_full_name, email, pathway_id, pathway_title, 
  completion_progress, time_account_created, user_account_status, excluded_from_leaderboard, channel_id, 
  channel_name, carousel_name, is_carousel_enabled, pathway_badge_title, badge_content, channel_content, 
  carousel_content, journey_content, pathway_content, channel_content_exclusivity, pathway_state, 
  total_channel_associations,  card_author_full_name, card_author_id,  
  ecl_source_name,  is_public,  pathway_progress_seconds, external_id
FROM (
  SELECT
    *
  FROM
    {{ref('u3_users_pathway_progression_overview_part4_final_vw')}}) u3_pathway
INNER JOIN (
  SELECT
    DISTINCT pathway_id AS pathway_id_1, channel_id, channel_name, carousel_name, is_carousel_enabled, 
    pathway_badge_title, badge_content, channel_content, carousel_content, journey_content, pathway_content, 
    channel_content_exclusivity, pathway_state, total_channel_associations,  
    card_author_full_name, card_author_id,  ecl_source_name,  is_public, 
    
  FROM (
    SELECT
      pathway_id, channel_id, channel_name, carousel_name, is_carousel_enabled, pathway_badge_title, 
      badge_content, channel_content, carousel_content, journey_content, pathway_content, 
      channel_content_exclusivity, pathway_state, total_channel_associations,  
      card_author_full_name, card_author_id,  ecl_source_name,  is_public, 
      
    FROM
      {{ref('c2_content_structure_metadata_vw')}}
    WHERE
      pathway_id = card_id
      AND pathway_id IS NOT NULL)) select_buffer
ON
  u3_pathway.pathway_id = select_buffer.pathway_id_1