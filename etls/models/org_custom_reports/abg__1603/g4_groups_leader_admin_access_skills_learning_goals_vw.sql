-- g4_groups_leader_admin_access_skills_learning_goals_vw
-- Groups [G][4] [Leader & Admin Access][Skills & Learning Goals]


SELECT user_id, User_Full_Name, email, Time_Account_Created, Excluded_From_Leaderboard, time, event, topic_type,
topic_label, group_id, group_name, group_status, granted_event_view_access FROM {{ref('g3_groups_skills_learninggoals_vw')}} g3_skills 
LEFT OUTER JOIN 
(SELECT DISTINCT CAST(group_id as int64) as group_id_1, granted_event_view_access FROM {{ref('g3_groups_group_leadersgroup_admin_abg_vw')}}) set_column_type
ON g3_skills.group_id = set_column_type.group_id_1
