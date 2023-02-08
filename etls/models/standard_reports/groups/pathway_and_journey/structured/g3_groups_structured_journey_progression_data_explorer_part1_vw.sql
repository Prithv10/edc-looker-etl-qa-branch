-- g3_groups_structured_journey_progression_data_explorer_part1_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
	  tags=['incremental']
  )
}}

 -- select columns 3
SELECT group_id, group_name, group_status, content_structure, journey_id, journey_title, journey_badge_title, journey_pathway_id,
       journey_pathway_title, journey_pathway_badge_title, card_id, card_title, card_type, user_id_1 as user_id, time_completed, user_full_name, email,
       badge_content, journey_content, pathway_content, journey_pathway_content, channel_id, channel_name, carousel_name, is_carousel_enabled, 
       channel_content, carousel_content, channel_content_exclusivity, journey_state, total_channel_associations,  
       card_author_full_name, card_author_id,  card_state, overall_content_structure, overall_content_structure_title, 
       overall_content_structure_status, overall_content_structure_id, excluded_from_leaderboard, user_account_status, Duration_seconds, 
       Duration_HHMM, card_resource_url,  card_subtype, ecl_source_name,  is_public, card_level, average_rating, 
       external_id, current_timestamp() AS etl_record_created_time
       FROM
  -- set column type
  (
  SELECT *, CAST(user_id AS float64) AS user_id FROM
    {{ ref('g2_groups_users_vw') }} AS set_column_type
    -- join data 1
  RIGHT OUTER JOIN
    -- select columns
    (
    SELECT content_structure, journey_id, journey_title, journey_badge_title, journey_pathway_id, journey_pathway_title, 
           journey_pathway_badge_title, card_id, card_title, card_type, user_id AS user_id_1, time_completed, user_full_name, email, 
           badge_content, journey_content, pathway_content, journey_pathway_content, channel_id, channel_name, carousel_name, 
           is_carousel_enabled, channel_content, carousel_content, channel_content_exclusivity, journey_state, total_channel_associations, 
            card_author_full_name, card_author_id,  card_state, overall_content_structure, 
           overall_content_structure_title, overall_content_structure_status, overall_content_structure_id, excluded_from_leaderboard, 
           user_account_status, Duration_seconds, Duration_HHMM, card_resource_url,  card_subtype, ecl_source_name, 
            is_public, card_level, average_rating, external_id FROM 
      (
      SELECT * FROM 
      ((
        SELECT * FROM
          {{ ref('u2_users_journey_progression_data_explorer_vw') }}) AS u2_users_journey_prog_data_exp
        -- join data
      INNER JOIN
        -- select columns 2
        (
        SELECT DISTINCT channel_id, channel_name, carousel_name, is_carousel_enabled, channel_content, carousel_content, 
               journey_id AS journey_id_1, journey_pathway_id AS journey_pathway_id_1, channel_content_exclusivity, journey_state, 
               total_channel_associations,  card_author_full_name, card_author_id,  card_id AS card_id_1, 
               card_state, overall_content_structure, overall_content_structure_title, overall_content_structure_status, 
               overall_content_structure_id, card_resource_url,  card_subtype, ecl_source_name,  is_public, 
               card_level, average_rating
        FROM (
          SELECT channel_id, channel_name, carousel_name, is_carousel_enabled, channel_content, carousel_content, journey_id, 
                 journey_pathway_id, channel_content_exclusivity, journey_state, total_channel_associations,  
                 card_author_full_name, card_author_id,  card_id, card_state, overall_content_structure, 
                 overall_content_structure_title, overall_content_structure_status, overall_content_structure_id, card_resource_url, 
                  card_subtype, ecl_source_name,  is_public, card_level, average_rating
          FROM
            {{ ref('c2_content_structure_metadata_vw') }}
          WHERE
            journey_id IS NOT NULL)) AS select_columns_2
      ON
        u2_users_journey_prog_data_exp.journey_id = select_columns_2.journey_id_1
        AND u2_users_journey_prog_data_exp.journey_pathway_id = select_columns_2.journey_pathway_id_1
        AND u2_users_journey_prog_data_exp.card_id = select_columns_2.card_id_1))) AS select_columns
  ON
    set_column_type.User_ID = select_columns.user_id_1)
