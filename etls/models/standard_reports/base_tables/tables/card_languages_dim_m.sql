-- card_languages_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}


SELECT
  card_languages.id AS id,
  card_languages.card_id AS card_id,
  card_languages.resource_id AS resource_id,
  card_languages.title AS title,
  card_languages.message AS message,
  card_languages.language AS LANGUAGE,
  card_languages.custom_data AS custom_data,
  TIMESTAMP(card_languages.deleted_at) AS deleted_at,
  TIMESTAMP(card_languages.created_at) AS created_at,
  TIMESTAMP(card_languages.updated_at) AS updated_at,
  card_languages.media AS media,
  card_languages.state AS state,
  c.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(card_languages.record_insert_time)) AS record_insert_time,
  CAST(card_languages.yr AS STRING) yr,
  CAST(card_languages.month AS STRING) month,
  card_languages.day,
  CAST(card_languages.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{ref('cards_dim_m_v')}} AS c
LEFT JOIN
  {{get_master_db('card_languages')}} card_languages
ON
  card_languages.card_id=c.id
WHERE
  c.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and card_languages.day>= (SELECT max(day) FROM {{ this }})
{% endif %}

