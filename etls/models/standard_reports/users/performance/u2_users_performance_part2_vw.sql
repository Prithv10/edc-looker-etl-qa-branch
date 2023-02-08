-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part2_vw

-- PART-2 Query

SELECT `Time` ,card_id ,event ,user_id ,shared_to_user_id ,shared_to_group_id,platform  ,performance_metric,comment_id,comment_message,comment_status,
`attributes`,follower_id ,followed_user_id ,
(CASE WHEN (user_perf_b1.content_completion_sync IS NULL ) THEN 'False'  ELSE user_perf_b1.content_completion_sync END) AS content_completion_sync ,
badge_id ,badge_type ,badge_title,card_rating ,referer FROM
(
  (
	  SELECT
	  `Time` ,card_id ,event ,user_id ,shared_to_user_id ,shared_to_group_id,
	  (CASE WHEN (platform ='iPhone') THEN 'ios'  ELSE platform END) AS platform  ,
	  performance_metric, comment_id, comment_message,comment_status, NULL AS `attributes`,referer,follower_id ,followed_user_id ,card_rating ,badge_id ,badge_type ,badge_title
	  FROM
	  {{ ref('u2_users_performance_part1_vw') }}
  ) AS user_perf_a1
  LEFT OUTER JOIN
  (
    SELECT card_id AS card_id_1,user_id AS user_id_1,event AS event_1,Time AS time_1,
    CAST('True' AS STRING) AS content_completion_sync
    FROM
    {{ ref('u2_users_performance_part1_vw') }}
    WHERE platform='EDC-LMS' AND event ='card_marked_as_complete'
  ) AS user_perf_b1
  ON user_perf_a1.card_id =user_perf_b1.card_id_1
  AND user_perf_a1.user_id =user_perf_b1.user_id_1
  AND user_perf_a1.event =user_perf_b1.event_1
  AND user_perf_a1.Time =user_perf_b1.time_1
)
