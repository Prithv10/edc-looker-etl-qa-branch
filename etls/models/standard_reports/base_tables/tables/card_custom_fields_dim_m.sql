-- card_custom_fields_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  card_custom_fields.id,
  card_custom_fields.custom_field_id,
  card_custom_fields.card_id,
  card_custom_fields.value,
  TIMESTAMP(card_custom_fields.created_at) AS created_at,
  TIMESTAMP(card_custom_fields.updated_at) AS updated_at,
  cards.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(card_custom_fields.record_insert_time)) AS record_insert_time,
  CAST(card_custom_fields.yr AS STRING) yr,
  CAST(card_custom_fields.month AS STRING) month,
  card_custom_fields.day,
  CAST(card_custom_fields.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('card_custom_fields')}} card_custom_fields
INNER JOIN
  {{ref('cards_dim_m_v')}} cards
ON
  cards.id = card_custom_fields.card_id
WHERE
  cards.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and card_custom_fields.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
