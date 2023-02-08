-- badgings_dim_m
-- used time_badge_last_updated instead of updated_at in partition_by

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}



SELECT
  badging.id,
  badging.title AS badge_title,
  badging.badgeable_id AS badgeable_card_id,
  badging.badge_id,
  badging.type AS badge_type,
  badging.target_steps,
  badging.all_quizzes_answered,
  cards.organization_id AS org_id_s,
  TIMESTAMP(badging.created_at) AS time_badge_created,
  TIMESTAMP(badging.updated_at) AS updated_at,
  TIMESTAMP(badging.updated_at) AS time_badge_last_updated,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(badging.record_insert_time)) AS record_insert_time,
  CAST(badging.yr AS STRING) yr,
  CAST(badging.month AS STRING) month,
  badging.day,
  CAST(badging.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('badgings')}} AS badging
INNER JOIN
  {{ref('cards_dim_m_v')}} AS cards
ON
  badging.badgeable_id = cards.id
WHERE
  cards.deleted_at IS NULL
  AND cards.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and badging.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
