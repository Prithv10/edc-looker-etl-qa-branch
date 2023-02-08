-- top_20_content_vw
-- 100104_Glue_Top_20_Content

WITH filter_rows_28 as(
SELECT card_id as card_id_1, card_title as card_title_1, content_counts, rank1 FROM (SELECT card_id, card_title, content_counts, ROW_NUMBER() OVER(ORDER BY content_counts DESC) as rank1 FROM 
(SELECT card_id, card_title, count(performance_metric) as content_counts FROM {{ref('u2_users_performance_part5_final_results_vw')}}
GROUP BY card_id, card_title))
WHERE rank1 <= 20),

final_table as(
SELECT * FROM filter_rows_28
INNER JOIN 
{{ref('u2_users_performance_part5_final_results_vw')}} value_mapper 
ON filter_rows_28.card_id_1 = value_mapper.card_id)

SELECT * except(card_id_1, card_title_1, rank1, content_counts)
FROM final_table

