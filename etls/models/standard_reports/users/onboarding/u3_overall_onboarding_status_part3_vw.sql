-- 1454_Glue_Users [U][3] [Overall Onboarding Status]
-- u3_overall_onboarding_status_part3_vw
-- JOIN DATA 3
{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'p_year', 'data_type': 'timestamp'},
    cluster_by = ["User_Account_Status"],
    tags=['incremental']
  )
}}

with join_data3 AS (
    SELECT * FROM
    (
        SELECT * FROM {{ref('u1_users_latest_metadata_vw')}}
    ) a41
    LEFT JOIN
    (
        SELECT user_id as user_id_4,latest_day_of_active_engagement,total_days_of_active_engagement,first_day_of_active_engagement
        FROM {{ref('u3_overall_onboarding_status_part2_vw')}}
    ) a42
    ON 
    a41.user_id = a42.user_id_4
),

join_data6 AS (
    SELECT * FROM
    (
        SELECT * FROM join_data3
    ) a61
    LEFT JOIN
    (
        SELECT `Time`, Event, CAST(User_ID AS INT64) AS user_id_5 FROM {{ref('u1_users_first_session_vw')}}
    ) a62
    ON 
    a61.user_id = a62.user_id_5
),

join_data7 AS (
    SELECT * FROM
    (
        SELECT * EXCEPT(user_id_5) FROM join_data6
    ) a71
    LEFT JOIN
    (
        SELECT `Time` as Time_1, Event as Event_1, CAST(User_ID AS INT64) AS user_id_6 FROM {{ref('u1_users_last_session_vw')}}
    ) a72
    ON 
    a71.user_id = a72.user_id_6
),

join_data8 AS (
    SELECT *,(CASE WHEN (total_sessions_tmp IS NULL) THEN 0  ELSE total_sessions_tmp END) AS total_sessions  FROM (
        SELECT * FROM
        (
            SELECT * EXCEPT(user_id_6) FROM join_data7
        ) a81
        LEFT JOIN
        (
            SELECT CAST(User_ID AS INT64) AS user_id_7,count(Event) AS total_sessions_tmp FROM {{ref('u1_users_total_sessions_vw')}} GROUP BY User_ID
        ) a82
        ON 
        a81.user_id = a82.user_id_7
    )
)

SELECT  user_id,User_Full_Name,email,Time_Account_Created,sign_in_count,User_Account_Status,Excluded_From_Leaderboard,
        latest_day_of_active_engagement,total_days_of_active_engagement,first_day_of_active_engagement,
        Time as time_of_first_session,Time_1 as time_of_last_session,total_sessions,external_id,
        timestamp_trunc(Time_Account_Created, year) as p_year,current_timestamp() AS etl_record_created_time

         FROM (
    SELECT * EXCEPT(user_id_4,user_id_7,total_sessions_tmp,Event_1)  FROM join_data8
) join_data8_select