-- 1454_Glue_LeaderBoard_Data
-- leaderboard_data_part1_vw


  -- user_and_score_details
WITH userscoredate
AS (
	SELECT user_id
		,score
		,score_date
	FROM (
		SELECT DISTINCT user_id
			,CAST(score AS INT) AS score
			,CAST(score_day AS DATE) AS score_date
			,record_insert_time
		FROM {{get_db_source('leaderboard_user_score_i_v') }}
		WHERE score > 0
		)
	)
	,userbyscoretotal
AS (
	SELECT user_id
		,sum(score) AS score_total
	FROM userscoredate
	GROUP BY user_id
	)
	,joindata1 --user,score,details
AS (
	SELECT A.user_id
		,A.score
		,A.score_date AS DATE
		,B.score_total
	FROM userscoredate A
	LEFT OUTER JOIN userbyscoretotal B ON A.user_id = B.user_id
	)
	,userskillbase
AS (
	SELECT DISTINCT user_id
		,skill_label AS skill
	FROM {{ref('skills_users_dim_m_v') }}
	WHERE issue_date IS NULL
		AND (
			skill_label IS NOT NULL
			AND skill_label != ''
			)
	)
	,userskillaggregated
AS (
	SELECT user_id
		,STRING_AGG(Skill, ",") AS user_skills_combined
		,COUNT(DISTINCT skill) AS user_skills_distinct_count_old
		,CASE
			WHEN COUNT(DISTINCT skill) < 1
				THEN 1
			ELSE COUNT(DISTINCT skill)
			END AS user_skills_distinct_count
	FROM userskillbase
	GROUP BY user_id
	)
	,userskill_skillaggregatedcombined
AS (
	SELECT A.user_id
		,A.skill
		,B.user_skills_combined
		,B.user_skills_distinct_count_old
		,B.user_skills_distinct_count
	FROM userskillbase A
	LEFT OUTER JOIN userskillaggregated B ON A.user_id = B.user_id
	)
	,userscore_userskillscombined --join data3
AS (
	SELECT A.user_id
		,A.score
		,A.DATE
		,A.score_total
		,B.skill
		,B.user_skills_combined
		,B.user_skills_distinct_count
		,B.user_skills_distinct_count_old
	FROM joindata1 A
	LEFT OUTER JOIN userskill_skillaggregatedcombined B ON A.user_id = B.user_id
	)
	,groupsbase
AS (
	SELECT group_name
		,CAST(user_id AS INT) AS user_id
		,group_user_role
	FROM {{ ref('g2_groups_users_vw') }}
	)
	,groupsaggregation
AS (
	SELECT user_id
		,STRING_AGG(group_name, ",") AS user_group_combined
		,COUNT(DISTINCT group_name) AS user_group_distinct_count
	FROM groupsbase
	GROUP BY user_id
	)
	,groupbase_aggregation --join data4
AS (
	SELECT A.group_name
		,A.user_id
		,A.group_user_role
		,B.user_group_combined
		,B.user_group_distinct_count
	FROM groupsbase A
	LEFT OUTER JOIN groupsaggregation B ON A.user_id = B.user_id
	)
	,groups_joindata3 --join data 6
AS (
	SELECT A.user_id
		,A.score
		,A.DATE
		,A.score_total
		,A.skill
		,A.user_skills_combined
		,A.user_skills_distinct_count
		,B.group_name
		,B.group_user_role
		,B.user_group_combined
		,B.user_group_distinct_count
	FROM userscore_userskillscombined A
	LEFT OUTER JOIN groupbase_aggregation B ON A.user_id = B.user_id
	)
SELECT *
FROM groups_joindata3