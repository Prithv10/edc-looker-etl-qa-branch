-- 1454_Glue_Groups [G][3] [Overall Onboarding Status] (Output of 1454_Glue_Users [U][3] [Overall Onboarding Status])
-- g3_groups_overall_onboarding_status_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'Time_Account_Created', 'data_type': 'timestamp','granularity': 'year'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["overall_onboarding_status"],
    tags=['incremental']
  )
}}

with g3_overall_onboarding AS ( 
        SELECT * FROM
        (
            SELECT * FROM {{ref('u3_overall_onboarding_status_part4_final_vw')}}
        ) a21
        JOIN
        (
            SELECT user_id as user_id_1,Group_ID,Group_Name,Group_Status,Group_User_Role FROM {{ref('g2_groups_users_vw')}}
        ) a22
        ON 
        a21.user_id = a22.user_id_1
)


SELECT  user_id, User_Full_Name, email, Time_Account_Created, sign_in_count, User_Account_Status, 
        Excluded_From_Leaderboard, latest_day_of_active_engagement, total_days_of_active_engagement, 
        first_day_of_active_engagement, overall_onboarding_status, Group_ID, Group_Name, Group_Status, external_id, 
        CAST(first_day_of_active_engagement as timestamp) as parsed_first_day_of_active_engagement, 
        CAST(latest_day_of_active_engagement as timestamp) AS parsed_latest_day_of_active_engagement,
FROM g3_overall_onboarding