-- c3_custom_channel_overview_report_part1_vw
-- Custom [C][3] [Channel Overview Report]

WITH first_visit_channel_registration_date as(
SELECT user_id as channel_visitor_id, channel_id, time as channel_registration_date, channel_name 
FROM(
SELECT user_id, channel_id, time, performance_metric, channel_name FROM {{ref('ch2_channel_performance_part2_final_results_vw')}}
WHERE performance_metric = 'Total Distinct User Visits')),

channel_followers_table as(
    SELECT user_id as channel_follower_id, channel_id, channel_name FROM(
    SELECT user_id, channel_id, time, performance_metric, channel_name FROM {{ref('ch2_channel_performance_part2_final_results_vw')}}
    WHERE performance_metric = 'Current Followers') 
),

Not_following_visited_channel as(
    SELECT channel_visitor_id as user_id, channel_id, channel_registration_date, channel_name, 'Not Following - Visited' as user_channel_status 
    FROM(
    SELECT * FROM first_visit_channel_registration_date
    LEFT OUTER JOIN 
    (SELECT channel_follower_id, channel_id as channel_id_1, channel_name as channel_name_1 FROM channel_followers_table) channel_followers_table_join
    ON first_visit_channel_registration_date.channel_id = channel_followers_table_join.channel_id_1
    WHERE channel_id_1 IS NULL)
),

following_visited_channel as (
    SELECT channel_visitor_id as user_id, channel_id, channel_registration_date, channel_name, 'Following - Visited' as user_channel_status
    FROM first_visit_channel_registration_date
    INNER JOIN 
    (SELECT channel_follower_id, channel_id as channel_id_1, channel_name as channel_name_1 FROM channel_followers_table) channel_followers_table_join_1
    ON first_visit_channel_registration_date.channel_visitor_id = channel_followers_table_join_1.channel_follower_id
    AND first_visit_channel_registration_date.channel_id = channel_followers_table_join_1.channel_id_1
),

following_not_visited as (
    SELECT channel_follower_id as user_id, channel_id, channel_registration_date, channel_name, 'Following - Not Visited' as user_channel_status FROM(
    SELECT * FROM channel_followers_table
    LEFT OUTER JOIN 
    (SELECT channel_visitor_id, channel_id as channel_id_1, channel_registration_date, channel_name as channel_name_1 FROM first_visit_channel_registration_date) first_visit_channel_registration_date_join
    ON channel_followers_table.channel_follower_id = first_visit_channel_registration_date_join.channel_visitor_id
    and channel_followers_table.channel_id = first_visit_channel_registration_date_join.channel_id_1
    WHERE channel_id_1 IS NULL) 
),

append_rows as(
SELECT user_id, channel_id, channel_registration_date, channel_name, user_channel_status FROM Not_following_visited_channel
UNION ALL 
SELECT user_id, channel_id, channel_registration_date, channel_name, user_channel_status FROM following_visited_channel
UNION ALL 
SELECT user_id, channel_id, channel_registration_date, channel_name, user_channel_status FROM following_not_visited),

join_data_3 as(
SELECT user_id, channel_id, channel_registration_date, total_channel_content, channel_name, user_channel_status FROM append_rows
LEFT OUTER JOIN 
(SELECT CAST(channel_id as int64) channel_id_1, total_channel_content FROM {{ref('ch0_channels_distinct_content_totals_vw')}}) ch0_channels_distinct_content_totals_join
ON append_rows.channel_id = ch0_channels_distinct_content_totals_join.channel_id_1),

join_data_5 as(
    SELECT user_id, channel_id, channel_registration_date, total_channel_content, total_user_channel_completions, channel_name, user_channel_status
    FROM {{ref('u0_users_distinct_channel_content_completion_totals_vw')}} u0_users_distinct_channel_content_completion_totals_join
    LEFT OUTER JOIN 
    (SELECT user_id as user_id_1, channel_id as channel_id_1, channel_registration_date, total_channel_content, channel_name, user_channel_status FROM join_data_3) join_data_3_1
    ON u0_users_distinct_channel_content_completion_totals_join.user_id = join_data_3_1.user_id_1
    and u0_users_distinct_channel_content_completion_totals_join.channel_id = join_data_3_1.channel_id_1
)
SELECT user_id, channel_id, channel_registration_date, total_channel_content, channel_name, user_channel_status, 
CASE WHEN total_user_channel_completions IS NULL then 0 ELSE total_user_channel_completions END as total_channel_completions,
(total_user_channel_completions/total_channel_content) as channel_completion_percentage, 'Channel' as training_type
FROM join_data_5


