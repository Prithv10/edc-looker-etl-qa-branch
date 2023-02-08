-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part1_sub3_vw


-- PART-1 Query - Subset-3

-- 1.11 - Total Unique Card Views

SELECT DISTINCT
`Time` ,card_id ,event ,user_id ,shared_to_user_id , shared_to_group_id,
    platform,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success, performance_metric,CAST(NULL AS STRING) AS comment_status,
    referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM
(
	SELECT  *,RANK() OVER (PARTITION BY card_id,user_id ORDER BY TIME ASC) AS rankcol FROM (

		SELECT * FROM (
			SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
			'Total Unique Card Views' AS performance_metric,
			CAST(NULL AS STRING) AS comment_status,
			referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
			FROM {{ ref('u0_usercards_event_vw') }}  uc_event_vw
			WHERE card_id IS NOT NULL
			AND user_id IS NOT NULL
			AND event ='card_viewed'
		)
		WHERE attributes IS NULL OR attributes like '%standalone%' OR attributes = ''
	)
	qualify rankcol=1
)

UNION ALL



-- ETL has changed in DOMO .. The below 1.12 - Total Completions is old ETL transformation
-- 1.12 - Total Completions
/*
SELECT
`Time` ,card_id ,event ,user_id ,shared_to_user_id ,shared_to_group_id,
    platform,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success, performance_metric,CAST(NULL AS STRING) AS comment_status,
    referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM
(
	SELECT  *,RANK() OVER (PARTITION BY card_id,user_id ORDER BY TIME DESC) AS rankcol FROM (
		SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
		'Total Completions' AS performance_metric,
		CAST(NULL AS STRING) AS comment_status,
		referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
		FROM {{ ref('u0_usercards_event_vw') }}  uc_event_vw
		WHERE event ='card_marked_as_complete' OR event ='card_marked_as_uncomplete'
	)  qualify rankcol=1
) WHERE event ='card_marked_as_complete'

UNION ALL
*/
-- 1.13 - Total Content Source Visits

SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
'Total Content Source Visits' AS performance_metric,
CAST(NULL AS STRING) AS comment_status,
referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM {{ ref('u0_usercards_event_vw') }}
WHERE event ='card_source_visited'


UNION ALL


-- 1.14 - Following (Users)
SELECT `Time` ,card_id ,event ,user_id , shared_to_user_id , shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
performance_metric,CAST(NULL AS STRING) AS comment_status,referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM
(
	SELECT *,RANK() OVER (PARTITION BY user_id,followed_user_id ORDER BY TIME DESC) AS rankcol FROM (
		SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
		'Following (Users)' AS performance_metric,
		CAST(NULL AS STRING) AS comment_status,referer,follower_id ,followed_user_id ,card_rating ,
		badge_id ,badge_type ,badge_title
		FROM {{ ref('u0_usercards_event_vw') }}
		WHERE event ='user_followed' OR event = 'user_unfollowed'
	)
	 qualify rankcol=1
)a114
WHERE event ='user_followed'AND a114.followed_user_id IS NOT NULL


UNION ALL

-- 1.15 - Followers (Users)
SELECT `Time` ,card_id ,event ,followed_user_id as user_id,shared_to_user_id , shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success, performance_metric, comment_status, referer,user_id as follower_id, followed_user_id, card_rating ,badge_id ,badge_type ,badge_title FROM (
	SELECT *,RANK() OVER (PARTITION BY user_id,followed_user_id ORDER BY TIME DESC) AS rankcol FROM (
		SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
		'Followers (Users)' AS performance_metric,
		CAST(NULL AS STRING) AS comment_status,
		referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
		FROM {{ ref('u0_usercards_event_vw') }}
		WHERE event ='user_followed' OR event = 'user_unfollowed'
	)
	qualify rankcol=1
) WHERE event ='user_followed' 

