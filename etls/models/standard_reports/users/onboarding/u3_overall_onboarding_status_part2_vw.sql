-- 1454_Glue_Users [U][3] [Overall Onboarding Status]
-- u3_overall_onboarding_status_part2_vw

WITH total_days_of_active_account AS (
    SELECT u1_lat_vw.*,active_users_q.* FROM
        (
            SELECT user_id,User_Full_Name,email,Time_Account_Created,sign_in_count,
                User_Account_Status,Excluded_From_Leaderboard
            FROM {{ref('u1_users_latest_metadata_vw')}}
        ) u1_lat_vw
        LEFT JOIN
        (
            SELECT user_id as user_id_1,mdy FROM {{ref('u3_overall_onboarding_status_part1_vw')}} 
        ) AS active_users_q
        ON
        u1_lat_vw.user_id = active_users_q.user_id_1
)

-- Join2 Data

SELECT user_id,latest_day_of_active_engagement,total_days_of_active_engagement,first_day_of_active_engagement FROM
(
    SELECT user_id,latest_day_of_active_engagement,total_days_of_active_engagement FROM
    (
        -- 2.1 Latest day of active engagement
        SELECT distinct user_id, mdy AS latest_day_of_active_engagement
            FROM (
                SELECT  *,RANK() OVER (PARTITION BY CAST(user_id as int64) ORDER BY mdy DESC) AS rankcol FROM total_days_of_active_account  
                qualify rankcol=1
            )
    ) a21
    LEFT JOIN 
        -- 2.2 total_days_of_active_engagement
    (
        SELECT user_id as user_id_1,count(mdy) as total_days_of_active_engagement FROM total_days_of_active_account  
        GROUP BY user_id 
    ) a22
    ON
    a21.user_id = a22.user_id_1
) a2
LEFT JOIN 
(
    -- 3. First day of active engagement
    SELECT Distinct user_id as user_id_2,mdy AS first_day_of_active_engagement
        FROM (
            SELECT  *,RANK() OVER (PARTITION BY CAST(user_id as int64) ORDER BY mdy ASC) AS rankcol FROM total_days_of_active_account  
            qualify rankcol=1
        )
) a3
ON
a2.user_id = a3.user_id_2