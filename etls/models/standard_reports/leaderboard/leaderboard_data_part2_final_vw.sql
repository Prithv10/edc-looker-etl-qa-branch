-- 1454_Glue_LeaderBoard_Data
-- leaderboard_data_part2_final_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'Date', 'data_type': 'date',  'granularity': 'year'},
    cluster_by = ["user_account_status"],
    tags=['incremental']
  )
}}

SELECT user_id
	,score
	,DATE
	,score_total
	,Skill
	,user_skills_combined
	,user_skills_distinct_count
	,group_name
	,group_user_role
	,user_group_combined
	,user_group_distinct_count
	,user_full_name
	,user_account_status
	,excluded_from_leaderboard
	,email
	,time_account_created
	,sign_in_count
	,time_account_suspended
FROM {{ ref('leaderboard_data_part1_vw') }} AS select_columns_7
LEFT OUTER JOIN (
	SELECT user_id AS user_id_1
		,User_Full_Name
		,User_Account_Status
		,Excluded_From_Leaderboard
		,email
		,Time_Account_Created
		,sign_in_count
		,Time_Account_Suspended
		,etl_record_created_time
	FROM {{ ref('u1_users_latest_metadata_vw') }}
	) AS u1_users_latest_metadata ON select_columns_7.user_id = u1_users_latest_metadata.user_id_1