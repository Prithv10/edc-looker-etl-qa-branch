-- 1603_Users [U][2] [Distinct Channel Content Views & Completions]
-- u2_users_distinct_channel_content_views_and_completions


WITH select_column_2 AS 
  (
  SELECT user_id, card_id, channel_id, time, performance_metric FROM 
  (
    SELECT user_id, card_id, time, performance_metric FROM
      {{ref('u1_users_completions_vw')}}) AS select_columns
  INNER JOIN 
  (
    SELECT DISTINCT card_id AS card_id_1, channel_id FROM
      {{ref('c2_content_structure_metadata_vw')}}
    WHERE
      channel_id IS NOT NULL
      AND card_id IS NOT NULL) AS remove_duplicates
  ON
    select_columns.card_id = remove_duplicates.card_id_1),
  
  channel_content_views AS
  (
  SELECT user_id, card_id, channel_id, time, performance_metric FROM 
  (
    SELECT user_id, card_id, time, performance_metric FROM
      {{ref('u1_users_total_unique_views_vw')}}) AS select_columns_1
  INNER JOIN 
  (
    SELECT DISTINCT card_id AS card_id_1, channel_id FROM
      {{ref('c2_content_structure_metadata_vw')}}
    WHERE
      channel_id IS NOT NULL
      AND card_id IS NOT NULL) AS remove_duplicates
  ON
    select_columns_1.card_id = remove_duplicates.card_id_1 )

SELECT * FROM select_column_2
UNION ALL
SELECT *FROM channel_content_views