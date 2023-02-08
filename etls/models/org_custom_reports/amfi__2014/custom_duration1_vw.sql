-- Custom_duration1
-- custom_duration1_vw

-- NULL indicates missing columns

SELECT card_id,  card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, card_author_id, card_resource_url,
card_author_full_name, user_id, user_full_name, email, NULL AS time_account_status, time, event, shared_to_user_id, shared_to_group_id,
platform, performance_metric, comment_id, comment_message, followed_user_id, follower_id, shared_to_user_full_name,
following_user_full_name, follower_user_full_name, shared_to_group_name, NULL AS location_code, NULL AS division_code,
NULL AS department_id, NULL AS person_city, NULL AS person_state, NULL AS employee_type, NULL AS management_name, NULL AS manager_name,
NULL AS start_date, NULL AS job_code, NULL AS department, NULL AS department_function, NULL AS division_name, NULL AS company_name,
NULL AS AFI_External_ID, NULL AS sales_state, excluded_from_leaderboard, NULL AS avg_rating, NULL AS total_user_ratings, NULL AS SME,
NULL AS card_author_SME, NULL AS acloud_guru_access, NULL AS management_level_code, NULL AS udemy_access,
NULL AS management_level_description, NULL AS workers_vice_president, NULL AS workers_director, NULL AS workers_av,
Duration_seconds, Duration_HHMM
FROM
(
 SELECT * FROM
   {{ ref('u2_users_performance_part5_final_results_vw') }}) AS u2
FULL OUTER JOIN
(
 SELECT card_id AS card_id_1, current_content_owner_id, current_content_owner_full_name, card_state AS card_state_1,
 card_subtype AS card_subtype_1, card_type AS card_type_1, ecl_id AS ecl_id_1, ecl_source_name AS ecl_source_name_1,
 is_public, Duration_HHMM AS Duration_HHMM_1, Duration_seconds AS Duration_seconds_1, published_at, card_title AS card_title_1,
 created_at, updated_at, card_level, average_rating, standard_card_type, card_resource_url AS card_resource_url_1, content_structure,
 org_id_s, author_id, etl_record_created_time
 FROM
   {{ ref('c1_content_latest_metadata_vw') }}) AS c1
ON
 u2.card_id = c1.card_id_1
