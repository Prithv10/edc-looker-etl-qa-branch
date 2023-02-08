-- comments_fact_m


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}



SELECT
  comments.id,
  SUBSTR(message, 1, 4000) AS message,
  type,
  organization_id AS org_id_s,
  commentable_id,
  commentable_type,
  user_id,
  TIMESTAMP(comments.created_at) AS created_at,
  TIMESTAMP(comments.updated_at) AS updated_at,
  votes_count,
  resource_id,
  CAST(hidden AS bool) hidden,
  CAST(anonymous AS bool) anonymous,
  CAST(is_mobile AS bool) is_mobile,
  client_item_id,
  comments_count,
  TIMESTAMP(comments.deleted_at) AS deleted_at,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(comments.record_insert_time)) AS record_insert_time,
  CAST(comments.yr AS STRING) yr,
  CAST(comments.month AS STRING) month,
  comments.day,
  CAST(comments.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('comments')}} comments
LEFT JOIN
    {{ref('users_dim_m_v')}} users
ON
  comments.user_id = users.id
WHERE
  users.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and comments.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
