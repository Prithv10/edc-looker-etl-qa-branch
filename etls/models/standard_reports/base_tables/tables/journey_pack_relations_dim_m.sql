-- journey_pack_relations_dim_m
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
  jp.cover_id AS journey_id,
  jp.from_id AS card_id,
  c.state AS card_state,
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
  AS journey_title,
  CASE
    WHEN c.card_type IS NULL OR c.card_type = '' THEN ''
    WHEN c.card_type='pack' THEN 'Pathway'
    WHEN c.card_type='video_stream' THEN 'Video Stream'
  ELSE
  INITCAP(c.card_type)
END
  AS card_type,
  TIMESTAMP(jp.updated_at) updated_at,
  c.organization_id AS org_id_s,
  CAST(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(jp.record_insert_time)) as timestamp) AS record_insert_time,
  CAST(jp.yr AS STRING) yr,
  CAST(jp.month AS STRING) month,
  jp.day,
  CAST(jp.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('journey_pack_relations')}} jp
INNER JOIN
    {{ref('cards_dim_m_v')}} c
ON
  c.id = jp.cover_id
INNER JOIN
    {{ref('cards_dim_m_v')}} c1
ON
  c1.id = jp.from_id
WHERE
  c.deleted_at IS NULL
  AND c1.deleted_at IS NULL
  AND c.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and jp.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
