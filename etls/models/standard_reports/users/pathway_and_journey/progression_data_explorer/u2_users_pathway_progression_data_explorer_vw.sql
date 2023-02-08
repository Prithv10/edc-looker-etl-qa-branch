-- 1454_Glue_Users [U][2] [Pathway & Journey Progression Data Explorer]
-- u2_users_pathway_progression_data_explorer_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

-- select columns 11
SELECT content_structure, pathway_id, pathway_title, pathway_badge_title, card_id, card_title, card_type, user_id,
       time_completed, user_full_name, email, badge_content, journey_content, pathway_content,
       journey_pathway_content, excluded_from_leaderboard, Duration_seconds, Duration_HHMM, user_account_status,
       external_id, current_content_owner_full_name, current_timestamp() AS etl_record_created_time 
       FROM
  -- select columns 8
  (
  SELECT *, COUNT(user_id) AS occ FROM (
    SELECT content_structure, pathway_id, pathway_title, pathway_badge_title, card_id, card_title, card_type,
           user_id, time_completed, user_full_name, email, badge_content, journey_content, pathway_content, 
           journey_pathway_content, excluded_from_leaderboard, Duration_seconds, Duration_HHMM, user_account_status, 
           external_id, current_content_owner_full_name FROM
      -- select columns 6
      (
      
        -- all journey/pathway + user progression
        
        SELECT content_structure, journey_id, journey_title, journey_badge_title, journey_pathway_id,
             journey_pathway_title, journey_pathway_badge_title, pathway_id, pathway_title, pathway_badge_title, 
             card_id, card_title, card_type, user_id, time_completed, user_full_name, email, badge_content,
             journey_content, pathway_content, journey_pathway_content, excluded_from_leaderboard, 
             user_account_status, Duration_seconds, Duration_HHMM, external_id, current_content_owner_full_name FROM 
        (
          SELECT content_structure, journey_id, journey_title, journey_badge_title, journey_pathway_id,
                 journey_pathway_title, journey_pathway_badge_title, pathway_id, pathway_title, pathway_badge_title, 
                 card_id, card_title, card_type, user_id, time_completed, user_full_name, email, badge_content, 
                 journey_content, pathway_content, journey_pathway_content, excluded_from_leaderboard, 
                 user_account_status, external_id FROM
            {{ ref('u2_users_pathway_and_journey_progression_data_explorer_part_2_vw') }}) AS all_jp_user_prog
          -- join data 1
        LEFT OUTER JOIN
          -- select columns 5
          (
          SELECT CAST(card_id AS float64) AS Card_ID_1, Duration_seconds, Duration_HHMM, 
                 current_content_owner_full_name FROM
            {{ ref('c1_content_latest_metadata_vw') }})AS select_columns_5
        ON
          all_jp_user_prog.card_id = select_columns_5.Card_ID_1
      WHERE
        pathway_id IS NOT NULL ) )
  GROUP BY content_structure, pathway_id, pathway_title, pathway_badge_title, card_id, card_title, card_type, 
           user_id, time_completed, user_full_name, email, badge_content, journey_content, pathway_content, 
           journey_pathway_content, excluded_from_leaderboard, Duration_seconds, Duration_HHMM, user_account_status, 
           external_id, current_content_owner_full_name)