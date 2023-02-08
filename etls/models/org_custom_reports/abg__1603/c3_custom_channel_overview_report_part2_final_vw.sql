-- c3_custom_channel_overview_report_part2_final_vw
-- Custom [C][3] [Channel Overview Report]

WITH join_data_6 as(
SELECT * FROM {{ref('c3_custom_channel_overview_report_part1_vw')}} select_columns_7
LEFT OUTER JOIN 
(SELECT 
user_id as user_id_1, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id 
FROM {{ref('u1_users_latest_metadata_vw')}}) u1_latest 
ON select_columns_7.user_id = u1_latest.user_id_1),

join_data_7 as(
SELECT * FROM join_data_6
LEFT OUTER JOIN (SELECT channel_id as channel_id_1, overall_channel_duration_seconds, overall_channel_duration_hh_mm, FROM {{ref('ch1_channels_overall_channel_duration_formatted_part2_final_vw')}}) ch1_channel
ON join_data_6.channel_id = ch1_channel.channel_id_1)

SELECT user_id, channel_id, channel_registration_date, total_channel_content, channel_name, user_channel_status, total_channel_completions, channel_completion_percentage, training_type, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id, overall_channel_duration_seconds, overall_channel_duration_hh_mm, channel_progression_seconds, channel_progression_hh_mm FROM join_data_7
LEFT OUTER JOIN 
(SELECT channel_id as channel_id_1, channel_progression_seconds, user_id as user_id_1, channel_progression_hh_mm FROM {{ref('u4_users_channel_progression_duration_formatted_part2_final_vw')}}) u4_channel 
ON join_data_7.user_id = u4_channel.user_id_1
and join_data_7.channel_id = u4_channel.channel_id_1

