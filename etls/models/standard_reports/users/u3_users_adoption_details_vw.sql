-- 1454_Glue_User[U][3] Adoption_Details
-- u3_users_adoption_details_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'Time', 'data_type': 'date','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["User_Account_Status"],
    tags=['incremental']
  )
}}

-- 1.1 - user performance filter results
WITH 
user_perf_filter_res_a11 AS
(
	SELECT user_id,`Time` FROM
	(
		SELECT user_id,`Time`, performance_metric ,platform  FROM 
		{{ref('u2_users_performance_part5_final_results_vw')}}
		WHERE performance_metric NOT IN ('Followers (Users)','Total Sign-In Count','N/A','Total Completions')
		AND user_id IS NOT NULL AND `Time`<=CURRENT_TIMESTAMP()  AND platform != 'EDC-LMS' 
	)
),
-- 1.2 - Active users metric
active_users_metric_a12 AS (
	SELECT user_id,DATE(MIN(`Time`)) AS `Time`,'Active Users (New)' AS adoption_metric FROM user_perf_filter_res_a11 
	GROUP BY user_id 
),
-- 1.3 - Monthly Active Users metric
monthly_active_users_metric_a13 AS (
	SELECT user_id,
		  PARSE_DATE('%Y/%m/%d', 
			concat( FORMAT_DATE('%Y/%m',`Time`)
					 ,'/','01') 
			 	   ) as `Time`,
			'Monthly Active Users' AS adoption_metric
	FROM user_perf_filter_res_a11 
	GROUP BY user_id,Time
),
-- 2 Append metrics
appended_metrics_2 AS (
	SELECT * FROM active_users_metric_a12
	UNION ALL
	SELECT * FROM monthly_active_users_metric_a13
	UNION ALL
	SELECT * FROM {{ref('u3_users_total_registered_users_by_month_vw')}}
),
join_user_latest_3 AS (
		SELECT a2.*,a3.User_Full_Name,a3.User_Account_Status,a3.Excluded_From_Leaderboard,a3.email,a3.Time_Account_Created,a3.sign_in_count,a3.Time_Account_Suspended,a3.external_id
		FROM appended_metrics_2 a2 
		INNER JOIN {{ref('u1_users_latest_metadata_vw')}} a3
		ON a2.user_id = a3.user_id 
)
SELECT * FROM join_user_latest_3
