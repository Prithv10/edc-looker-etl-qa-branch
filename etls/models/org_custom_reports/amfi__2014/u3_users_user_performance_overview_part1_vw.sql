-- Users [U][3] [User Performance Overview]
-- u3_users_user_performance_overview_part1_vw

With groupbytable as(
SELECT LOWER(REPLACE(REPLACE(REPLACE(TRIM(performance_metric),' ','_'),'(',''),')','')) as performance_metric, 
user_id, user_full_name, email, user_account_status, count(performance_metric) as total_activity
FROM {{ref('u2_users_performance_part5_final_results_vw')}} 
group by 
user_id, user_full_name, email, user_account_status, performance_metric)
SELECT * FROM groupbytable
