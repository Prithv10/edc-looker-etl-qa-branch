-- structured_items_fact_m


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}


SELECT
  structured_items.id,
  structure_id,
  entity_id,
  entity_type,
  CAST(structured_items.enabled AS bool) enabled,
  TIMESTAMP(structured_items.created_at) AS created_at,
  TIMESTAMP(structured_items.updated_at) AS updated_at,
  position,
  organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(structured_items.record_insert_time)) AS record_insert_time,
  CAST(structured_items.yr AS STRING) yr,
  CAST(structured_items.month AS STRING) month,
  structured_items.day,
  CAST(structured_items.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('structured_items')}} structured_items
LEFT JOIN
     {{ref('structures_dim_m_v')}} structures
ON
  structured_items.structure_id = structures.id
WHERE
  structures.organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and structured_items.day>= (SELECT max(day) FROM {{ this }})
{% endif %}
