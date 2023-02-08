-- taggings_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  taggings.id,
  tags.id AS tag_id,
  tags.name,
  tags.partition_id AS partition_id,
  taggings.taggable_id,
  TIMESTAMP(taggings.created_at) AS created_at,
  TIMESTAMP(taggings.updated_at) AS updated_at,
  TIMESTAMP(taggings.deleted_at) AS deleted_at,
  c.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(taggings.record_insert_time)) AS record_insert_time,
  CAST(taggings.yr AS STRING) yr,
  CAST(taggings.month AS STRING) month,
  taggings.day,
  CAST(taggings.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('taggings')}}
INNER JOIN
  {{get_master_db('tags')}}
ON
  tags.id = taggings.tag_id
INNER JOIN
  {{ref('cards_dim_m_v')}} c
ON
  c.id = taggings.taggable_id
WHERE
  taggings.taggable_type = 'Card'
  AND c.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and taggings.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
