-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part1_sub4_vw


-- PART-1 Query - Subset-4

-- 1.16 - Total Ratings

SELECT * EXCEPT(rankcol) FROM (
	SELECT *,RANK() OVER (PARTITION BY card_id,user_id ORDER BY TIME DESC) AS rankcol FROM (
		SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
		'Total Ratings' AS performance_metric,
		CAST(NULL AS STRING) AS comment_status,
		referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
		FROM {{ ref('u0_usercards_event_vw') }}
		WHERE event ='card_relevance_rated'
	)
	qualify rankcol=1
)

UNION ALL

-- 1.17 - Total Badges Shared
SELECT * EXCEPT(rankcol) FROM (
	SELECT *,RANK() OVER (PARTITION BY badge_id,user_id ORDER BY TIME DESC) AS rankcol FROM (
		SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
		'Total Badges Shared' AS performance_metric,
		CAST(NULL AS STRING) AS comment_status,
		referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
		FROM {{ ref('u0_usercards_event_vw') }}
		WHERE event ='user_badge_shared_on_social' AND badge_type ='CardBadging'
		) qualify rankcol=1
)

UNION ALL

-- 1.18 - Total Badges Earned

SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
'Total Badges Earned' AS performance_metric,
CAST(NULL AS STRING) AS comment_status,
referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM {{ ref('u0_usercards_event_vw') }}
WHERE event ='user_badge_completed'AND badge_type ='CardBadging'

UNION ALL

-- 1.19 - CLC Badges Completed

SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
'CLC Badges Completed' AS performance_metric,
CAST(NULL AS STRING) AS comment_status,
referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM {{ ref('u0_usercards_event_vw') }}
WHERE event ='user_badge_completed'AND badge_type ='ClcBadging'
