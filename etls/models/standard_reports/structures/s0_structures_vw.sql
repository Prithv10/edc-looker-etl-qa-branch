-- s0_structures_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'structure_id', 'data_type': 'int64', 'range': {
            'end': 100,
            'interval': 10,
            'start': 0
        }
        },
    cluster_by = ["structure_id","structure_parent_id"],
    tags=['incremental']
  )
}}
SELECT
  *
FROM (
  SELECT
    parent_id structure_parent_id,
    parent_type structure_parent_type,
    display_name structure_name,
    A.enabled is_structure_enabled,
    entity_id structured_item_id,
    entity_type structured_item_type,
    position structured_item_position,
    structure_id
  FROM
    {{ ref('structures_dim0_vw') }} A
  JOIN
    {{ ref('structured_items_fact_vw') }} B
  ON
    A.id=B.structure_id ) Z
LEFT OUTER JOIN (
  SELECT
    channel_id,
    channel_carousel_id,
    org_id_s,
    RANK() OVER(PARTITION BY channel_carousel_id, channel_id ORDER BY time DESC) AS rank
  FROM (
    SELECT
      channel_carousel_id,
      channel_id,
      record_insert_time,
      time,
      org_id_s,
      event
    FROM
      {{ ref('u0_usercards_event_vw') }}
    WHERE
      event IN ('channel_added_to_channel_carousel',
        'channel_removed_from_channel_carousel') ) QUALIFY rank = 1
    AND event='channel_removed_from_channel_carousel' ) Y
ON
  Z.structured_item_id = Y.channel_id
  AND Z.structure_id = Y.channel_carousel_id
WHERE
  Y.channel_id IS NULL
  AND Y.channel_carousel_id IS NULL