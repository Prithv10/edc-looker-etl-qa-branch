-- 1454_Glue_LeaderBoard_Data
-- leaderboard_user_agg_score_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'time_account_created', 'data_type': 'timestamp','granularity': 'month'},
    cluster_by = ["user_account_status"],
    tags=['incremental']
  )
}}


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
	,joindata2
AS (
	SELECT A.score_total
		,B.user_id AS user_id
		,User_Full_Name
		,User_Account_Status
		,Excluded_From_Leaderboard
		,email
		,Time_Account_Created
		,sign_in_count
		,Time_Account_Suspended
		,etl_record_created_time
	FROM userbyscoretotal A
	JOIN {{ ref('u1_users_latest_metadata_vw') }} B ON A.user_id = B.user_id
	)
SELECT *
FROM joindata2