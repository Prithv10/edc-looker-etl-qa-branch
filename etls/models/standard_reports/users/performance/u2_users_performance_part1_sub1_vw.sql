-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part1_sub1_vw


-- PART-1 Query - Subset-1 
-- 1.1 - Total Shares to Direct Users

SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform , comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
'Total Shares to Direct Users' AS performance_metric, CAST(NULL AS STRING) AS comment_status, 
referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title, 
FROM
{{ ref('u0_usercards_event_vw') }} 
WHERE event ='card_shared'	AND shared_to_user_id IS NOT NULL

UNION ALL

-- 1.2 - Total Shares to Direct Groups
SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
'Total Shares to Groups' AS performance_metric, CAST(NULL AS STRING) AS comment_status,
referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM {{ ref('u0_usercards_event_vw') }} uc_event_vw
WHERE event ='card_shared' AND team_id  IS NOT NULL

UNION ALL

-- 1.3 - Total Comments

	-- 1.3.1 - Total Comments card_comment_created
SELECT 
	uc_event_vw_card_created.`Time` ,
uc_event_vw_card_created.card_id ,
uc_event_vw_card_created.event ,
uc_event_vw_card_created.user_id ,
	uc_event_vw_card_created.shared_to_user_id ,
uc_event_vw_card_created.shared_to_group_id,
uc_event_vw_card_created.platform,
comment_id, 
comment_message,
card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
	'Total Comments' AS performance_metric,
	'Active' as comment_status,
	uc_event_vw_card_created.referer,
	uc_event_vw_card_created.follower_id ,
	uc_event_vw_card_created.followed_user_id ,uc_event_vw_card_created.card_rating ,uc_event_vw_card_created.badge_id ,
	uc_event_vw_card_created.badge_type ,uc_event_vw_card_created.badge_title

FROM (
	( SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success, referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
		FROM {{ ref('u0_usercards_event_vw') }} 
	WHERE event ='card_comment_created') as uc_event_vw_card_created
	LEFT JOIN 
	( SELECT event,card_id ,user_id,comment_id as comment_id_1
	FROM {{ ref('u0_usercards_event_vw') }} 
	WHERE event ='card_comment_deleted'
	) AS uc_event_vw_card_delted
	ON 
	uc_event_vw_card_created.card_id = uc_event_vw_card_delted.card_id AND
	uc_event_vw_card_created.user_id = uc_event_vw_card_delted.user_id AND
	uc_event_vw_card_created.comment_id = uc_event_vw_card_delted.comment_id_1
	)
WHERE comment_id_1 IS NULL
UNION ALL 
SELECT 
	uc_event_vw_card_created.`Time` ,
uc_event_vw_card_created.card_id ,
uc_event_vw_card_created.event ,
uc_event_vw_card_created.user_id ,
	uc_event_vw_card_created.shared_to_user_id ,
uc_event_vw_card_created.shared_to_group_id,
uc_event_vw_card_created.platform,
comment_id, 
comment_message,
card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success,
	'Total Comments' AS performance_metric,
    'Deleted' as comment_status,
	uc_event_vw_card_created.referer,
	uc_event_vw_card_created.follower_id ,
	uc_event_vw_card_created.followed_user_id ,uc_event_vw_card_created.card_rating ,uc_event_vw_card_created.badge_id ,
	uc_event_vw_card_created.badge_type ,uc_event_vw_card_created.badge_title

FROM (
	( SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id  AS shared_to_group_id,platform ,comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion , scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success, referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
		FROM {{ ref('u0_usercards_event_vw') }} 
	WHERE event ='card_comment_created') as uc_event_vw_card_created
	LEFT JOIN 
	( SELECT event,card_id ,user_id,comment_id as comment_id_1
	FROM {{ ref('u0_usercards_event_vw') }} 
	WHERE event ='card_comment_deleted'
	) AS uc_event_vw_card_delted
	ON 
	uc_event_vw_card_created.card_id = uc_event_vw_card_delted.card_id AND
	uc_event_vw_card_created.user_id = uc_event_vw_card_delted.user_id AND
	uc_event_vw_card_created.comment_id = uc_event_vw_card_delted.comment_id_1
	)
WHERE comment_id_1 IS NOT NULL

UNION ALL

-- 1.4 - Current Likes
SELECT * FROM (
	SELECT DISTINCT 
	`Time` ,card_id ,event ,user_id , shared_to_user_id , shared_to_group_id,platform ,
	comment_id, comment_message, card_state, 
	is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
	scorm_score, scorm_registration_success, performance_metric,comment_status,
	referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
	FROM
	(
		SELECT  *,RANK() OVER (PARTITION BY user_id,card_id ORDER BY TIME DESC) AS rankcol FROM (
			SELECT `Time` ,card_id ,event ,user_id,shared_to_user_id , team_id as shared_to_group_id, platform, comment_id, comment_message, card_state, 
		is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion, scorm_total_seconds_tracked, 
		scorm_score, scorm_registration_success,
			'Current Likes' AS performance_metric,CAST(NULL AS STRING) AS comment_status,
			referer,follower_id ,followed_user_id , card_rating ,
			badge_id ,badge_type ,badge_title
			FROM {{ ref('u0_usercards_event_vw') }} 
			WHERE event='card_liked' OR event='card_unliked'  
		) qualify rankcol=1 
	) WHERE event='card_liked'
 ) a14 

UNION ALL

-- 1.5 - Total Published Pathways
SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,team_id as shared_to_group_id,platform ,
comment_id, comment_message, card_state, 
is_user_generated, card_type, attributes, scorm_attempts, scorm_course_id, scorm_registration_completion as scorm_registration_status, scorm_total_seconds_tracked, 
scorm_score, scorm_registration_success, 'Total Published Pathways' AS performance_metric, CAST(NULL AS STRING) AS comment_status, 
 referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
FROM {{ ref('u0_usercards_event_vw') }} uc_event_vw
WHERE event ='card_published' AND card_type='Pathway'

