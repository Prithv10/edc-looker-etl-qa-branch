-- card_reportings_dim_m
-- partition by - record_insert_time (updated_at has null values)

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'record_insert_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

SELECT
  card_reportings.id,
  card_id,
  user_id,
  reason,
  TIMESTAMP(card_reportings.deleted_at) AS deleted_at,
  TIMESTAMP(card_reportings.created_at) AS created_at,
  TIMESTAMP(card_reportings.updated_at) AS updated_at,
  card_reportings.status,
  users.organization_id AS org_id_s,
  CAST(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(card_reportings.record_insert_time)) as timestamp) AS record_insert_time,
  CAST(card_reportings.yr AS STRING) yr,
  CAST(card_reportings.month AS STRING) month,
  card_reportings.day,
  CAST(card_reportings.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('card_reportings')}} card_reportings
INNER JOIN
    {{ref('users_dim_m_v')}} users
ON
  users.id = card_reportings.user_id
LEFT JOIN
    {{ref('cards_dim_m_v')}} cards
ON
  card_reportings.card_id = cards.id
WHERE
  cards.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and card_reportings.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
