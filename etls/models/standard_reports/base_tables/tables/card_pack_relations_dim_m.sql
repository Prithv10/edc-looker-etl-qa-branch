-- card_pack_relations_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  SUBSTR(cp.title, 1, 4000) AS card_title,
  CASE
    WHEN c1.title IS NULL OR c1.title = '' THEN SUBSTR(c1.message, 1, 4000)
  ELSE
  SUBSTR(c1.title, 1, 4000)
END
  AS smart_title,
  CASE
    WHEN c.title IS NULL OR c.title = '' THEN SUBSTR(c.message, 1, 4000)
  ELSE
  SUBSTR(c.title, 1, 4000)
END
  AS pathway_title,
  CASE
    WHEN c1.card_type IS NULL OR c.card_type = '' THEN ''
    WHEN c1.card_type='pack' THEN 'Pathway'
    WHEN c1.card_type='video_stream' THEN 'Video Stream'
  ELSE
  INITCAP(c1.card_type)
END
  card_type,
  cp.cover_id AS pathway_id,
  cp.from_id AS card_id,
  c.state AS card_state,
  TIMESTAMP(cp.updated_at) updated_at,
  c.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(cp.record_insert_time)) AS record_insert_time,
  CAST(cp.yr AS STRING) yr,
  CAST(cp.month AS STRING) month,
  cp.day,
  CAST(cp.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('card_pack_relations')}} cp
INNER JOIN
    {{ref('cards_dim_m_v')}} c
ON
  c.id = cp.cover_id
INNER JOIN
    {{ref('cards_dim_m_v')}} c1
ON
  c1.id = cp.from_id
WHERE
  c.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and cp.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
