-- test1
-- test_ss_vw

SELECT 
card_title, card_id, card_type, card_subtype, content_structure,
total_views, event, performance_metric, time, card_id_1, card_resource_url, card_state,
card_subtype_1, card_title_1, card_type_1, ecl_id, is_public, content_structure_1, author_id as card_author_id, 
card_author_full_name, average_rating as avg_rating, null as total_user_ratings, ecl_source_name_1,
null as card_author_sme, Duration_seconds, Duration_HHMM, null as tags
FROM(
SELECT c3_content.card_title, c3_content.card_id, c3_content.card_type, c3_content.card_subtype, c3_content.content_structure, 
total_views, event, performance_metric, time
FROM 
(SELECT * FROM {{ref('c3_content_content_performance_overview_part2_final_vw')}}) c3_content 
FULL OUTER JOIN 
(SELECT * FROM {{ref('u2_users_performance_part5_final_results_vw')}}) u2_performance 
ON c3_content.card_id = u2_performance.card_id) select_columns
LEFT OUTER JOIN 
(SELECT 
card_id as card_id_1, current_content_owner_id, current_content_owner_full_name, card_state,
card_subtype as card_subtype_1, card_type as card_type_1, ecl_id, ecl_source_name as ecl_source_name_1, is_public, Duration_HHMM, Duration_seconds, published_at,
card_title as card_title_1, created_at, updated_at, card_level, average_rating, standard_card_type, card_resource_url,
content_structure as content_structure_1, org_id_s, author_id, card_author_full_name
FROM {{ref('c1_content_latest_metadata_vw')}}) c1_content 
ON select_columns.card_id = c1_content.card_id_1