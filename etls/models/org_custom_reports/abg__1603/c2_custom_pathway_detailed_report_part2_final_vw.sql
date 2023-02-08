-- c2_custom_pathway_detailed_report_part2_final_vw
-- Custom [C][2] [Pathway Detailed Report]

WITH select_columns as(
SELECT * FROM {{ref('c2_custom_pathway_detailed_report_part1_vw')}} append_rows
LEFT OUTER JOIN 
(SELECT CAST(card_id as float64) as card_id_1, current_content_owner_id, current_content_owner_full_name, card_state, card_subtype, card_type, ecl_id, ecl_source_name, is_public, Duration_HHMM, Duration, Duration_seconds, published_at, card_title, created_at, updated_at, card_level, average_rating, standard_card_type, card_resource_url, content_structure, org_id_s, author_id, card_author_full_name, tags
 FROM {{ref('c1_content_latest_metadata_vw')}}) set_column_type_2
ON append_rows.card_id = set_column_type_2.card_id_1)


SELECT * FROM {{ref('u1_users_latest_metadata_vw')}} u1_users_latest
LEFT OUTER JOIN (SELECT user_id as user_id_1, pathway_id, pathway_title, card_id, training_record_registration_date, training_record_completed_date, training_record_status, card_id_1, current_content_owner_id, current_content_owner_full_name, card_state, card_subtype, card_type, ecl_id, ecl_source_name, is_public, Duration_HHMM, Duration, Duration_seconds, published_at, card_title, created_at, updated_at, card_level, average_rating, standard_card_type, card_resource_url, content_structure, org_id_s, author_id, card_author_full_name, tags
FROM select_columns) select_columns_join
ON u1_users_latest.user_id = select_columns_join.user_id_1
