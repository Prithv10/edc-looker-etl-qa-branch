

-- 1454_Glue_Users [U][0] [Non-Active Accounts]
-- u0_users_nonactive_accounts_vw

With latest_suspension_events_only as(
    SELECT time, suspended_user_id FROM(
    SELECT *, RANK() OVER(PARTITION BY CAST(suspended_user_id as int64) ORDER BY time DESC) as rankcol FROM(
    SELECT time, event, CAST(suspended_user_id as float64) as suspended_user_id FROM {{ref('u0_usercards_event_vw')}}
    WHERE event IN ('user_suspended','user_unsuspended'))
    qualify rankcol = 1 and event = 'user_suspended')
),
users_latest_content_event as(
    SELECT distinct user_id, time FROM(
    SELECT time, user_id, RANK() OVER(PARTITION BY CAST(user_id as int64) ORDER BY time DESC) as rankcol FROM(
    SELECT time, CAST(user_id as float64) as user_id, event, user_agent, is_system_generated FROM {{ref('u0_usercards_event_vw')}}
    WHERE event != 'card_created_virtual'
    and is_system_generated != '1'
    and user_agent NOT LIKE '%Branch Metrics API%'
    and event != 'card_assigned')
    qualify rankcol = 1)
),
sql_db_user_account_details as(
    SELECT CAST(id as float64)user_id, user_full_name, email, created_at as time_account_created, sign_in_count, User_Account_Status, excluded_from_leaderboard FROM {{ ref('m0_users_dim_vw') }}
),
event_db_user_suspension_times as(
    SELECT distinct * FROM(
    SELECT * FROM latest_suspension_events_only
    LEFT OUTER JOIN 
    (SELECT user_id, User_Account_Status FROM sql_db_user_account_details
    WHERE User_Account_Status = 'active') active_users_only
    ON latest_suspension_events_only.suspended_user_id = active_users_only.user_id)
    WHERE user_id IS NULL 
),
suspended_accounts_missing_suspension_time as(
    SELECT * FROM (SELECT user_id, User_Account_Status FROM sql_db_user_account_details
     WHERE User_Account_Status != 'active') non_active_users_only
    LEFT OUTER JOIN (SELECT time, suspended_user_id, user_id as user_id_1, User_Account_Status as User_Account_Status_1 FROM event_db_user_suspension_times) event_db_user_suspension_times_join
    ON non_active_users_only.user_id = event_db_user_suspension_times_join.suspended_user_id
    WHERE suspended_user_id IS NULL 
) ,
missed_suspended_users_no_activity as(
    SELECT user_id, time FROM suspended_accounts_missing_suspension_time
    LEFT OUTER JOIN (SELECT user_id as user_id_2, time as time_1 FROM users_latest_content_event) users_latest_content_event_join
    ON suspended_accounts_missing_suspension_time.user_id = users_latest_content_event_join.user_id_2
    WHERE user_id_1 IS NULL 
),
suspension_time_of_last_activity as(
    SELECT user_id, time_1 as time_account_suspended FROM
     suspended_accounts_missing_suspension_time
     INNER JOIN (SELECT user_id as user_id_2, time as time_1 FROM users_latest_content_event) users_latest_content_event_join_1
     ON suspended_accounts_missing_suspension_time.user_id = users_latest_content_event_join_1.user_id_2
),
suspended_users_time_account_created as(
    SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status,
    excluded_from_leaderboard, time_account_created as time_account_suspended  FROM (
    SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status,
    excluded_from_leaderboard, CAST(current_date() as timestamp)time_account_suspended FROM missed_suspended_users_no_activity
    INNER JOIN (SELECT user_id as user_id_1, time_account_created, User_Account_Status, user_full_name, 
    email, sign_in_count, excluded_from_leaderboard FROM sql_db_user_account_details) time_accounts_created_join
    ON missed_suspended_users_no_activity.user_id = time_accounts_created_join.user_id_1)
),

fixed_suspended_users_last_activity as(
    SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status, excluded_from_leaderboard, time_account_suspended
    FROM suspension_time_of_last_activity
    INNER JOIN 
    (SELECT user_id as user_id_1, time_account_created, User_Account_Status, user_full_name, 
    email, sign_in_count, excluded_from_leaderboard FROM sql_db_user_account_details) time_accounts_created_join_1
    ON suspension_time_of_last_activity.user_id = time_accounts_created_join_1.user_id_1
),

fixed_suspended_users_time_account_created as(
    SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status, excluded_from_leaderboard, time_account_suspended FROM (
    SELECT * FROM suspended_users_time_account_created
    LEFT OUTER JOIN (SELECT user_id as user_id_1, user_full_name as user_full_name_1, email as email_1, time_account_created as time_account_created_1, sign_in_count as sign_in_count_1, User_Account_Status as User_Account_Status_1, 
    excluded_from_leaderboard as excluded_from_leaderboard_1, time_account_suspended as time_account_suspended_1 FROM fixed_suspended_users_last_activity) fixed_suspended_users_last_activity_join
    ON suspended_users_time_account_created.user_id = fixed_suspended_users_last_activity_join.user_id_1
    WHERE user_id_1 IS NULL )
),

all_users_suspension_times_when_tracked as(
    SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status, excluded_from_leaderboard, 
    time as time_account_suspended FROM sql_db_user_account_details
    LEFT OUTER JOIN (SELECT time, suspended_user_id, user_id as user_id_1, User_Account_Status as User_Account_Status_1 FROM event_db_user_suspension_times) event_db_user_suspension_times_join_1
    ON sql_db_user_account_details.user_id = event_db_user_suspension_times_join_1.suspended_user_id

),
all_users_fixed_suspended_users_l1 as(
    SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status, excluded_from_leaderboard, 
    time_account_suspended FROM (
    SELECT * FROM all_users_suspension_times_when_tracked
    LEFT OUTER JOIN (SELECT user_id as user_id_1, user_full_name as user_full_name_1, email as email_1, time_account_created as time_account_created_1, sign_in_count as sign_in_count_1, User_Account_Status as User_Account_Status_1, excluded_from_leaderboard as excluded_from_leaderboard_1, time_account_suspended as time_account_suspended_1
    FROM fixed_suspended_users_time_account_created) fixed_suspended_users_time_account_created_join
    ON all_users_suspension_times_when_tracked.user_id = fixed_suspended_users_time_account_created_join.user_id_1
    WHERE user_id_1 IS NULL 
    )
),

all_users_fixed_suspended_users_l2 as(
    SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status, excluded_from_leaderboard, time_account_suspended
    FROM(
    SELECT * FROM all_users_fixed_suspended_users_l1
    LEFT OUTER JOIN 
    (SELECT user_id as user_id_1, user_full_name as user_full_name_1, email as email_1, time_account_created as time_account_created_1, sign_in_count as sign_in_count_1, User_Account_Status as User_Account_Status_1, excluded_from_leaderboard as excluded_from_leaderboard_1, time_account_suspended as time_account_suspended_1
    FROM fixed_suspended_users_last_activity) fixed_suspended_users_last_activity_join_1
    ON all_users_fixed_suspended_users_l1.user_id = fixed_suspended_users_last_activity_join_1.user_id_1
    WHERE user_id_1 IS NULL)
)

SELECT DISTINCT user_id, time_account_suspended FROM(
SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status, excluded_from_leaderboard, time_account_suspended
FROM all_users_fixed_suspended_users_l2
UNION ALL 
SELECT user_id, user_full_name, email, time_account_created, sign_in_count, User_Account_Status, excluded_from_leaderboard, time_account_suspended 
FROM fixed_suspended_users_time_account_created)
WHERE time_account_suspended IS NOT NULL 
