-- u1_users_total_views
-- 1603_Users [U][1] [Total Views]

SELECT event, CAST(card_id AS float64) AS card_id, attributes, platform, user_agent, time, CAST(user_id AS float64) AS user_id, performance_metric
FROM (
  SELECT *, 'Total Views' AS performance_metric
  FROM (
    SELECT event, card_id, attributes, platform, user_agent, time, user_id
    FROM
      {{ref('u0_usercards_event_vw')}}
    WHERE
      card_id IS NOT NULL
      AND user_id IS NOT NULL
      AND event = 'card_viewed')
  WHERE
    attributes IS NULL
    OR attributes IN ("standalone"))
