
-- 1454_Glue_Groups [G][3] [Group Performance Data Explorer]
-- g3_groups_performance_data_explorer_part1_vw
{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["Group_Name","performance_metric"],
    tags=['incremental']
  )
}}

SELECT user_id, Group_ID, Group_Name, Group_Status, card_id, card_state, card_title, card_type, 
     content_structure, card_author_id, user_full_name,  email, time, event, shared_to_user_id,
    shared_to_group_id, platform, performance_metric, comment_id, comment_message, follower_id, followed_user_id, shared_to_user_full_name, 
    following_user_full_name, follower_user_full_name, shared_to_group_name, card_author_full_name, comment_status, time_account_created, 
    sign_in_count, user_account_status, excluded_from_leaderboard, duration_seconds, duration_HHMM, ecl_id,  ecl_source_name, card_subtype, 
    card_resource_url,  is_public,  assigned_content, badge_id, badge_title, badge_type, standard_card_type, 
    published_at, card_rating, Group_User_Role, time_account_suspended, content_completion_sync, referer, external_id, card_level, average_rating,
    current_content_owner_full_name FROM

    (SELECT card_id, card_state, card_title, card_type, 
     content_structure, card_author_id, user_full_name,  user_id, email, time, event, shared_to_user_id,
    shared_to_group_id, platform, performance_metric, comment_id, comment_message, follower_id, followed_user_id, shared_to_user_full_name, 
    following_user_full_name, follower_user_full_name, shared_to_group_name, card_author_full_name, comment_status, time_account_created, 
    sign_in_count, user_account_status, excluded_from_leaderboard, card_resource_url, duration_seconds, duration_HHMM, ecl_id,  ecl_source_name, is_public, card_subtype, 
     assigned_content, badge_id, badge_title, badge_type, standard_card_type, 
    published_at, card_rating, time_account_suspended, content_completion_sync, referer, external_id, card_level, average_rating,
    current_content_owner_full_name
    FROM {{ ref('u2_users_performance_part5_final_results_vw') }}) user_perf
    LEFT OUTER JOIN 
    (
        SELECT user_id AS user_id_1,Group_ID, Group_Name, Group_Status,Group_User_Role 
        FROM {{ ref('g2_groups_users_vw') }}
    ) AS group_user
    ON
    user_perf.user_id = group_user.user_id_1


