-- Glue Content Structure + Glue User Performance
-- glue_content_structure_glue_user_performance_vw

SELECT c2.*, u2.* EXCEPT(card_id, card_state, card_title, card_type, card_author_id, card_author_full_name, card_resource_url, 
Duration_seconds, Duration_HHMM, ecl_id, ecl_source_name, is_public, card_subtype, standard_card_type, average_rating, card_level, 
current_content_owner_full_name) FROM
 {{ ref('c2_content_structure_metadata_vw') }} AS c2
INNER JOIN
 {{ ref('u2_users_performance_part5_final_results_vw') }} AS u2
ON
 c2.card_id = u2.card_id