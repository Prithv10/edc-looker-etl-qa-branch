-- u3_users_journey_progression_overview_part7_final_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

SELECT
  user_id, total_journey_pathway_child_cards, journey_id, journey_title, journey_pathway_id, journey_pathway_title, content_structure, total_cards_completed, 
  overall_completion_status, user_full_name, email, journey_pathway_progress, total_journey_cards, time_completed_journey as time_completed, journey_completion_progress, journey_progress, journey_pathway_completion_progress, 
  journey_pathway_completion_status, user_account_status, excluded_from_leaderboard, time_account_created, external_id, current_timestamp() AS etl_record_created_time
FROM (
  SELECT
    *
  FROM
    {{ref('u3_users_journey_progression_overview_part6_vw')}} append_rows_1
  LEFT OUTER JOIN (
    SELECT
      CAST(user_id AS float64) AS user_id_1, user_full_name, user_account_status, excluded_from_leaderboard, email, time_account_created, sign_in_count, time_account_suspended, 
     external_id
    FROM
      {{ref('u1_users_latest_metadata_vw')}}) set_column_type
  ON
    append_rows_1.user_id = set_column_type.user_id_1)
