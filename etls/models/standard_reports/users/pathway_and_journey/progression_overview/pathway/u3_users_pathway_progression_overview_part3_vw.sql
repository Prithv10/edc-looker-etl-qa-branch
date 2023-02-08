-- u3_users_pathway_progression_overview_part3_vw

-- append rows
SELECT * FROM {{ref('u3_users_pathway_progression_overview_part2_vw')}}
WHERE overall_completion_status = 'Completed'
UNION ALL
SELECT * FROM {{ref('u3_users_pathway_progression_overview_part2_vw')}}
WHERE overall_completion_status != 'Completed'
and completion_progress < 1
UNION ALL 
SELECT user_id, time_completed, pathway_id, total_cards_completed, pathway_title, content_structure, total_pathway_child_cards, pathway_progress_seconds, new_date2, 
        overall_completion_status, CAST(.98 AS float64) AS completion_progress, pathway_progress FROM {{ref('u3_users_pathway_progression_overview_part2_vw')}}
WHERE overall_completion_status != 'Completed'
and completion_progress = 1
