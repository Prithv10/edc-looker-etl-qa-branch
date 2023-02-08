-- 1454_Glue_Users [U][3] [Overall Onboarding Status]
-- u3_overall_onboarding_status_part4_final_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'Time_Account_Created', 'data_type': 'timestamp','granularity': 'year'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["overall_onboarding_status"],
    tags=['incremental']
  )
}}


SELECT *,  CAST(first_day_of_active_engagement as timestamp) as parsed_first_day_of_active_engagement, CAST(latest_day_of_active_engagement as timestamp) AS parsed_latest_day_of_active_engagement, "4: Signed-In, Multiple Days of Active Engagement" AS overall_onboarding_status FROM {{ref('u3_overall_onboarding_status_part3_vw')}} WHERE total_days_of_active_engagement>1
UNION ALL
SELECT *,  CAST(first_day_of_active_engagement as timestamp) as parsed_first_day_of_active_engagement, CAST(latest_day_of_active_engagement as timestamp) AS parsed_latest_day_of_active_engagement, "3: Signed-In, 1 Day of Active Engagement" AS overall_onboarding_status  FROM {{ref('u3_overall_onboarding_status_part3_vw')}} WHERE total_days_of_active_engagement=1
UNION ALL
SELECT *,  CAST(first_day_of_active_engagement as timestamp) as parsed_first_day_of_active_engagement, CAST(latest_day_of_active_engagement as timestamp) AS parsed_latest_day_of_active_engagement, "2: Signed-In, No Days of Active Engagement" AS overall_onboarding_status  FROM {{ref('u3_overall_onboarding_status_part3_vw')}} WHERE total_days_of_active_engagement=0 and time_of_first_session IS NOT NULL 
UNION ALL
SELECT *,  CAST(first_day_of_active_engagement as timestamp) as parsed_first_day_of_active_engagement, CAST(latest_day_of_active_engagement as timestamp) AS parsed_latest_day_of_active_engagement, "1: Never Signed-In, No Days of Active Engagement" AS overall_onboarding_status  FROM {{ref('u3_overall_onboarding_status_part3_vw')}} WHERE total_days_of_active_engagement=0
AND time_of_first_session IS NULL
