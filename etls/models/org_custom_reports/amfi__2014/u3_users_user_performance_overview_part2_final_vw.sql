-- Users [U][3] [User Performance Overview]
-- u3_users_user_performance_overview_part2_final_vw

SELECT user_id, user_full_name, email, user_account_status,
       CASE WHEN total_shares_to_direct_users IS NULL THEN 0 ELSE total_shares_to_direct_users END as total_shares_to_direct_users,
       CASE WHEN total_shares_to_groups IS NULL THEN 0 ELSE total_shares_to_groups END as total_shares_to_groups,
       CASE WHEN total_comments IS NULL THEN 0 ELSE total_comments END as total_comments,
       CASE WHEN current_likes IS NULL THEN 0 ELSE current_likes END as current_likes,
       CASE WHEN followers_users IS NULL THEN 0 ELSE followers_users END as followers_users,
       CASE WHEN total_published_pathways IS NULL THEN 0 ELSE total_published_pathways END as total_published_pathways,
       CASE WHEN total_published_journeys IS NULL THEN 0 ELSE total_published_journeys END as total_published_journeys,
       CASE WHEN total_published_smartcards IS NULL THEN 0 ELSE total_published_smartcards END as total_published_smartcards,
       CASE WHEN total_bookmarks IS NULL THEN 0 ELSE total_bookmarks END as total_bookmarks,
       CASE WHEN current_bookmarks IS NULL THEN 0 ELSE current_bookmarks END as current_bookmarks,
       CASE WHEN total_views IS NULL THEN 0 ELSE total_views END as total_views,
       CASE WHEN total_unique_card_views IS NULL THEN 0 ELSE total_unique_card_views END as total_unique_card_views,
       CASE WHEN total_completions IS NULL THEN 0 ELSE total_completions END as total_completions,
       CASE WHEN total_content_source_visits IS NULL THEN 0 ELSE total_content_source_visits END as total_content_source_visits,
       CASE WHEN following_users IS NULL THEN 0 ELSE following_users END as following_users
       FROM (
SELECT * FROM
(SELECT user_id, user_full_name, email, user_account_status, total_activity,
 LOWER(REPLACE(REPLACE(REPLACE(TRIM(performance_metric),' ','_'),'(',''),')',''))
as performance_metric
from {{ref('u3_users_user_performance_overview_part1_vw')}} 
) 
PIVOT(
	 SUM(total_activity) FOR performance_metric IN  
	(    "{{ dbt_utils.get_column_values(table=ref('u3_users_user_performance_overview_part1_vw'), column='performance_metric') | join('","') }}"
  )
) 
)