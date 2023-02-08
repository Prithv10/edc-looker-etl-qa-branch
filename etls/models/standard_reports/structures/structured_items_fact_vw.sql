-- structured_items_fact_vw
SELECT
  structure_id, entity_id, entity_type, enabled, created_at, position, org_id_s, record_insert_time
FROM (
  SELECT
    *,
    RANK() OVER(PARTITION BY structure_id,entity_id ORDER BY record_insert_time DESC) AS rank
  FROM
    {{ref('structured_items_fact_m_v')}} QUALIFY rank = 1
)