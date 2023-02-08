-- u3_users_journey_progression_overview_part6_vw


WITH append_rows_1 as(
SELECT
  user_id, total_cards_completed, content_structure, overall_completion_status, time_completed_journey, journey_id, journey_title, journey_pathway_id, journey_pathway_title, total_journey_pathway_child_cards, total_journey_cards, journey_pathway_progress, journey_progress, journey_pathway_completion_progress, journey_pathway_completion_status, journey_completion_progress
FROM
  {{ref('u3_users_journey_progression_overview_part5_vw')}}
WHERE
  overall_completion_status = 'Not Completed' 
and
    journey_completion_progress < 1
UNION ALL
SELECT
  user_id, total_cards_completed, content_structure, overall_completion_status, time_completed_journey, journey_id, journey_title, journey_pathway_id, journey_pathway_title, total_journey_pathway_child_cards, total_journey_cards, journey_pathway_progress, journey_progress, journey_pathway_completion_progress, journey_pathway_completion_status, CAST(.98 AS float64) AS journey_completion_progress
FROM 
    {{ref('u3_users_journey_progression_overview_part5_vw')}}
  WHERE
    overall_completion_status = 'Not Completed' 
and 
  journey_completion_progress = 1
UNION ALL
SELECT
  user_id, total_cards_completed, content_structure, overall_completion_status, time_completed_journey, journey_id, journey_title, journey_pathway_id, journey_pathway_title, total_journey_pathway_child_cards, total_journey_cards, journey_pathway_progress, journey_progress, journey_pathway_completion_progress, journey_pathway_completion_status, journey_completion_progress
FROM
  {{ref('u3_users_journey_progression_overview_part5_vw')}}
WHERE
  overall_completion_status = 'Completed')
--
SELECT
    *
  FROM
    append_rows_1
