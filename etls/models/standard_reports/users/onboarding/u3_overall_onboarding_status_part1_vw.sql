-- 1454_Glue_Users [U][3] [Overall Onboarding Status]
-- u3_overall_onboarding_status_part1_vw
	
SELECT 
        user_id,cast(`Time` as date) as mdy,count(*) as total_day_activity_count
    FROM (
    SELECT *
    FROM {{ref('u2_users_performance_part5_final_results_vw')}}
    WHERE event != 'card_created_virtual' AND `Time` IS NOT NULL AND performance_metric != 'Followers (Users)'
    and performance_metric IS NOT NULL AND platform not like '%EDC-LMS%'
) a11 
WHERE performance_metric NOT IN ('Total Completions','CLC Badges Completed','Total Badges Earned','Followers (Users)')
GROUP BY user_id,mdy
