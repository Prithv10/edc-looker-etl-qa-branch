-- ucc_merged_buffered_temp_vw

SELECT Time, card_id, event, user_id, shared_to_user_id, shared_to_group_id, case when (platform is null or platform='') then 'web' else platform END as platform, comment_id, comment_message, card_state, is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, scorm_score, scorm_registration_success, performance_metric, comment_status, referer, follower_id, followed_user_id, card_rating, badge_id, badge_type, badge_title
FROM(
SELECT user_id, completable_id as card_id, completed_at as time, 'Total Completions' as performance_metric, 
'card_marked_as_complete' as event FROM {{ref('user_content_completions_dim_0_vw')}}
WHERE completed_at IS NOT NULL 
or cast(completed_at as string) != '') select_columns
LEFT OUTER JOIN 
(SELECT distinct * FROM (SELECT card_id as card_id_1, user_id as user_id_1, platform, referer, time as time1, event as event1, shared_to_user_id , shared_to_group_id, comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
CAST(NULL AS STRING) AS comment_status,
follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title,
RANK() OVER (PARTITION BY card_id, user_id ORDER BY time DESC) AS rank from(
SELECT time, event, platform, referer, card_id, user_id,
shared_to_user_id ,team_id  AS shared_to_group_id, comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
CAST(NULL AS STRING) AS comment_status,
follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
from {{ref('u0_usercards_event_vw')}}
WHERE event = 'card_marked_as_complete'
or event = 'card_marked_as_uncomplete'
)
QUALIFY rank = 1)
WHERE event1 = 'card_marked_as_complete') remove_dup

ON select_columns.user_id = remove_dup.user_id_1
and select_columns.card_id = remove_dup.card_id_1