-- User hours 21-22
-- user_hours_21_22_vw
-- division name - user_custom_field
SELECT
  *,
  CASE WHEN total_duration > 20 THEN 'True'
  ELSE 'False' END AS hours,
  CASE WHEN total_duration > 20 THEN '20+'
       WHEN total_duration BETWEEN 10 AND 20 THEN '10-20'
       WHEN total_duration BETWEEN 5 AND 10 THEN '5-10'
       WHEN total_duration BETWEEN 0 AND 5 THEN '0-5'
  ELSE 'ERROR' END AS clc_bracket
FROM (
  SELECT
    *, total_seconds/3600 AS total_duration
  FROM (
    SELECT user_full_name, SUM(duration_seconds) AS total_seconds, MAX(user_account_status) AS account_status
    FROM (
      SELECT user_full_name, duration_seconds, event, time, user_account_status
      FROM (
        SELECT
          *
        FROM
          {{ref('u2_users_performance_part5_final_results_vw')}}
        WHERE
          event LIKE '%card_marked_as_complete%'
          AND time >= '2022-01-07T00:00:00+00:00'))
    GROUP BY
      user_full_name))
