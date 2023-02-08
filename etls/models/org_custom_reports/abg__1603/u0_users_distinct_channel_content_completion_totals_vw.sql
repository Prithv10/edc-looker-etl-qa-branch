-- Users [U][0] [Distinct Channel Content Completion Totals]
-- u0_users_distinct_channel_content_completion_totals

SELECT user_id, channel_id, COUNT(card_id) AS total_user_channel_completions
FROM (
  SELECT user_id, card_id, channel_id
  FROM (
    SELECT user_id,card_id
    FROM
      {{ref('u1_users_completions_vw')}}) AS select_column_5
  INNER JOIN (
    SELECT DISTINCT card_id AS card_id_1,channel_id
    FROM
      {{ref('c2_content_structure_metadata_vw')}}
    WHERE
      channel_id IS NOT NULL
      AND card_id IS NOT NULL) AS remove_duplicates
  ON
    select_column_5.card_id = remove_duplicates.card_id_1)
GROUP BY user_id,channel_id
