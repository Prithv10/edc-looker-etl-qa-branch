-- u3_users_journey_progression_overview_part4_vw


with all_completed_cards as(
SELECT
    CAST(user_id AS float64) AS user_id_completed, CAST(completable_id AS float64) AS card_id, completed_at AS time_completed
FROM
    {{ref('user_content_completions_dim_0_vw')}}
WHERE
    user_id IS NOT NULL),
----
time_completed_table as(  
SELECT
    distinct user_id_total_j_completions AS user_id, time_completed AS time_completed_journey, journey_id, journey_title, journey_pathway_id, journey_pathway_title, content_structure, total_cards_completed, total_journey_pathway_child_cards, total_journey_cards
FROM (
SELECT * from all_completed_cards
Right Outer Join 
    {{ref('u3_users_journey_progression_overview_part2_vw')}} content_stru_journey
ON
    all_completed_cards.card_id = content_stru_journey.journey_id
    AND all_completed_cards.user_id_completed = content_stru_journey.user_id_total_j_completions)) 
-----   
SELECT
    DISTINCT user_id AS user_id_1, time_completed_journey, journey_id AS journey_id_1, 
    overall_completion_status, journey_completion_progress, journey_progress
FROM(
    SELECT
        user_id, time_completed_journey, journey_id, journey_title, journey_pathway_id, journey_pathway_title, 
        content_structure, total_journey_pathway_child_cards, total_journey_cards, overall_completion_status, 
        total_journey_child_card_completions, (total_journey_child_card_completions / total_journey_cards) AS 
        journey_completion_progress, CONCAT(total_journey_child_card_completions,'/',total_journey_cards) AS 
        journey_progress
    FROM (
    SELECT
        user_id AS user_id_1, journey_id AS journey_id_1, SUM (total_cards_completed) AS 
        total_journey_child_card_completions
    FROM
        time_completed_table
    GROUP BY
        user_id,
        journey_id) group_by
    LEFT OUTER JOIN (
    SELECT
        *,
        CASE
        WHEN new_date IS NULL THEN 'Not Completed'
        ELSE
        'Completed'
    END
        AS overall_completion_status
    FROM (
        SELECT
        *,
        TIMESTAMP_DIFF(time_completed_journey, time_completed_journey, DAY) AS new_date
        FROM
        time_completed_table)) overall_completion_status_journey
    ON
    overall_completion_status_journey.user_id = group_by.user_id_1
    AND overall_completion_status_journey.journey_id = group_by.journey_id_1)