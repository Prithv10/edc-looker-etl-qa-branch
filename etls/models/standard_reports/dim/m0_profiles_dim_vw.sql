
-- 300281_Glue_profiles_dim_m[0]
-- m0_profiles_dim_vw

SELECT id,CAST(user_id as float64) as user_id,external_id,uid,created_at,updated_at FROM 
(
    SELECT 
    RANK() OVER (PARTITION BY user_id ORDER BY record_insert_time DESC) AS rank,*
    FROM {{ref('profiles_dim_m_v')}}
    qualify rank=1 
)