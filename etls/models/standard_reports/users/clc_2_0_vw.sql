-- clc_2_0_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'completed_at', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

SELECT id, entity_id, entity_type, CAST(from_date as date) as from_date, CAST(to_date as date) as to_date, target_score, target_steps, deleted_at, created_at, updated_at, name, status, org_id_s, user_id, user_full_name, user_account_status, excluded_from_leaderboard, email, time_account_created, completable_id, completed_at, completed_percentage, duration, external_id, etl_record_created_time, CLCStatus, clc_name
  FROM (
select DISTINCT A.*, B.*, case when A.`status`=0 then 'InActive' else 'Active' end as CLCStatus, concat(A.name,'( ',`from_date`,' To ',`to_date`,' )') as clc_name
from {{ ref('clcs_dim_u0_vw') }} A JOIN {{ ref('clc_user_completions_dim_0_vw') }} B on date(B.`completed_at`) BETWEEN date(A.`from_date`) and date(A.`to_date`))