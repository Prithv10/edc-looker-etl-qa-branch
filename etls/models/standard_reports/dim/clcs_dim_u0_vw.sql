-- clcs_dim_u0_vw

SELECT
  id, entity_id, entity_type, from_date, to_date, target_score, target_steps, deleted_at, created_at, updated_at, name, status,
  org_id_s, record_insert_time
FROM (
  SELECT
    *,
    RANK() OVER(PARTITION BY id ORDER BY record_insert_time DESC) AS rank
  FROM
    {{ref('clcs_dim_m_v')}} QUALIFY rank = 1 )