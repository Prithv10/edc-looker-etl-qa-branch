-- Groups [G][3] [Group User Details]
-- g3_groups_group_user_details_vw

-- NULL indicates missing columns

SELECT  user_id, group_id, group_name, group_user_role AS group_role, user_full_name, email, time_account_created, sign_in_count, user_account_status,
NULL AS location_code, NULL AS division_code, NULL AS department_function_code, NULL AS department_id, NULL AS person_city, NULL AS person_state,
NULL AS employee_type, NULL AS management_level, NULL AS manager_name, NULL AS start_date, NULL AS job_code, NULL AS department, NULL AS department_function,
NULL AS division_name, NULL AS company_name, NULL AS AFI_External_ID, NULL AS sales_state, Excluded_From_Leaderboard, NULL AS SME FROM
((
   SELECT Group_ID, Group_Name, Group_Status, User_ID AS user_id_1, Group_User_Role, etl_record_created_time
   FROM
     {{ ref('g2_groups_users_vw') }}) AS g2
 LEFT OUTER JOIN
 (
   SELECT * FROM
     {{ ref('u1_users_latest_metadata_vw') }} )AS u1
 ON
   g2.user_id_1 = u1.user_id)