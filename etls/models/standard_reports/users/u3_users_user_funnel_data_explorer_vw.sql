-- 1454_Glue_Users [U][3][User Funnel Data Explorer]
-- u3_users_user_funnel_data_explorer_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    cluster_by = ["metrics"],
    tags=['incremental']
  )
}}

WITH
  select_columns2 AS(
  SELECT
    card_id, event, user_id, platform, email, user_account_status, user_full_name, badge_id, 
    badge_type, badge_title, referer
  FROM
    {{ref('u2_users_performance_part5_final_results_vw')}})

  -- AppendRows_1
SELECT user_id, metrics, email, user_account_status, user_full_name,current_timestamp() AS etl_record_created_time FROM (
SELECT
  DISTINCT user_id, metrics, email, user_account_status, user_full_name
FROM (
  SELECT
    *,
    '4.Users with Completions' AS metrics
  FROM (
    SELECT
      *,
      CASE
        WHEN (Platform LIKE 'EDC%' OR Platform LIKE 'LRS%' OR Platform LIKE 'LXP-S%') OR (Platform = 'web' AND (Referer IS NULL OR Referer = '')) THEN 'External'
      ELSE
      Platform
    END
      AS platform_external
    FROM
      select_columns2
    WHERE
      event = "card_marked_as_complete")
  WHERE
    platform_external != 'External')
UNION ALL
SELECT
  DISTINCT user_id, metrics, email, user_account_status, user_full_name
FROM (
  SELECT
    *,
    '6.Employer Advocacy (Badge/Certification Shared)' AS metrics
  FROM
    select_columns2
  WHERE
    event = 'user_badge_shared_on_social'
    AND badge_type = 'CardBadging')
UNION ALL
SELECT
  DISTINCT user_id, metrics, email, user_account_status, user_full_name
FROM (
  SELECT
    *,
    '5.Badge/Certificate Earners' AS metrics
  FROM
    select_columns2
  WHERE
    event = 'user_badge_completed'
    AND badge_type = 'CardBadging')
UNION ALL
SELECT
  user_id, metrics, email, user_account_status, user_full_name
FROM (
  SELECT
    *,
    '1.Users Invited' AS metrics
  FROM
    {{ref('u3_overall_onboarding_status_part4_final_vw')}})
UNION ALL
SELECT
  user_id, metrics, email, user_account_status, user_full_name
FROM (
  SELECT
    *,
    '2.Users On-boarded' AS metrics
  FROM
    {{ref('u3_overall_onboarding_status_part4_final_vw')}}
  WHERE
    overall_onboarding_status = '2: Signed-In, No Days of Active Engagement'
    OR overall_onboarding_status = '3: Signed-In, 1 Day of Active Engagement'
    OR overall_onboarding_status = '4: Signed-In, Multiple Days of Active Engagement')
UNION ALL
SELECT
  user_id, metrics, email, user_account_status, user_full_name
FROM (
  SELECT
    *,
    '3.Active users' AS metrics
  FROM
    {{ref('u3_overall_onboarding_status_part4_final_vw')}}
  WHERE
    overall_onboarding_status = '3: Signed-In, 1 Day of Active Engagement'
    OR overall_onboarding_status = '4: Signed-In, Multiple Days of Active Engagement')
)