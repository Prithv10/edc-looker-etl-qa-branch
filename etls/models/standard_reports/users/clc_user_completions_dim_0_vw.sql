-- clc_user_completions_dim_0_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'completed_at', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

SELECT A.user_id, B.user_full_name, B.user_account_status, B.excluded_from_leaderboard, B.email,B.time_account_created, A.completable_id, A.completed_at, A.completed_percentage, 
A.duration, B.external_id, current_timestamp() AS etl_record_created_time --,C.*
FROM
(SELECT user_id, completable_id, completed_at, completed_percentage, updated_at, record_insert_time, duration, state,
RANK() OVER (PARTITION BY User_id, completable_id ORDER BY record_insert_time DESC) AS rank
FROM
{{ref('user_content_completions_dim_m_v')}}
WHERE 
completed_at is not null QUALIFY rank = 1) A join (
select user_id, user_full_name, user_account_status, excluded_from_leaderboard, email, time_account_created, sign_in_count, external_id 
from {{ ref('u1_users_latest_metadata_vw') }}
) B on A.user_id=B.user_id
join (
    select card_id, card_type, count(*) as occurences from {{ ref('c1_content_latest_metadata_vw') }}  group by card_id, card_type
) C on A.completable_id = C.card_id
where C.card_type not in ('Journey','Pathway')