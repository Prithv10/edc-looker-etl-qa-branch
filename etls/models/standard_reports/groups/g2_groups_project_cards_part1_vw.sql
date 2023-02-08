  -- g2_groups_project_cards_part1_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'Time', 'data_type': 'timestamp','granularity': 'day'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["event"],
    tags=['incremental']
  )
}}


-- SELECT COLUMNS 10
SELECT
  Time, card_id, event, grade_range, grader_type, grading_system, project_card_submission_id, 
  submitter_type, changed_column, old_value, submitter_id, grader_id, submission_status, grade, 
  card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, 
   is_public,  content_structure, 
  card_author_id,  card_author_full_name, email, time_account_created, 
  sign_in_count, user_account_status, excluded_from_leaderboard, group_id, group_name, 
  group_status, submitter_full_name, grader_full_name, project_card_submission_url, card_level, 
  average_rating, standard_card_type, published_at, external_id, current_content_owner_full_name
FROM
  {{ref('u1_users_project_cards_vw')}} select_columns_8
  -- JOIN DATA 4
LEFT OUTER JOIN (
  SELECT
  -- SELECT COLUMNS 9
    user_id, group_id, group_name, group_status
  FROM
    {{ref('g2_groups_users_vw')}}) select_columns_9
ON
  select_columns_8.submitter_id = select_columns_9.user_id