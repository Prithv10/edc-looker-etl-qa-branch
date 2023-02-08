-- u3_users_journey_progression_overview_part3_vw


With append_rows_2 as(
SELECT
    DISTINCT user_id_total_j_completions AS user_id, journey_id, journey_title, journey_pathway_id, journey_pathway_title, content_structure, total_cards_completed, total_journey_pathway_child_cards, total_journey_cards, (Total_Cards_Completed/Total_journey_Pathway_Child_Cards) AS journey_pathway_completion_progress
FROM ( 
SELECT
        CAST(user_id AS float64) AS user_id_completed, CAST(completable_id AS float64) AS card_id, completed_at AS time_completed
    FROM
        {{ref('user_content_completions_dim_0_vw')}}
    WHERE
        user_id IS NOT NULL) all_completed_cards
    RIGHT OUTER JOIN (
    SELECT
        *
    FROM
        {{ref('u3_users_journey_progression_overview_part2_vw')}}) content_stru_journey
    ON
    all_completed_cards.card_id = content_stru_journey.journey_pathway_id
    AND all_completed_cards.user_id_completed = content_stru_journey.user_id_total_j_completions )

SELECT
    *,
    CONCAT(total_cards_completed,'/',total_journey_pathway_child_cards) AS journey_pathway_progress
  FROM (
SELECT *, 'Completed' AS journey_pathway_completion_status FROM append_rows_2
WHERE journey_pathway_completion_progress = 1
UNION ALL
SELECT *, 'Not Completed' AS journey_pathway_completion_status FROM append_rows_2
WHERE journey_pathway_completion_progress < 1)
