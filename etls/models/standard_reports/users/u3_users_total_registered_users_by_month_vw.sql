-- 1454_Glue_Users [U][3] [Total Registered Users By Month]
-- u3_users_total_registered_users_by_month_vw


-- 1.1 day calendar flow
WITH day_extracts as (
SELECT
  date as time,
  FORMAT_DATE('%Y/%m/%d',date) as YMD,
  FORMAT_DATE('%Y/%m',date) as YM
  FROM 
    UNNEST(GENERATE_DATE_ARRAY('2010-01-01', current_date(), INTERVAL 1 DAY)) AS date
  ),
  group_by_ym AS (
   SELECT YM, count(*) FROM day_extracts 
   GROUP BY YM
  ),
  day_calendar_res AS (
   SELECT YM,1 AS date_id FROM group_by_ym 
  ),

  -- 1.2 user latest metadata filter_1
  select_user_latest AS (
  	SELECT user_id,time_account_suspended,1 AS date_id FROM {{ref('u1_users_latest_metadata_vw')}}
	WHERE user_id IS  NOT NULL
  ),
   user_latest_filter_1 AS (
	  SELECT PARSE_DATE('%Y/%m/%d',ym_time) AS ym_time,user_id FROM (
		  SELECT concat(a12.YM,'/','01') AS ym_time,a11.user_id FROM 
		  select_user_latest a11 LEFT JOIN day_calendar_res a12
		  ON a11.date_id = a12.date_id
		  ) user_lat_res
  ),
  -- SELECT * FROM user_latest_filter_1 LIMIT 200;
 
  user_latest_filter_2 AS (
 SELECT user_id,time_account_suspended,
 PARSE_DATE('%Y/%m/%d', 
 			concat(
 				  FORMAT_DATE('%Y/%m',time_account_suspended)
 					,'/','01') 
 	) as ym_time_suspended 
 FROM select_user_latest
 WHERE time_account_suspended IS NOT NULL ),

 -- join filter 1 and 2 results
 joined_user_latest_filter2_res as (
 	SELECT user_id,ym_time as ym_numb FROM (
	  SELECT a11_filter.user_id,a11_filter.ym_time,a12_filter.ym_time_suspended 
	  FROM user_latest_filter_1 a11_filter
	  LEFT JOIN user_latest_filter_2 a12_filter
  	  ON a11_filter.user_id = a12_filter.user_id
	) user_lat_res
 ),
 -- SELECT * FROM joined_user_latest_filter2_res
 
 -- 1.3 user latest  - account created - filter_3
 
 select_user_latest_acc_created AS (
  	SELECT user_id,time_account_created,1 AS date_id FROM {{ref('u1_users_latest_metadata_vw')}}
	WHERE user_id IS  NOT NULL
  ),
 user_latest_filter_3 AS (
    SELECT user_id, 
	  	PARSE_DATE('%Y/%m/%d', 
			concat( FORMAT_DATE('%Y/%m',time_account_created)
					 ,'/','01') 
			 	   ) as month_account_created
	  FROM select_user_latest_acc_created
  ),
 -- SELECT * FROM user_latest_filter_3 LIMIT 200;
  
 -- Join 1.2 filter results and 1.3 filter
 joined_user_latest_filter_2res_and_3 as (
	 SELECT a12_filter_res.user_id,a12_filter_res.ym_numb,
	  		a13_filter.month_account_created,a13_filter.user_id as user_id_1
	 FROM joined_user_latest_filter2_res a12_filter_res
	 LEFT JOIN user_latest_filter_3 a13_filter
	 ON a12_filter_res.user_id = a13_filter.user_id
 ),
 filter3_res AS (
 	SELECT user_id,ym_numb,month_account_created,
 		   DATE_DIFF(DATE(ym_numb), DATE(month_account_created), DAY) as days_diff
 	FROM joined_user_latest_filter_2res_and_3
 )
 
SELECT user_id,ym_numb as Time,'Total Registered Users' AS adoption_metric
FROM filter3_res WHERE days_diff>=0
