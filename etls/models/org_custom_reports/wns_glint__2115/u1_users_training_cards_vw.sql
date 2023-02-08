-- u1_users_training_cards_vw
-- 2115 Users [U][1] [Training Cards]

With select_column_type as(
SELECT time, cast(card_id as float64) as card_id, cast(user_id as float64) as user_id, event, training_registration_id, training_registration_state
FROM {{ref('u0_usercards_event_vw')}}
WHERE event IN('card_training_registered', 'card_training_unregistered', 'card_training_registration_approved', 'card_training_registration_denied')
),

value_mapper as(
SELECT time, training_registration_id, event, card_id, user_id_1 as user_id, 
CASE WHEN training_registration_state = 'approved' THEN 'Approved' 
     WHEN training_registration_state = 'unregistered' THEN 'UnRegistered'
     WHEN training_registration_state = 'pending' THEN 'Pending'
     WHEN training_registration_state = 'rejected' THEN 'Rejected'   
ELSE training_registration_state
END AS training_registration_state
 FROM(
SELECT time, training_registration_id, training_registration_state, event, user_id, card_id
FROM(
SELECT *, RANK() OVER(PARTITION BY training_registration_id order by time desc) as rankcol FROM select_column_type
QUALIFY rankcol = 1)) current_registration_state 
INNER JOIN
(SELECT user_id as user_id_1, training_registration_id as training_registration_id_1
FROM(
SELECT *, RANK() OVER(PARTITION BY training_registration_id order by time asc) as rankcol FROM select_column_type
QUALIFY rankcol = 1))user_id_based_on_registration_id
ON current_registration_state.training_registration_id = user_id_based_on_registration_id.training_registration_id_1
),

select_column_6 as(
SELECT training_start_date, registration_type, conferencing_tool, card_id, last_registration_date, registration_limit, time_zone, time, training_registration_id, training_registration_state, event, user_id, training_end_date
FROM (SELECT * FROM {{ref('c0_training_cards_latest_metadata_part4_final_vw')}}) c0_training 
LEFT OUTER JOIN 
(SELECT time, training_registration_id, event, card_id as card_id_1, user_id, training_registration_state 
FROM value_mapper) value_mapper_join
ON c0_training.card_id = value_mapper_join.card_id_1),

select_columns_1 as(
SELECT time, training_end_date, training_start_date, training_registration_id,
training_registration_state, event, card_id, user_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, is_public, content_structure, card_author_full_name, registration_limit, registration_type,
time_zone, conferencing_tool, last_registration_date, current_content_owner_full_name  FROM select_column_6
LEFT OUTER JOIN 
(SELECT 
card_id as card_id_1,current_content_owner_id,current_content_owner_full_name,card_state,card_subtype,card_type,ecl_id,ecl_source_name,is_public,Duration_HHMM,Duration,Duration_seconds,published_at,card_title,created_at,updated_at,card_level,average_rating,standard_card_type,card_resource_url,content_structure,org_id_s,author_id,card_author_full_name,etl_record_created_time,tags
 FROM {{ref('c1_content_latest_metadata_vw')}}) c1_content
ON select_column_6.card_id = c1_content.card_id_1)

SELECT * FROM select_columns_1
LEFT OUTER JOIN 
(SELECT user_id as user_id_1,User_Full_Name,User_Account_Status,Excluded_From_Leaderboard,email,Time_Account_Created,sign_in_count,Time_Account_Suspended,etl_record_created_time,external_id
FROM 
{{ref('u1_users_latest_metadata_vw')}}) u1_latest 
ON select_columns_1.user_id = u1_latest.user_id_1

/*
time, training_end_date, training_start_date, training_registration_id, training_registration_state,event, card_id,
user_id, card_resource_url, card_state, card_title, card_type, ecl_id, ecl_source_name,
is_public, content_structure, card_author_id, content_status, card_author_full_name,
User_Full_Name, email, Time_Account_Created, sign_in_count, User_Account_Status, Excluded_From_Leaderboard, registration_limit,
registration_type, time_zone, conferencing_tool, last_registration_date, new_joiner, delivery_location, model_code,
delivery_model, delivery_organization, vertical, category, billabilty, division,
department_description, department, establishment, company, location_description, location,
supervisor_name, supervisor_id, job_description, job_code, grade, full_part_time, organizational_relationship,
country, gender, hire_date, employeee_status, middle_name, name_prefix, employee_id, last_working_day, client, team_group, user
*/