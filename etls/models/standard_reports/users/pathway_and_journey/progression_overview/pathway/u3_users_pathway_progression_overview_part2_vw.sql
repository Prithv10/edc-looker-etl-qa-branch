-- u3_users_pathway_progression_overview_part2_vw


SELECT
    *,
    CASE
      WHEN new_date2 IS NULL THEN 'Not Completed'
    ELSE
    'Completed'
  END
    AS overall_completion_status,
    (Total_Cards_Completed/Total_Pathway_Child_Cards) AS completion_progress,
    CONCAT(Total_Cards_Completed, '/', Total_Pathway_Child_Cards) AS pathway_progress
  FROM (
    SELECT
      user_id_total_completions AS user_id, time_completed AS Time_Completed, pathway_id, Total_Cards_Completed, Pathway_Title, Content_Structure, total_pathway_child_cards, 
      Pathway_Progress_seconds, TIMESTAMP_DIFF(Time_Completed, Time_Completed, DAY) AS new_date2
    FROM (
      SELECT
        *
      FROM (
        SELECT
          CAST(user_id AS float64) AS user_id_completed, CAST(completable_id AS float64) AS card_id, completed_at AS time_completed
        FROM
          {{ref('user_content_completions_dim_0_vw')}}
        WHERE
          user_id IS NOT NULL ) all_completed_cards
      RIGHT OUTER JOIN (
        SELECT
          User_ID AS user_id_total_completions, Pathway_ID, Total_Cards_Completed, Pathway_Title, Total_Pathway_Child_Cards, Pathway_Progress_seconds, 'Pathway' AS 
          Content_Structure
        FROM (
          SELECT
            *
          FROM {{ref('u3_users_pathway_progression_overview_part1_vw')}} total_pathway_child_card_completions
          LEFT OUTER JOIN (
            SELECT
              Pathway_ID AS Pathway_ID_1, Pathway_Title, COUNT(Card_ID) AS Total_Pathway_Child_Cards
            FROM (
              SELECT
                CAST(Pathway_ID AS float64) AS Pathway_ID, CAST(Card_ID AS float64) AS Card_ID, Pathway_Title
              FROM
                {{ref('card_pack_relation_dim_0_vw')}}
              WHERE
                Pathway_ID != Card_ID)
            GROUP BY
              1,
              2) total_pathway_child_cards
          ON
            total_pathway_child_card_completions.Pathway_ID = total_pathway_child_cards.Pathway_ID_1) ) content_structure_pathway
      ON
        all_completed_cards.card_id = content_structure_pathway.pathway_id
        AND all_completed_cards.user_id_completed = content_structure_pathway.user_id_total_completions ) )