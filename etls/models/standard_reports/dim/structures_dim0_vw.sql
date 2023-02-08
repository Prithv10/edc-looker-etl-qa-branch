-- structures_dim0_vw

SELECT
  id, creator_id, parent_id, parent_type, display_name, context, slug, enabled, created_at, org_id_s
FROM (
  SELECT
    *,
    RANK() OVER(PARTITION BY id ORDER BY record_insert_time DESC) AS rank
  FROM
    {{ref('structures_dim_m_v')}} QUALIFY rank = 1
)