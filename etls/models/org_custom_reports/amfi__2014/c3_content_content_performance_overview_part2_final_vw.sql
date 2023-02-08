-- Content [C][3] [Content Performance Overview]
-- c3_content_content_performance_overview_part2_final_vw

SELECT card_id, card_title, card_author_full_name, card_resource_url, card_state, 
card_type, card_subtype, ecl_source_name, is_public,
content_structure, 
       CASE WHEN total_shares_to_direct_users IS NULL THEN 0 ELSE total_shares_to_direct_users END as total_shares_to_direct_users,
       CASE WHEN total_shares_to_groups IS NULL THEN 0 ELSE total_shares_to_groups END as total_shares_to_groups,
       CASE WHEN total_comments IS NULL THEN 0 ELSE total_comments END as total_comments,
       CASE WHEN current_likes IS NULL THEN 0 ELSE current_likes END as current_likes,
       CASE WHEN total_bookmarks IS NULL THEN 0 ELSE total_bookmarks END as total_bookmarks,
       CASE WHEN current_bookmarks IS NULL THEN 0 ELSE current_bookmarks END as current_bookmarks,
       CASE WHEN total_views IS NULL THEN 0 ELSE total_views END as total_views,
       CASE WHEN total_unique_card_views IS NULL THEN 0 ELSE total_unique_card_views END as total_unique_card_views,
       CASE WHEN total_completions IS NULL THEN 0 ELSE total_completions END as total_completions,
       CASE WHEN total_content_source_visits IS NULL THEN 0 ELSE total_content_source_visits END as total_content_source_visits
       FROM (
SELECT * FROM
(SELECT card_id, card_title, card_author_full_name, card_resource_url, card_state, 
card_type, card_subtype, ecl_source_name, is_public,
content_structure, LOWER(REPLACE(REPLACE(REPLACE(TRIM(performance_metric),' ','_'),'(',''),')',''))
as performance_metric, total_activity
from {{ref('c3_content_content_performance_overview_part1_vw')}} 
) 
PIVOT(
	 SUM(total_activity) FOR performance_metric IN  
	(    "{{ dbt_utils.get_column_values(table=ref('c3_content_content_performance_overview_part1_vw'), column='performance_metric') | join('","') }}"
  )
) 
)