-- c2_custom_pathway_detailed_report_part1_vw
-- Custom [C][2] [Pathway Detailed Report]


WITH viewed_pathway_child_cards as(
SELECT training_record_registration_date, card_id, user_id, pathway_id, pathway_title FROM (
SELECT time as training_record_registration_date, card_id, user_id FROM {{ref('u1_users_total_unique_views_vw')}}) select_column_6
LEFT OUTER JOIN 
(SELECT pathway_id, CAST(card_id AS FLOAT64) as card_id_1, pathway_title FROM {{ref('card_pack_relation_dim_0_vw')}}) select_column_7
ON select_column_6.card_id = select_column_7.card_id_1),

join_data_4 as(
    SELECT user_id, pathway_id, pathway_title, card_id, training_record_registration_date, training_record_completed_date FROM viewed_pathway_child_cards
    LEFT OUTER JOIN 
    (SELECT time as training_record_completed_date, CAST(card_id as float64) as card_id_1, CAST(user_id as float64) as user_id_1 FROM {{ref('u1_users_completions_vw')}}) u1_users_completions_join
    ON viewed_pathway_child_cards.user_id = u1_users_completions_join.user_id_1
),

append_rows as (SELECT *, 'Started' as training_record_status FROM join_data_4
WHERE training_record_completed_date IS NULL 
UNION ALL 
SELECT *, 'Completed' as training_record_status FROM join_data_4)

SELECT *, Current_timestamp() as etl_record_created_time FROM append_rows
WHERE training_record_completed_date IS NOT NULL
