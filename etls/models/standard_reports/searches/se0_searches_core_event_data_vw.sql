-- 300281_Glue_Searches [SE][0] [Core Event Data - Buffered]
-- se0_searches_core_event_data_vw

SELECT _user_id,analytics_version,event_recorder, time, is_admin_request,is_system_generated,org_hostname, platform,
    results_count,search_query,user_agent,user_id,platform_version_number,event,org_id_s   FROM (
SELECT 
    _user_id,analytics_version,event_recorder,event_time,is_admin_request,is_system_generated,org_hostname,
    (CASE WHEN (platform ='iPhone') THEN 'ios'  ELSE platform END) AS platform,
    results_count,search_query,user_agent,user_id,platform_version_number,event,org_id_s,time,count(event) AS Occurences 
FROM  {{get_db_source('searches_fact_i_v')}}
GROUP BY _user_id,analytics_version,event_recorder,event_time,is_admin_request,is_system_generated,
org_hostname,platform,results_count,search_query,user_agent,user_id,platform_version_number,event,org_id_s,time) add_formula
INNER JOIN 
(SELECT CAST(user_id as int64) as user_id_1 FROM {{ref('u1_users_latest_metadata_vw')}}) alter_columns
ON add_formula.user_id = alter_columns.user_id_1
