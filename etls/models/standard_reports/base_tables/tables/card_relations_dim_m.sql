-- card_relations_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  card_relations.id AS id,
  card_relations.card_id AS card_id,
  card_relations.root_id AS root_id,
  card_relations.parent_id AS parent_id,
  card_relations.name AS name,
  TIMESTAMP(card_relations.created_at) AS created_at,
  TIMESTAMP(card_relations.updated_at) AS updated_at,
  card_relations.user_id AS user_id,
  card_relations.state AS state,
  card_relations.version_type AS version_type,
  card_relations.change_log AS change_log,
  c.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(card_relations.record_insert_time)) AS record_insert_time,
  CAST(card_relations.yr AS STRING) yr,
  CAST(card_relations.month AS STRING) month,
  card_relations.day,
  CAST(card_relations.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('card_relations')}} card_relations
LEFT JOIN
  {{ref('cards_dim_m_v')}} AS c
ON
  card_relations.card_id=c.id
WHERE
  c.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and card_relations.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
