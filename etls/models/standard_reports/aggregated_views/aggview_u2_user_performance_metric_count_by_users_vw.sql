-- aggview_u2_user_performance_metric_count_by_users_vw
SELECT * FROM
(select user_id,user_full_name,
LOWER(REPLACE(REPLACE(REPLACE(TRIM(performance_metric),' ','_'),'(',''),')',''))
as performance_metric,1  AS metric_count 
from {{ref('u2_users_performance_part5_final_results_vw')}} 
) 
PIVOT(
	 SUM(metric_count) FOR performance_metric IN  
	(    "{{ dbt_utils.get_column_values(table=ref('aggview_u2_user_performance_distinct_metric_vw'), column='performance_metric') | join('","') }}"
  )
) 
