-- C-OP-30 [COMMENT] Comments w No Completes
-- c_op_30_comment_comments_w_no_completes_vw
-- 2 filters are commented out as there is no data 

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

select *, current_timestamp() as etl_record_created_time from
    (
        select user_id, user_full_name, email, card_id, card_title, event, time, lower(comment_message) as comment_message, comment_status, user_account_status, time_account_created
        from
            (
                select user_id, user_full_name, email, card_id, card_title, event, time, cast(comment_message as string) as comment_message, comment_status, 
                user_account_status, time_account_created
                from {{ ref("u2_users_performance_part5_final_results_vw") }}
            )

        where event = 'card_comment_created' and comment_status = 'Active'
                AND comment_message NOT IN ('complete')
        AND comment_message NOT IN ('done')
    ) as u2

left outer join

    (
        select card_id as master_card_id, card_state, content_structure, standard_card_type, card_type, card_subtype, card_resource_url, ecl_id, ecl_source_name, 
        tags, duration_hours, duration_minutes, duration_seconds, duration_hhmm, genesis_card_link, clickable_genesis_url, published_at, created_at, updated_at, 
        card_author_id, card_author_full_name, in_channel, in_journey, in_pathway, is_public, views_unique, views_all, unique_views_category, all_views_category, 
        completions, clicked_link, shared_to_person, shared_to_group, comments, likes, bookmarks, badges_earned, card_level, average_rating
        from {{ ref("c_ip_00_master_card_dataset_vw") }}
    ) as master

    on u2.card_id = master.master_card_id
