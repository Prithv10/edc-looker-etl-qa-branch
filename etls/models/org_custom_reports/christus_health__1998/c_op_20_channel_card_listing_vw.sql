-- C-OP-20 [CHANNEL] Card Listing 
-- c_op_20_channel_card_listing_vw
-- content_status,is_user_generated,is_card_promoted,is_live_stream are removed columns by srini 
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
        select distinct channel_id, channel_name, channel_content, card_id, card_title
        from {{ ref("c2_content_structure_metadata_vw") }}
        where channel_content = 'True'
    ) as c2
left outer join
    (
        select card_id as master_card_id, card_state, content_structure, standard_card_type, card_type, card_subtype, card_resource_url, ecl_id, 
        ecl_source_name, tags, duration_seconds, duration_hhmm, created_at, published_at, updated_at, card_author_id, card_author_full_name, in_journey, 
        in_pathway, in_channel, is_public, views_unique, unique_views_category, views_all, all_views_category, completions, 
        clicked_link, shared_to_person, shared_to_group, comments, likes, bookmarks, badges_earned, average_rating
        from {{ ref("c_ip_00_master_card_dataset_vw") }}
    ) as master
    on c2.card_id = master.master_card_id
