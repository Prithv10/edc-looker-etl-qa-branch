-- 1454_Glue_Users [U][2] [LXP Roles] 
-- u2_users_lxp_roles_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'Time_Account_Created', 'data_type': 'timestamp','granularity': 'year'},
    cluster_by = ["lxp_role"],
    tags=['incremental']
  )
}}


SELECT * EXCEPT (User_ID_1), INITCAP(replace(LXP_Role,'_',' ')) as LXP_ROLE_NEW 
FROM (
SELECT * FROM 
(SELECT user_id as User_ID_1, User_Full_Name, User_Account_Status, Excluded_From_Leaderboard, email, Time_Account_Created, sign_in_count, Time_Account_Suspended, external_id FROM 
{{ ref('u1_users_latest_metadata_vw') }}
) u1_users_lateset_metadata
INNER JOIN 
(SELECT Role as LXP_Role, User_ID, Role_ID from {{ ref('u1_user_roles_vw') }}) select_columns
ON select_columns.User_ID = u1_users_lateset_metadata.User_ID_1
)