  -- 1454_Glue_Card_Pack_Relation_Dim[0]
  -- card_pack_relation_dim_0_vw
 

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

Select
  cp.pathway_id,
  cp.card_id,
  cp.card_title,
  cp.pathway_title,
  cp.card_type,
  cp.card_state,
  cp.pathway_state,
  cp.org_id_s,
  current_timestamp() AS etl_record_created_time
FROM
(
    Select
      cp.pathway_id,
      cp.card_id,
      c.card_title,
      c1.card_title as pathway_title,
      c.card_type,
      c.card_state,
      c1.card_state as pathway_state,
      record_insert_time,
      cp.org_id_s,
      Rank() Over (Partition By cp.card_id,cp.pathway_id order by record_insert_time desc) as RNK
    from
      {{ref('card_pack_relations_dim_m_v')}} cp
    JOIN {{ ref('c1_content_latest_metadata_vw') }} c
    on cp.card_id = c.card_id
    JOIN {{ ref('c1_content_latest_metadata_vw') }} c1
    on cp.pathway_id = c1.card_id
    Qualify RNK = 1)cp
Left Outer JOIN
(
  SELECT
    *,
    Rank() Over(Partition By card_id,pathway_id order by Time Desc) as RNK
  FROM
  (
    Select
      card_id,
      cast(pathway_id as integer) pathway_id,
      event,
      Time,
      org_id_s
    FROM
      {{ ref('u0_usercards_event_vw') }}
    where
      event in ('card_added_to_pathway','card_removed_from_pathway'))
      Qualify RNK = 1 and event = 'card_removed_from_pathway'
  )uc
  on cp.card_id = uc.card_id
and cp.pathway_id = uc.pathway_id
and cp.org_id_s = uc.org_id_s
where 
  uc.card_id is null and uc.pathway_id is null