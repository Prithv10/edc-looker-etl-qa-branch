  -- u4_users_structured_journey_progression_overview_vw
SELECT
  user_id, total_journey_pathway_child_cards, journey_id, journey_title, journey_pathway_id, 
  journey_pathway_title, content_structure, total_cards_completed, overall_completion_status, 
  user_full_name, email, journey_pathway_progress, total_journey_cards, time_completed, 
  journey_completion_progress, journey_progress, journey_pathway_completion_progress, 
  journey_pathway_completion_status, channel_id, channel_name, carousel_name, 
  is_carousel_enabled, badge_content, channel_content, carousel_content, journey_content, 
  pathway_content, channel_content_exclusivity, journey_state, total_channel_associations, 
   card_author_full_name, card_author_id,  user_account_status, 
  excluded_from_leaderboard, time_account_created,  ecl_source_name, 
   is_public, external_id
FROM (
  SELECT
    channel_id, channel_name, carousel_name, is_carousel_enabled, badge_content, channel_content, 
    carousel_content, journey_content, pathway_content, journey_id AS journey_id_1, 
    journey_pathway_id AS journey_pathway_id_1, channel_content_exclusivity, journey_state, 
    total_channel_associations,  card_author_full_name, card_author_id, 
      ecl_source_name,  is_public
  FROM (
    SELECT
      DISTINCT channel_id, channel_name, carousel_name, is_carousel_enabled, badge_content, 
      channel_content, carousel_content, journey_content, pathway_content, journey_id, 
      journey_pathway_id, channel_content_exclusivity, journey_state, total_channel_associations, 
       card_author_full_name, card_author_id,   
      ecl_source_name,  is_public
    FROM (
      SELECT
        *
      FROM
        {{ref('c2_content_structure_metadata_vw')}}
      WHERE
        journey_id IS NOT NULL)
    WHERE
      journey_id = card_id
      OR journey_pathway_id = card_id)) select_buffer
INNER JOIN
  {{ref('u3_users_journey_progression_overview_part7_final_vw')}} u3_journey
ON
  u3_journey.journey_id = select_buffer.journey_id_1
  AND u3_journey.journey_pathway_id = select_buffer.journey_pathway_id_1