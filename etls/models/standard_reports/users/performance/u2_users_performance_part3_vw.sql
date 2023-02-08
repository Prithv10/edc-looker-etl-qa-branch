-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part3_vw


-- PART-3 Query

SELECT ab21211.*,ab21222.follower_user_full_name FROM
-- JOIN Data3
(
    -- JOIN Data2
	SELECT ab2121.*,ab2122.following_user_full_name  FROM
	(
		-- JOIN Data1
		SELECT ab211.*,ab212.shared_to_user_full_name FROM (
			SELECT user_lat_part2_a21.user_full_name,user_lat_part2_a21.email,user_perf_part2_b21.*,
			user_lat_part2_a21.time_account_created,user_lat_part2_a21.sign_in_count,user_lat_part2_a21.user_account_status,
			user_lat_part2_a21.excluded_from_leaderboard,user_lat_part2_a21.time_account_suspended,user_lat_part2_a21.external_id FROM
			-- Join Data
			(
				SELECT * FROM
				{{ ref('u1_users_latest_metadata_vw') }}
			) AS user_lat_part2_a21
			LEFT OUTER JOIN
			(
				SELECT * FROM
				{{ ref('u2_users_performance_part2_vw') }}
			) AS user_perf_part2_b21
			ON
			user_lat_part2_a21.user_id = user_perf_part2_b21.user_id
		) AS ab211
		LEFT OUTER JOIN
		(	SELECT user_id ,User_Full_Name as shared_to_user_full_name  FROM
			{{ ref('u1_users_latest_metadata_vw') }}
		) AS ab212
		ON
		ab211.shared_to_user_id = ab212.user_id
	) ab2121
	LEFT OUTER JOIN
	(	SELECT user_id as user_id_1,User_Full_Name as following_user_full_name   FROM
		{{ ref('u1_users_latest_metadata_vw') }}
	) AS ab2122
	ON
	ab2121.followed_user_id = ab2122.user_id_1
) ab21211
LEFT OUTER JOIN
(	SELECT user_id AS user_id_2 ,User_Full_Name as follower_user_full_name FROM
	{{ ref('u1_users_latest_metadata_vw') }}
) AS ab21222
ON
ab21211.follower_id = ab21222.user_id_2
