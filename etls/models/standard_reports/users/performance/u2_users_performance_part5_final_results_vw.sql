-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part5_final_results_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'Time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["performance_metric","card_title"],
    tags=['incremental']
  )
}}


SELECT DISTINCT card_id, card_state, card_title, card_type, content_structure, author_id, card_author_id, user_id, user_full_name, email, `Time`, event, shared_to_user_id, shared_to_group_id, platform, performance_metric, comment_id, comment_message, follower_id, followed_user_id, shared_to_user_full_name, following_user_full_name, follower_user_full_name, shared_to_group_name, card_author_full_name, comment_status, time_account_created, sign_in_count, user_account_status, excluded_from_leaderboard, card_resource_url, Duration_seconds, Duration_HHMM, ecl_id, ecl_source_name, is_public, card_subtype, assigned_content, badge_id, badge_type, badge_title, standard_card_type, published_at, card_rating, time_account_suspended, content_completion_sync, referer, external_id, average_rating, card_level, current_content_owner_full_name
FROM 	
{{ref('u2_users_performance_part5_vw')}}
