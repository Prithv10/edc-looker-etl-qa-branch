-- 1454_Glue_Users [U][2] [Pathway & Journey Progression Data Explorer]
-- u2_users_pathway_and_journey_progression_data_explorer_part_1_vw

WITH all_pathway_child_cards as(
    SELECT CAST(pathway_id AS float64) AS pathway_id, CAST(card_id AS float64) AS
        card_id, card_type, pathway_title, card_title FROM
    {{ ref('card_pack_relation_dim_0_vw') }}
    WHERE
        pathway_id != card_id
),

content_structure_journey as(
SELECT pathway_id AS journey_pathway_id, card_id_1 AS card_id, card_type_1 AS
       card_type, pathway_title AS journey_pathway_title, journey_id, journey_title,
       card_title_1 AS card_title, pathway_id, pathway_title, "Journey" AS
       content_structure FROM (
SELECT CAST(journey_id AS float64) AS journey_id, CAST(card_id AS float64) AS
        card_id, card_type, journey_title, card_title FROM
{{ ref('journey_pack_relations_0_vw') }}
WHERE
    journey_id != card_id) all_journey_child_pathway
LEFT OUTER JOIN 
(SELECT CAST(pathway_id AS float64) AS pathway_id, CAST(card_id AS float64) AS
        card_id_1, card_type AS card_type_1, pathway_title, card_title AS
        card_title_1 
        FROM all_pathway_child_cards ) all_pathway_child_cards_1

ON all_journey_child_pathway.card_id = all_pathway_child_cards_1.pathway_id),

journey_content_pathway_content as(
SELECT journey_pathway_id, card_id, card_type, journey_pathway_title, journey_id, 
       journey_title, card_title, pathway_id, pathway_title, content_structure
       FROM content_structure_journey
UNION ALL 
SELECT NULL AS journey_pathway_id, card_id, card_type,
        NULL AS journey_pathway_title, NULL AS journey_id, NULL AS journey_title,
        card_title, pathway_id, pathway_title, "pathway"
        AS content_structure FROM all_pathway_child_cards),

select_columns_2 as(
    SELECT journey_id, journey_title, journey_pathway_id, journey_pathway_title, card_id,
            card_title, card_type, User_ID, Time_Completed, pathway_id, pathway_title,
            content_structure
    FROM journey_content_pathway_content
    LEFT OUTER JOIN 
    (SELECT CAST(user_id AS float64) AS User_ID, CAST(completable_id AS float64)AS Card_ID_1,
            completed_at AS Time_Completed
    FROM
        {{ ref('user_content_completions_dim_0_vw') }}) all_completed_cards
    ON journey_content_pathway_content.card_id = all_completed_cards.card_id_1
),
select_columns_9 as(
SELECT CAST(badgeable_card_id AS float64) AS badgeable_card_id, badge_title FROM
        {{ ref('badgings_dim_0_vw') }}
),

join_data_9 as(
    SELECT pathway_id, pathway_title, card_id, card_title, card_type, User_ID, Time_Completed,
            journey_id, journey_title, journey_pathway_id, journey_pathway_title, badge_title AS
            pathway_badge_title, content_structure FROM select_columns_2
    LEFT OUTER JOIN 
        select_columns_9
    ON select_columns_2.pathway_id = select_columns_9.badgeable_card_id
),

join_data_8 as(
    SELECT pathway_id, pathway_title, pathway_badge_title, card_id, card_title, card_type, User_ID,
            Time_Completed, content_structure, journey_id, journey_title, badge_title AS journey_badge_title,
            journey_pathway_id, journey_pathway_title FROM join_data_9
    LEFT OUTER JOIN select_columns_9
    ON join_data_9.journey_id = select_columns_9.badgeable_card_id
),

join_data_10 as(
    SELECT pathway_id, pathway_title, pathway_badge_title, card_id, card_title, card_type, User_ID, Time_Completed,
           content_structure, journey_id, journey_title, journey_badge_title, journey_pathway_id,
           journey_pathway_title, badge_title AS journey_pathway_badge_title FROM join_data_8
    LEFT OUTER JOIN  select_columns_9
    ON join_data_8.journey_pathway_id = select_columns_9.badgeable_card_id
)
SELECT * FROM join_data_10


