-- 1454_Glue_Users [U][2] [Pathway & Journey Progression Data Explorer]
-- u2_users_pathway_and_journey_progression_data_explorer_part_2_vw

With badge_content_true_false as(
SELECT *, 'False' AS badge_content FROM
    {{ ref('u2_users_pathway_and_journey_progression_data_explorer_part_1_vw') }}
WHERE
    pathway_badge_title IS NULL
    AND journey_badge_title IS NULL
    AND journey_pathway_badge_title IS NULL
UNION ALL 

SELECT *, 'True' AS badge_content FROM
    {{ ref('u2_users_pathway_and_journey_progression_data_explorer_part_1_vw') }}
WHERE
    pathway_badge_title IS NOT NULL
    OR journey_badge_title IS NOT NULL
    OR journey_pathway_badge_title IS NOT NULL),
----
journey_content_true_false as(
    SELECT *, 'False' as journey_content FROM badge_content_true_false
    WHERE journey_id IS NULL 
    UNION ALL 
     SELECT *, 'True' as journey_content FROM badge_content_true_false
    WHERE journey_id IS NOT NULL 
),
----
pathway_content_true_false as(
    SELECT *, 'False' as pathway_content FROM journey_content_true_false
    WHERE pathway_id IS NULL 
    UNION ALL 
    SELECT *, 'True' as pathway_content FROM journey_content_true_false
    WHERE pathway_id IS NOT NULL 
),
----
jpathway_content_true_false as(
    SELECT *, 'False' as journey_pathway_content FROM pathway_content_true_false
    WHERE journey_pathway_id IS NULL
    UNION ALL 
        SELECT *, 'True' as journey_pathway_content FROM pathway_content_true_false
    WHERE journey_pathway_id IS NOT NULL  
)
----

SELECT content_structure, journey_id, journey_title, journey_badge_title, journey_pathway_id, journey_pathway_title,
journey_pathway_badge_title, pathway_id, pathway_title, pathway_badge_title, card_id, 
card_title, card_type, user_id, Time_Completed, User_Full_Name, email, badge_content, journey_content, 
pathway_content, journey_pathway_content, Excluded_From_Leaderboard, User_Account_Status, external_id FROM (
SELECT CAST(user_id AS float64) AS User_id, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email,
         Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id FROM
    {{ ref('u1_users_latest_metadata_vw') }}) set_column_type_1
RIGHT OUTER JOIN 
(SELECT pathway_id, pathway_title, pathway_badge_title, card_id, card_title, card_type, User_ID as user_id_1, Time_Completed, content_structure, journey_id, journey_title, journey_badge_title, journey_pathway_id, journey_pathway_title, journey_pathway_badge_title, badge_content, journey_content, pathway_content, journey_pathway_content
 FROM jpathway_content_true_false) jpathway_content_true_false_1
ON set_column_type_1.user_id = jpathway_content_true_false_1.user_id_1
