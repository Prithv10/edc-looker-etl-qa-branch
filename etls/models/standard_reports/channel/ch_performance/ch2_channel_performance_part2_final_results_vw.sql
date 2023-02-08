
-- 2. Channel Performance - Combine Filter Results
-- Part-2 : final results
-- Channels [CH][2] [Channel Performance Data Explorer]
-- ch2_channel_performance_part2_final_results_vw
-- dbt run --select  channel.ch_performance.ch2_channel_performance_part2_final_results_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["channel_name"],
    tags=['incremental']
  )
}}

-- Join 2.2 & dbt_users_u1_latest_metadata_vw
SELECT CAST(u1_lat.user_id AS FLOAT64) AS user_id,u1_lat.User_Full_Name,u1_lat.email,a21.time,a21.channel_id,a21.platform,a21.performance_metric,a21.event,a21.channel_name,a21.channel_status,u1_lat.user_account_status,u1_lat.Excluded_From_Leaderboard,a21.Is_Channel_Private,CAST(a21.Is_ECL_Enabled AS INT64) AS Is_ECL_Enabled,
CAST(a21.Is_Channel_Curated AS INT64) AS Is_Channel_Curated ,u1_lat.external_id
FROM
  (
    -- 2.1 Join dbt_channel_ch2_performance_part1_filter_results_vw & dbt_channel_ch1_latest_metadata_vw
    SELECT
    ch2_perform.time,ch2_perform.user_id,ch2_perform.channel_id,ch2_perform.platform,
    performance_metric,event,ch1_lat.channel_name,ch1_lat.channel_status,
    ch1_lat.Is_Channel_Private,ch1_lat.Is_ECL_Enabled,ch1_lat.Is_Channel_Curated
    FROM
    {{ ref('ch2_channel_performance_part1_filter_results_vw') }} ch2_perform
    LEFT JOIN
    {{ ref('ch1_channel_latest_metadata_vw') }} ch1_lat
    ON
    ch2_perform.channel_id =  ch1_lat.Channel_ID
  ) a21
LEFT JOIN
{{ ref('u1_users_latest_metadata_vw') }} u1_lat
ON
a21.user_id =  u1_lat.user_id