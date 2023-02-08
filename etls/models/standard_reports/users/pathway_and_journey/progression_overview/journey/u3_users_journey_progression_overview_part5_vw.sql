-- u3_users_journey_progression_overview_part5_vw

-- join data 2
SELECT user_id, journey_id, journey_title, journey_pathway_id, journey_pathway_title, content_structure, total_cards_completed, total_journey_pathway_child_cards, total_journey_cards, journey_pathway_progress, time_completed_journey, overall_completion_status, journey_completion_progress, journey_progress, journey_pathway_completion_progress, journey_pathway_completion_status

FROM(
SELECT * FROM {{ref('u3_users_journey_progression_overview_part3_vw')}} jpathway
Left Outer Join 
(SELECT * FROM {{ref('u3_users_journey_progression_overview_part4_vw')}}) remove_duplicates
ON jpathway.user_id = remove_duplicates.user_id_1
AND jpathway.journey_id = remove_duplicates.journey_id_1)
 