-- 1454_Glue_Users [U][2] [User Performance Data Explorer]
-- u2_users_performance_part5_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
	partition_by = {'field': 'p_week', 'data_type': 'timestamp'},
    cluster_by = ["performance_metric","user_id","event"],
    tags=['incremental']
  )
}}


SELECT
card_id,
card_state,card_title,card_type,
content_structure,
author_id,
NULL AS card_author_id,
user_id,user_full_name,
email,Time,event,shared_to_user_id,shared_to_group_id,platform,performance_metric,
comment_id,comment_message,follower_id,followed_user_id,
shared_to_user_full_name,following_user_full_name,follower_user_full_name,
shared_to_group_name,
card_author_full_name,
comment_status,
time_account_created,sign_in_count,user_account_status,excluded_from_leaderboard,
card_resource_url,
Duration_seconds,
Duration_HHMM,
ecl_id,
ecl_source_name,is_public,card_subtype,
assigned_content,
badge_id,badge_type,badge_title,
standard_card_type,published_at,card_rating,
time_account_suspended,
content_completion_sync,referer,external_id,average_rating,card_level,
current_content_owner_full_name,
timestamp_trunc(`Time`, week) as p_week,
current_timestamp() AS etl_record_created_time
FROM (
    SELECT *,
        (CASE WHEN (assigned_content_tmp IS NULL ) THEN 'False'  ELSE assigned_content_tmp END) AS assigned_content FROM
    (
        -- COMBINED RESULTS
        SELECT a51.*,a52.assigned_content_tmp FROM
        (
            -- part4
            SELECT * FROM {{ ref('u2_users_performance_part4_vw') }}
        ) a51
        LEFT OUTER JOIN
        (
            select DISTINCT user_id,card_id,CAST('True' AS STRING) AS assigned_content_tmp from
            {{ ref('u2_users_assignment_status_vw') }}
        ) AS a52
        ON
        a51.user_id = a52.user_id AND
        a51.card_id = a52.card_id
    )
) a5_res
WHERE timestamp_trunc(`Time`, week) IS NOT NULL

