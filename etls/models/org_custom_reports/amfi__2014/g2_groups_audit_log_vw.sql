-- Groups [G][2] [Audit Log]
-- g2_groups_audit_log_vw


With replace_user_full_name as(
SELECT time, event,group_id, group_user_id, group_user_full_name, user_id, user_full_name
FROM(
SELECT time, event, group_id, group_user_id, user_full_name as group_user_full_name, user_id
FROM 
(SELECT user_id as user_id_1, user_full_name FROM {{ref('u1_users_latest_metadata_vw')}}) select_columns_1
LEFT OUTER JOIN 
(
SELECT time, event, null as group_id, group_user_id, user_id
FROM {{ref('g0_groups_core_event_vw')}}
WHERE event = 'group_created'
or event = 'group_deleted'
or event = 'group_user_added'
or event = 'group_user_removed') groups_events
ON groups_events.group_user_id = select_columns_1.user_id_1) add_group_user
LEFT OUTER JOIN 
(SELECT user_id as user_id_1, user_full_name FROM {{ref('u1_users_latest_metadata_vw')}}) select_columns_1
ON add_group_user.user_id = select_columns_1.user_id_1)

SELECT time, event, group_id, group_name, group_user_id, group_user_full_name, user_id, 
user_full_name 
FROM replace_user_full_name
LEFT OUTER JOIN 
(SELECT group_id as group_id_1, group_name from {{ref('g1_groups_latest_metadata_vw')}}) select_columns
ON replace_user_full_name.group_id = select_columns.group_id_1



