-- c_op_70_pathway_list_child_cards_in_pathway_vw
-- C-OP-70 [PATHWAY] List Child Cards in Pathway

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT *, current_timestamp() as etl_record_created_time FROM (SELECT Distinct pathway_id, card_id as child_card_id, pathway_title, pathway_state, card_title, pathway_badge_title, badge_content 
FROM {{ref('c2_content_structure_metadata_vw')}}
WHERE pathway_id IS NOT NULL) remove_duplicates_pathways
LEFT OUTER JOIN 
(SELECT badges_earned, card_id, card_state, content_structure,standard_card_type, card_type, 
card_subtype, card_resource_url, ecl_id, ecl_source_name, tags, Duration_seconds, Duration_HHMM, 
created_at, published_at, updated_at, card_author_id, card_author_full_name, in_journey,
in_pathway, in_channel, is_public, views_unique, unique_views_category, views_all, all_views_category, completions, clicked_link,
shared_to_person, shared_to_group, comments, likes, bookmarks, average_rating, clickable_genesis_url FROM {{ref('c_ip_00_master_card_dataset_vw')}}) select_columns
on remove_duplicates_pathways.child_card_id = select_columns.card_id