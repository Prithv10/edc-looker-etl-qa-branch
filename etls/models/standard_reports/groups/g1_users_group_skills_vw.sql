  -- g1_users_group_skills_vw

  
SELECT
  skill_id, user_id, created_at, experience, skill_level, skill_type, skill_name, user_full_name, 
  user_account_status, excluded_from_leaderboard, email, time_account_created, sign_in_count, external_id, 
  group_name, group_status, group_user_role, credential_name
FROM
  {{ref('u1_users_skills_vw')}} u1_skills
LEFT OUTER JOIN (
  SELECT
    Group_ID, Group_Name, Group_Status, User_ID AS user_id_1, group_user_role
  FROM
    {{ref('g2_groups_users_vw')}}) g2_groups
ON
  u1_skills.user_id = g2_groups.user_id_1