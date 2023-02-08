-- 1454_Glue_User Roles [U][1] 
-- u1_user_roles_vw

SELECT name as Role, user_id as User_ID, role_id as Role_ID, created_at as Time from
(SELECT * FROM 
(SELECT
  CAST(id AS float64) AS id, name, master_role, created_at, updated_at, image_url, threshold, default_name, org_id_s
FROM (
  SELECT
    *,
    RANK() OVER(PARTITION BY id ORDER BY record_insert_time DESC) AS rank
  FROM
    {{ref('roles_dim_m_v')}} QUALIFY rank = 1 )
) alter_columns
INNER JOIN
(SELECT
  id, CAST(user_id AS float64) AS user_id, CAST(role_id AS float64) AS role_id, created_at as created_at_1, updated_at, deleted_at, org_id_s
FROM (
  SELECT
    *, 
    RANK() OVER(PARTITION BY user_id, role_id ORDER BY record_insert_time DESC) AS rank
  FROM
    {{ref('user_roles_dim_m_v')}} QUALIFY rank = 1 )
) alter_columns_1

ON alter_columns.id = alter_columns_1.role_id
WHERE deleted_at IS NULL
)