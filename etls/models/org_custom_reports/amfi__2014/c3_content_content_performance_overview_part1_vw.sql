-- Content [C][3] [Content Performance Overview]
-- c3_content_content_performance_overview_part1_vw


With groupbytable as(
SELECT LOWER(REPLACE(REPLACE(REPLACE(TRIM(performance_metric),' ','_'),'(',''),')','')) as performance_metric, card_id, card_title, card_author_full_name, card_resource_url, card_state, 
card_type, card_subtype, ecl_source_name, is_public,
content_structure, count(performance_metric) as total_activity
FROM {{ref('u2_users_performance_part5_final_results_vw')}} 
group by 
performance_metric, card_id, card_title, card_author_full_name, card_resource_url, card_state, 
card_type, card_subtype, ecl_source_name, is_public,
content_structure)

SELECT * FROM groupbytable
