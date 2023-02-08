-- 1454_Glue_Users [U][3] [Structured Pathway Progression Data Explorer]
-- u3_users_structured_pathway_progression_data_explorer_vw


    -- select columns
    SELECT content_structure, pathway_id, pathway_title, pathway_badge_title, card_id, card_title, card_type, 
           user_id AS user_id_1, time_completed, user_full_name, email, badge_content, journey_content, pathway_content, 
           journey_pathway_content, channel_id, channel_name, carousel_name, is_carousel_enabled, 
           channel_content, carousel_content, channel_content_exclusivity, pathway_state, total_channel_associations, 
            card_author_full_name, card_author_id,  card_state, overall_content_structure, 
           overall_content_structure_title, overall_content_structure_status, overall_content_structure_id, excluded_from_leaderboard, 
           user_account_status, Duration_seconds, Duration_HHMM, card_resource_url,  card_subtype, ecl_source_name, 
            is_public, card_level, average_rating, external_id FROM 
      (
      SELECT * FROM 
      ((
        SELECT * FROM
          {{ ref('u2_users_pathway_progression_data_explorer_vw') }}) AS u2_users_pathway_prog_data_exp
        -- join data
      INNER JOIN
        -- select buffer
        (
        SELECT DISTINCT pathway_id_1, channel_id, channel_name, carousel_name, is_carousel_enabled, channel_content, 
               carousel_content, channel_content_exclusivity, pathway_state, total_channel_associations,  
               card_author_full_name, card_author_id,  card_id_1, card_state, overall_content_structure, 
               overall_content_structure_title, overall_content_structure_status, overall_content_structure_id, card_resource_url, 
                is_public, card_subtype, ecl_source_name,  card_level, average_rating FROM 
          (
          SELECT pathway_id as pathway_id_1, channel_id, channel_name, carousel_name, is_carousel_enabled, channel_content, 
                 carousel_content, channel_content_exclusivity, pathway_state, total_channel_associations,  
                 card_author_full_name, card_author_id,  card_id as card_id_1, card_state, 
                 overall_content_structure, overall_content_structure_title, overall_content_structure_status, 
                 overall_content_structure_id, card_resource_url,  is_public, card_subtype, 
                 ecl_source_name,  card_level, average_rating  FROM
            {{ ref('c2_content_structure_metadata_vw') }}
          WHERE
            pathway_id IS NOT NULL)) AS select_buffer
      ON
        u2_users_pathway_prog_data_exp.pathway_id = select_buffer.pathway_id_1
        AND u2_users_pathway_prog_data_exp.card_id = select_buffer.card_id_1))
