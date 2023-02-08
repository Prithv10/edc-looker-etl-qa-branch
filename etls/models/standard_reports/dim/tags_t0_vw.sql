-- tags_t0_vw

select tag_id, tag_name, card_id, org_id_s from (
SELECT
  tag_id, name as tag_name, taggable_id as card_id,
  org_id_s, count(*) as occurences
FROM (
  SELECT
    *,
    RANK() OVER(PARTITION BY id, tag_id, name, taggable_id ORDER BY updated_at DESC) AS rank
  FROM
    {{ref('taggings_dim_m_v')}} QUALIFY rank = 1 and deleted_at is null) A group by tag_id, tag_name, card_id, org_id_s
) Z