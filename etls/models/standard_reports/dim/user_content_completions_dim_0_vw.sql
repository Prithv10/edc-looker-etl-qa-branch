-- user_content_completions_dim_0_vw



{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

SELECT user_id, completable_id, completed_at, completed_percentage, updated_at, record_insert_time, state, current_timestamp() AS etl_record_created_time 
FROM
(SELECT user_id, completable_id, completed_at, completed_percentage, updated_at, record_insert_time, duration, state,
RANK() OVER (PARTITION BY User_id, completable_id ORDER BY record_insert_time DESC) AS rank
FROM
{{ref('user_content_completions_dim_m_v')}}
QUALIFY rank = 1)
WHERE state = 'completed' 