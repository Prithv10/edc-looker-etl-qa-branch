-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part1_sub2_vw

-- PART-1 Query - Subset-2

-- 1.6 - Total Published Journeys
SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id as shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
'Total Published Journeys' AS performance_metric,
CAST(NULL AS STRING) AS comment_status,
 referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM {{ ref('u0_usercards_event_vw') }}  uc_event_vw
WHERE event ='card_published' AND card_type='Journey'

UNION ALL

-- 1.7 - Total Published SmartCards

SELECT DISTINCT * FROM (
	-- 1.7.1
	SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id as shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
	'Total Published SmartCards' AS performance_metric,
	CAST(NULL AS STRING) AS comment_status,
	 referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
	FROM {{ ref('u0_usercards_event_vw') }}  uc_event_vw
	WHERE event ='card_published' AND card_type!='Pathway' AND card_type!='Journey'

	UNION ALL

	-- 1.7.2
	SELECT `Time` ,card_id ,event ,user_id , shared_to_user_id ,team_id as shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
	'Total Published SmartCards' AS performance_metric,
	CAST(NULL AS STRING) AS comment_status,
	 referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
	FROM {{ ref('u0_usercards_event_vw') }}  uc_event_vw
	WHERE event ='card_created' AND is_user_generated=1 AND card_state ='Published'
) a17


UNION ALL

-- 1.8 - Total Bookmarks
SELECT `Time` ,card_id ,event ,user_id , shared_to_user_id ,team_id as shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
'Total Bookmarks' AS performance_metric,
CAST(NULL AS STRING) AS comment_status,
referer,follower_id ,followed_user_id ,card_rating ,
badge_id ,badge_type ,badge_title
FROM {{ ref('u0_usercards_event_vw') }}  uc_event_vw
WHERE event ='card_bookmarked'

UNION ALL

-- 1.9 - Current Bookmarks
SELECT * FROM (
	SELECT
	`Time`,card_id ,event ,user_id ,shared_to_user_id ,shared_to_group_id,
		platform,comment_id, comment_message, card_state, 
	is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
	scorm_score, scorm_registration_success, performance_metric,comment_status,
		referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
	FROM
	(
		SELECT  *,RANK() OVER (PARTITION BY card_id,user_id ORDER BY TIME DESC) AS rankcol FROM (
			SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id AS shared_to_group_id, platform,comment_id, comment_message, card_state, 
		is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
		scorm_score, scorm_registration_success,
			'Current Bookmarks' AS performance_metric,CAST(NULL AS STRING) AS comment_status,
		referer,follower_id ,followed_user_id ,card_rating ,
			badge_id ,badge_type , badge_title
			FROM {{ ref('u0_usercards_event_vw') }} 
			WHERE event='card_bookmarked' OR event='card_unbookmarked'
	)
	qualify rankcol=1
	)
) WHERE event='card_bookmarked'

UNION ALL

-- 1.10 - Total Views
SELECT
`Time`,card_id ,event ,user_id ,shared_to_user_id , shared_to_group_id,
    platform,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,performance_metric,CAST(NULL AS STRING) AS comment_status,
    referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
 FROM
(
	SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
	'Total Views' AS performance_metric,
	CAST(NULL AS STRING) AS comment_status,
referer,follower_id ,followed_user_id ,card_rating ,
	badge_id ,badge_type ,badge_title
	FROM {{ ref('u0_usercards_event_vw') }}  uc_event_vw
	WHERE card_id IS NOT NULL
	AND user_id IS NOT NULL
	AND event ='card_viewed'
)
WHERE attributes IS NULL OR attributes like '%standalone%' OR attributes = ''
