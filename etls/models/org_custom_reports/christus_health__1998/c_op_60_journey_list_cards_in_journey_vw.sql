-- C-OP-60 [JOURNEY] List Cards in Journey
-- c_op_60_journey_list_cards_in_journey_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity':'month'},
    cluster_by = ['content_structure'],
    tags=['incremental']
  )
}}

SELECT *, current_timestamp() as etl_record_created_time FROM 
(SELECT distinct journey_id, journey_pathway_id, journey_title, journey_state, journey_badge_title, journey_pathway_title 
FROM {{ref('c2_content_structure_metadata_vw')}}
WHERE journey_id IS NOT NULL ) remove_duplicates
LEFT OUTER JOIN 
(SELECT pathway_id, pathway_title, pathway_state, pathway_badge_title, card_id, 
card_title, card_state, content_structure, standard_card_type,
card_type, card_subtype, card_resource_url, ecl_id, ecl_source_name, tags, Duration_seconds,
Duration_HHMM, created_at, published_at, updated_at, card_author_id, card_author_full_name, 
in_journey, in_pathway, in_channel, is_public, views_unique, unique_views_category, views_all,
all_views_category, completions, clicked_link, shared_to_person, shared_to_group, comments, 
likes, bookmarks FROM {{ref('c_op_70_pathway_list_child_cards_in_pathway_vw')}}) select_columns_1
ON remove_duplicates.journey_pathway_id = select_columns_1.pathway_id