-- Ch2 channel performance data explorer joins G2 Group Users  
-- 1454_Glue_Groups [G][3] [Channel Performance Data Explorer]
-- g3_groups_channel_performance_vw
{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["Group_Name","channel_name"],
    tags=['incremental']
  )
}}



SELECT 
ch2_perf.user_id,ch2_perf.User_Full_Name,ch2_perf.email,ch2_perf.time,ch2_perf.channel_id,ch2_perf.platform,
ch2_perf.performance_metric,ch2_perf.event,group_users.Group_ID,group_users.Group_Name,group_users.Group_Status,
ch2_perf.user_account_status,ch2_perf.Excluded_From_Leaderboard,ch2_perf.Is_Channel_Private,ch2_perf.channel_status,ch2_perf.channel_name, ch2_perf.Is_ECL_Enabled, ch2_perf.Is_Channel_Curated, ch2_perf.External_id
FROM {{ ref('ch2_channel_performance_part2_final_results_vw') }} ch2_perf
LEFT JOIN 
{{ ref('g2_groups_users_vw') }} group_users
ON ch2_perf.user_id = group_users.user_id
