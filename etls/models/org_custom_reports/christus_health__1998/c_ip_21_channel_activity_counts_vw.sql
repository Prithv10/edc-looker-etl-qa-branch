-- C-IP-21 [CHANNEL] Activity Counts
-- c_ip_21_channel_activity_counts_vw
select * from
    (
        select channel_id, channel_name, channel_content, card_id, card_title, card_type, card_author_full_name, 
        card_resource_url, standard_card_type, duration_hhmm, ecl_source_name
        from {{ ref('c_op_20_channel_card_listing_vw') }}
    ) as channel_card
Left Outer Join
    (
        select card_id as feeder_card_id, views_unique, views_all, completions, clicked_link, shared_to_person, 
        shared_to_group, comments, likes, bookmarks, badges_earned, card_title AS content_activity_card_title, unique_views_category, all_views_category, 
        tags, in_journey, in_pathway, in_channel
        from {{ ref('c_ip_40_feeder_card_tags_activity_counts_part2_vw') }}
    ) as feeder_card
    on channel_card.card_id = feeder_card.feeder_card_id
