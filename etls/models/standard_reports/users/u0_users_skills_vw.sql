-- 1454_Glue_Skills_Users [U][0]
-- u0_users_skills_vw

SELECT 
  DISTINCT id, user_id, created_at, experience, skill_level, skill_type, skill_name_new as skill_name, updated_at, credential_name, description, credential_url,
  expiry_date, issue_date, issuer, skills, skill_label, credential_id, credential_type, score, credential, skill_id 
  FROM(
SELECT
  id, user_id, skill_id, description, credential, created_at, experience, skill_level, 
  credential_name, credential_url, expiry_date, issue_date, issuer, skills, skill_label, credential_id,
  credential_type, score, skill_name, updated_at, 
  CASE
    WHEN credential_type = 1 THEN 'Skills'
  END AS skill_type,
  CASE
    WHEN skill_name IS NULL THEN skill_label
    WHEN skill_name = '' THEN skill_label
  ELSE skill_name END AS skill_name_new
FROM (
  SELECT * FROM(
    SELECT
    id, user_id, skill_id, description, credential, created_at, experience,
    CASE
        WHEN skill_level = 'Advance' THEN 'Advanced'
        WHEN skill_level = 'advanced' THEN 'Advanced'
        WHEN skill_level = 'beginner' THEN 'Beginner'
        WHEN skill_level = 'intermediate' THEN 'Intermediate'
        WHEN skill_level = 'Unknown' THEN 'Undeclared'
        WHEN skill_level IS NULL THEN 'Undeclared'
        WHEN skill_level = '' THEN 'Undeclared'
        WHEN skill_level = 'Advancedd' THEN 'Advanced'
    ELSE skill_level END AS skill_level,
    credential_name, credential_url, expiry_date, issue_date, issuer, skills, 
    skill_label, credential_id,
    CASE
        WHEN credential_type IS NULL THEN 1
    ELSE credential_type END AS credential_type,
    score, skill_name, updated_at    
    FROM (
    SELECT
        *,
        RANK() OVER (PARTITION BY user_id, id ORDER BY updated_at DESC) AS rank1
    FROM (
        SELECT
        id, user_id, skill_id, description, credential, created_at, experience, 
        skill_level, credential_name, credential_url, expiry_date, issue_date, issuer, 
        skills, skill_label, credential_id, credential_type, score, skill_name, 
        updated_at, COUNT(user_id) AS occourance
        FROM (
        SELECT
            id, user_id, skill_id AS skill_id, description, credential, created_at, 
            experience, skill_level, credential_name, credential_url, expiry_date, 
            issue_date, issuer, skills, skill_label, credential_id, credential_type, 
            score, updated_at, skill_name
        FROM
            {{ref('skills_users_dim_m_v')}})
        GROUP BY
        id, user_id, skill_id, description, credential, created_at, experience, 
        skill_level, credential_name, credential_url, expiry_date, issue_date, issuer, 
        skills, skill_label, credential_id, credential_type, score, skill_name, 
        updated_at ) QUALIFY rank1 = 1))
  WHERE credential_type = 1))