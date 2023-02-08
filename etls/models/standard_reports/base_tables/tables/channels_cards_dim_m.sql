-- channels_cards_dim_m
-- partition by - etl_record_created_time (updated_at has null values)


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  c.id AS card_id,
  CASE
    WHEN c.title IS NULL OR c.title = '' THEN SUBSTR(c.message, 1, 4000)
  ELSE
  SUBSTR(c.title, 1, 4000)
END
  AS card_title,
  CASE
    WHEN c.ecl_source_name IS NULL OR c.ecl_source_name = '' THEN ''
    WHEN c.ecl_source_name='UGC' THEN 'User Generated Content'
  ELSE
  INITCAP(ecl_source_name)
END
  AS ecl_source_name,
  c.card_type,
  c.state AS card_state,
  c1.id AS channel_id,
  c1.label AS channel_name,
  c.card_subtype,
  c.slug,
  TIMESTAMP(c.created_at) AS created_at,
  p.object_id,
  TIMESTAMP(cc.updated_at) AS updated_at,
  c.organization_id AS org_id_s,
  CAST(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', datetime(c.record_insert_time)) as timestamp)AS record_insert_time,
  CAST(c.yr AS STRING) yr,
  CAST(c.month AS STRING) month,
  c.day,
  CAST(c.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('channels_cards')}} cc
LEFT JOIN
    {{ref('cards_dim_m_v')}} c
ON
  cc.card_id = c.id
LEFT JOIN
    {{ref('channels_dim_m_v')}} c1
ON
  c1.id = cc.channel_id
LEFT JOIN
    {{get_master_db('pins')}} p
ON
  p.object_id = c.id
WHERE
  cc.state = 'curated'
  AND c.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and cc.day >= (SELECT max(day) FROM {{ this }})
{% endif %}

