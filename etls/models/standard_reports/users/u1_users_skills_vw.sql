  -- 1454_Glue_ Skills_ Users [U][1]
  -- u1_users_skills_vw
SELECT
  skill_id, user_id, created_at, experience, skill_level, skill_type, skill_name, user_full_name, 
  user_account_status, excluded_from_leaderboard, email, time_account_created, sign_in_count, 
  time_account_suspended, external_id, credential_name
FROM (
  SELECT
     user_id, created_at, experience, skill_level, skill_type, skill_name, credential_name, id as skill_id
  FROM
    {{ref('u0_users_skills_vw')}}) u0_skills
LEFT OUTER JOIN (
  SELECT
    user_id AS user_id_1, user_full_name, user_account_status, excluded_from_leaderboard, email, 
    time_account_created, sign_in_count, time_account_suspended, external_id
  FROM
    {{ref('u1_users_latest_metadata_vw')}} ) u1_latest
ON
  u0_skills.user_id = u1_latest.user_id_1