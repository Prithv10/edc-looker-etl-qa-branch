-- Users [U][2] [Skills & Learning Goals]
-- u2_users_skills_learninggoals_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	  partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp'},
    tags=['incremental']
  )
}}

With remove_duplicates_2 as(
SELECT Distinct topic_label, topic_id FROM(
SELECT CAST(user_id as float64) as user_id, event, topic_id, topic_label, topic_name,time, RANK() OVER (PARTITION BY topic_id ORDER BY TIME DESC) AS rankcol FROM {{ref('u0_usercards_event_vw')}}
qualify rankcol = 1 and topic_label IS NOT NULL)),
---
learning_goals as(
SELECT DISTINCT time, user_id, event, topic_label, topic_id, 'Learning Goals' as topic_type FROM(
SELECT *, RANK() OVER (PARTITION BY CAST(user_id as int64), topic_id ORDER BY TIME DESC) AS rankcol FROM (
SELECT CAST(user_id as float64) as user_id, event, topic_id, topic_label, topic_name,time FROM {{ref('u0_usercards_event_vw')}}
WHERE (topic_id IS NOT NULL 
or topic_id != '')
AND event IN ('user_interest_topic_added',
            'user_interest_topic_removed'))
qualify rankcol = 1 and event = 'user_interest_topic_added')),

skills1 as(
    SELECT Distinct time, user_id, event, topic_label, topic_id, 'Skills' as topic_type
    FROM(
    SELECT *, RANK() OVER (PARTITION BY CAST(user_id as int64), topic_id ORDER BY TIME DESC) AS rankcol FROM (
    SELECT CAST(user_id as float64) as user_id, event, topic_id, topic_label, topic_name, time FROM {{ref('u0_usercards_event_vw')}}
    WHERE (topic_id IS NOT NULL 
    or topic_id != '')
    AND event IN ('user_expertise_topic_added',
            'user_expertise_topic_removed'))
    qualify rankcol = 1 and event = 'user_expertise_topic_added')
),

append_rows_1 as(
    SELECT Distinct user_id, created_at as time, id as topic_id, 
    skill_name as topic_label, 'Skills' as topic_type FROM {{ref('u0_users_skills_vw')}}
),

append_rows as(
SELECT DISTINCT user_id, topic_id, time, topic_label, event, 'Skills' as topic_type FROM (
SELECT user_id, time, topic_label, CAST(topic_id as string) as topic_id, null as event  FROM append_rows_1
UNION ALL 
SELECT user_id, time,  topic_label, topic_id, event from skills1)
UNION ALL 
SELECT user_id, topic_id, time,  topic_label, event, 'Learning Goals' as topic_type FROM learning_goals)


SELECT user_id, user_full_name, email, Time_Account_Created, User_Account_Status, time, event, topic_type, topic_label, Excluded_From_Leaderboard,
external_id, sign_in_count, Time_Account_Suspended, topic_id, topic_label_1, current_timestamp() as etl_record_created_time FROM
(SELECT user_id, User_Full_Name,User_Account_Status,Excluded_From_Leaderboard,email,Time_Account_Created,sign_in_count,Time_Account_Suspended,external_id 
FROM {{ref('u1_users_latest_metadata_vw')}}) u1_latest 
LEFT OUTER JOIN(
SELECT time, user_id as user_id_1, event, topic_id, topic_type, topic_label_1, topic_label FROM append_rows 
LEFT OUTER JOIN 
(SELECT topic_label as topic_label_1, topic_id as topic_id_1 FROM remove_duplicates_2) rm2
ON append_rows.topic_id = rm2.topic_id_1) select_columns_4
ON u1_latest.user_id = select_columns_4.user_id_1

