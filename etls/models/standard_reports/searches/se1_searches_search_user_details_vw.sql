
-- Final query:
-- se1_searches_search_user_details_vw
{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["platform"],
    tags=['incremental']
  )
}}


SELECT 
event_v.time,
event_v.analytics_version,
event_v.event,
event_v.is_admin_request,
event_v.is_system_generated,
event_v.org_hostname as hostname,
event_v.org_id_s as Org_ID,
event_v.platform,
event_v.platform_version_number,
event_v.results_count,
lower(event_v.search_query) as search_query,
event_v.user_agent,
users_u1_meta_v.user_id,
users_u1_meta_v.User_Full_Name,
users_u1_meta_v.email,
users_u1_meta_v.time_account_created,
users_u1_meta_v.sign_in_count,
users_u1_meta_v.user_account_status,
users_u1_meta_v.Excluded_From_Leaderboard,
users_u1_meta_v.external_id,
current_timestamp() AS etl_record_created_time
FROM 
{{ ref('se0_searches_core_event_data_vw') }} AS event_v 
LEFT JOIN  {{ ref('u1_users_latest_metadata_vw') }} AS users_u1_meta_v 
ON event_v.user_id = users_u1_meta_v.user_id

