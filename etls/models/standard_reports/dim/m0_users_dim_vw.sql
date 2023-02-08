-- 300281_Glue_Users_dim_m[0]
-- m0_users_dim_vw

select id,admin_user as User_Full_Name,email,created_at,updated_at,sign_in_count,status as User_Account_Status,
exclude_from_leaderboard as Excluded_From_Leaderboard,org_id_s from
(
    SELECT DISTINCT id,
    RANK() OVER (PARTITION BY id ORDER BY record_insert_time DESC) AS rank,
    email,concat(trim(first_name),' ',trim(last_name)) AS admin_user,created_at,updated_at,sign_in_count,status,exclude_from_leaderboard,org_id_s,record_insert_time
    FROM {{ref('users_dim_m_v')}} user
    qualify rank=1 
)
