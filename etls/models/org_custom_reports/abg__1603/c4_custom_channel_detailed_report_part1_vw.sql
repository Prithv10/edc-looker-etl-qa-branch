  -- Custom [C][4] [Channel Detailed Report]
  -- c4_custom_channel_detailed_report_part1_vw
WITH user_first_views AS (
  SELECT card_id, channel_id, user_id, time AS training_record_registration_date, performance_metric
  FROM
    {{ref('u2_users_distinct_channel_content_views_and_completions_vw')}}
  WHERE
    performance_metric = 'Total Unique Card Views'),
  user_completions AS(
  SELECT card_id, channel_id, user_id, time AS training_record_completion_date, performance_metric
  FROM
    {{ref('u2_users_distinct_channel_content_views_and_completions_vw')}}
  WHERE
    performance_metric = 'Total Completions' ),

  completions_join AS(
  SELECT card_id, channel_id, user_id, training_record_completion_date, training_record_registration_date, performance_metric
  FROM (
    SELECT card_id, channel_id, user_id, training_record_registration_date, performance_metric
    FROM
      user_first_views) AS ufv
  LEFT OUTER JOIN (
    SELECT card_id AS card_id_1, channel_id AS channel_id_1, user_id AS user_id_1, training_record_completion_date, performance_metric AS performance_metric_1
    FROM
      user_completions) AS uc
  ON
    ufv.card_id = uc.card_id_1
    AND ufv.user_id = uc.user_id_1
  WHERE
    card_id_1 IS NULL ),

  view_time_join AS(
  SELECT card_id, channel_id, user_id, training_record_completion_date, training_record_registration_date, performance_metric
  FROM (
    SELECT card_id, channel_id, user_id, training_record_completion_date, performance_metric
    FROM
      user_completions) AS uc
  LEFT OUTER JOIN (
    SELECT card_id AS card_id_1, channel_id AS channel_id_1, user_id AS user_id_1, training_record_registration_date, performance_metric AS performance_metric_1
    FROM
      user_first_views) AS ufv
  ON
    uc.user_id = ufv.user_id_1
    AND uc.card_id = ufv.card_id_1 ),

  append_rows AS(
  SELECT card_id, channel_id, user_id, training_record_registration_date, performance_metric, training_record_completion_date, 'Started' AS training_record_status
  FROM
    completions_join
  UNION ALL
  SELECT card_id, channel_id, user_id, training_record_registration_date, performance_metric, training_record_completion_date, 'Completed' AS training_record_status
  FROM
    view_time_join )

  -- remove_duplicates_3
SELECT DISTINCT * FROM append_rows
