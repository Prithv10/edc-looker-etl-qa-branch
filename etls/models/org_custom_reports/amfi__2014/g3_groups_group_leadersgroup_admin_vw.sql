-- Groups [G][3] [Group Leaders & Group Admin]
-- g3_groups_group_leadersgroup_admin_vw

SELECT * FROM(
SELECT user_id, group_id, group_user_role, granted_event_view_access from
(SELECT user_id, group_id, group_user_role from {{ref('g2_groups_users_vw')}}) select_columns
LEFT OUTER JOIN
(SELECT user_id as user_id_1, email as granted_event_view_access from {{ref('u1_users_latest_metadata_vw')}}) select_columns_1 
ON select_columns.user_id = select_columns_1.user_id_1)
WHERE granted_event_view_access IS NOT NULL 
and group_user_role != 'Group Member'
and granted_event_view_access NOT IN('edcast.com')
and group_user_role IS NOT NULL
