-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part4_vw

-- PART-4 Query
SELECT a41.*,a42.shared_to_group_name FROM
(
	SELECT a31.card_id,user_full_name,email,Time,event,user_id,shared_to_user_id,shared_to_group_id,platform,performance_metric,
	comment_id,comment_message,comment_status,attributes,follower_id,followed_user_id,content_completion_sync,badge_id,badge_type,
	badge_title,card_rating,referer,time_account_created,sign_in_count,user_account_status,excluded_from_leaderboard,shared_to_user_full_name,
	following_user_full_name,follower_user_full_name,external_id,
	author_id,card_author_full_name,card_state,card_subtype,card_type,ecl_id,ecl_source_name,is_public,Duration_HHMM,Duration_seconds,published_at,
	card_title,created_at,updated_at,card_level,average_rating,standard_card_type,card_resource_url,
	current_content_owner_full_name,content_structure, time_account_suspended
	FROM
	{{ ref('u2_users_performance_part3_vw') }} a31
	LEFT OUTER JOIN
	(
		select * from {{ ref('c1_content_latest_metadata_vw') }}
	) AS a32
	ON
	a31.card_id = a32.card_id
) a41
LEFT OUTER JOIN
(
	select group_id,group_name AS shared_to_group_name from {{ ref('g1_groups_latest_metadata_vw') }}
) AS a42
ON
a41.shared_to_group_id = a42.group_id
