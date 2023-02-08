-- 1454_Glue_Journey_pack_relations[0]
-- journey_pack_relations_0_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'card_id', 'data_type': 'int64', 'range': {
            'end': 100,
            'interval': 10,
            'start': 0
        }
        },
    cluster_by = ["card_id","journey_id"],
    tags=['incremental']
  )
}}

Select 
  jp.journey_id,
  jp.card_id,
  jp.card_type,
  jp.card_state,
  jp.journey_state,
  jp.journey_title,
  jp.card_title,
  jp.org_id_s
FROM
(
  Select
    jp.journey_id,
    jp.card_id,
    jp.card_type,
    jp.card_state,
    c1.card_state as journey_state,
    c1.card_title as journey_title,
    c.card_title,
    record_insert_time,
    jp.org_id_s,
    Rank() Over(Partition by jp.journey_id,jp.card_id Order By record_insert_time Desc) as RNK
  FROM
    {{ref('journey_pack_relations_dim_m_v')}} jp
  JOIN {{ ref('c1_content_latest_metadata_vw') }} c
  on jp.card_id = c.card_id
  JOIN {{ ref('c1_content_latest_metadata_vw') }} c1 
  on jp.journey_id = c1.card_id
  Qualify RNK = 1)jp
Left Outer JOIN
(
  SELECT
    *,
    Rank() Over(Partition By card_id,journey_id order by Time Desc) as RNK
  FROM
  (
    Select
      card_id,
      cast(journey_id as integer) journey_id,
      event,
      Time,
      org_id_s
    FROM
      {{ ref('u0_usercards_event_vw') }}
    where
      event in ('card_added_to_journey','card_removed_from_journey'))
      Qualify RNK = 1 and event = 'card_removed_from_journey'
  )uc
on jp.card_id = uc.card_id
and jp.journey_id = uc.journey_id
and jp.org_id_s = uc.org_id_s
where 
  uc.card_id is null and uc.journey_id is null


