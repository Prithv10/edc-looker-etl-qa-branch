-- aggview_u2_user_performance_distinct_metric_vw
WITH dist_perf_metric AS (
SELECT DISTINCT LOWER(REPLACE(REPLACE(REPLACE(TRIM(performance_metric),' ','_'),'(',''),')','')) as performance_metric FROM 
{{ref('u2_users_performance_part5_final_results_vw')}}
)
SELECT * FROM dist_perf_metric