-- Users [U][1] [Latest Metadata]
-- u1_users_latest_metadata_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'Time_Account_Created', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    tags=['incremental']
  )
}}



SELECT user_id, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created,
sign_in_count, time_account_suspended, external_id FROM (
SELECT user_id, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created,
sign_in_count, time_account_suspended FROM (
SELECT CAST(id as float64)user_id, User_Full_Name, email, created_at as Time_Account_Created,
sign_in_count, User_Account_Status, Excluded_From_Leaderboard FROM {{ ref('m0_users_dim_vw') }}) user_dim_m0_vw
LEFT OUTER JOIN 
(SELECT user_id as user_id_1, time_account_suspended FROM {{ ref('u0_users_nonactive_accounts_vw') }}) u0_nonactive_vw
ON user_dim_m0_vw.user_id = u0_nonactive_vw.user_id_1) join_data
LEFT OUTER JOIN 
(SELECT user_id as user_id_1, external_id FROM {{ ref('m0_profiles_dim_vw') }}) prof_dim_vw
ON join_data.user_id = prof_dim_vw.user_id_1








