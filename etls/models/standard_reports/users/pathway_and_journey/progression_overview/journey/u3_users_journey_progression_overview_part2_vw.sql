  -- u3_users_journey_progression_overview_part2_vw

-- total + completed
SELECT
journey_id, journey_title, journey_pathway_id, journey_pathway_title, user_id AS user_id_total_j_completions, Total_Cards_Completed, total_journey_pathway_child_cards, total_journey_cards, "Journey" AS content_structure
FROM (
-- join data 6
SELECT
    *
FROM (
    -- join data 8
    SELECT
    journey_id, journey_title, journey_pathway_id, journey_pathway_title, total_journey_pathway_child_cards, total_journey_cards
    FROM (
    -- total journey pathway child cards
    SELECT
        journey_id, journey_title, journey_pathway_id, journey_pathway_title, COUNT(card_id_jpathway_child_cards) AS total_journey_pathway_child_cards
    FROM (
        -- select columns 3
        SELECT
        journey_id, journey_title, pathway_id AS journey_pathway_id, pathway_title AS journey_pathway_title, card_id_jpathway_id, card_id AS card_id_jpathway_child_cards
        FROM (
        -- JOIN DATA 5
        SELECT
            *
        FROM (
            -- set column type
            SELECT
            CAST(journey_id AS float64) AS journey_id, CAST(card_id AS float64) AS card_id_jpathway_id, journey_title, org_id_s
            FROM (
            -- select columns 2
            SELECT
                journey_id, card_id, journey_title, org_id_s
            FROM
                {{ref('journey_pack_relations_0_vw')}}
            WHERE
            -- filter journey container cards
                journey_id != card_id)) journey_child_pathways_cards
        LEFT OUTER JOIN (
            SELECT
            CAST(Pathway_ID AS float64) AS pathway_id, CAST(Card_ID AS float64) AS card_id, pathway_title
            FROM
            {{ref('card_pack_relation_dim_0_vw')}}
            WHERE
            pathway_id != card_id) pathway_child_cards
        ON
            journey_child_pathways_cards.card_id_jpathway_id = pathway_child_cards.pathway_id))
    GROUP BY
        1,
        2,
        3,
        4 ) total_journey_pathway_child_cards_groupby
    LEFT OUTER JOIN (
    SELECT
        journey_id_1, COUNT(card_id_jpathway_child_cards) AS total_journey_cards
    FROM (
        SELECT
        journey_id AS journey_id_1, journey_title, pathway_id AS journey_pathway_id, pathway_title AS journey_pathway_title, card_id_jpathway_id, card_id AS card_id_jpathway_child_cards
        FROM (
        SELECT
            *
        FROM (
            SELECT
            CAST(journey_id AS float64) AS journey_id, CAST(card_id AS float64) AS card_id_jpathway_id, journey_title, org_id_s
            FROM (
            SELECT
                journey_id, card_id, journey_title, org_id_s
            FROM
                {{ref('journey_pack_relations_0_vw')}}
            WHERE
                journey_id != card_id)) journey_child_pathways_cards
        LEFT OUTER JOIN (
            SELECT
            CAST(Pathway_ID AS float64) AS pathway_id, CAST(Card_ID AS float64) AS card_id, pathway_title
            FROM
            {{ref('card_pack_relation_dim_0_vw')}}
            WHERE
            pathway_id != card_id) pathway_child_cards
        ON
            journey_child_pathways_cards.card_id_jpathway_id = pathway_child_cards.pathway_id))
    GROUP BY
        1) total_journey_cards_groupby
    ON
    total_journey_pathway_child_cards_groupby.journey_id = total_journey_cards_groupby.journey_id_1 ) select_columns_10
LEFT OUTER JOIN 
{{ref('u3_users_journey_progression_overview_part1_vw')}} total_pathway_child_card_completions
ON
    select_columns_10.journey_pathway_id = total_pathway_child_card_completions.pathway_id
WHERE
    user_id IS NOT NULL) 