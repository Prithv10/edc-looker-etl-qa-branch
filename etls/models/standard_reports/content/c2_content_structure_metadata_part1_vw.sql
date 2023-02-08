-- c2_content_structure_metadata_part1_vw


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

WITH cardpack
AS (
  SELECT pathway_id
    ,card_id
    ,card_type
    ,pathway_state
    ,pathway_title
    ,card_title
    ,org_id_s
  FROM {{ ref('card_pack_relation_dim_0_vw') }}
  )
  ,journeypack
AS (
  SELECT journey_id
    ,card_id
    ,card_type
    ,journey_state
    ,journey_title
    ,card_title
    ,org_id_s
  FROM {{ ref('journey_pack_relations_0_vw') }}
  )
  ,channelcards
AS (
  SELECT card_id
    ,channel_id
    ,channel_name
    ,card_type
    ,card_state
    ,card_title
    ,org_id_s
  FROM {{ ref('m0_channel_cards_dim_vw') }}
  )
  ,structures
AS (
  SELECT *
  FROM {{ ref('s0_structures_vw') }}
  )
  ,badgings
AS (
  SELECT badgeable_card_id
    ,badge_title
  FROM {{ ref('badgings_dim_0_vw') }}
  )
  ,joindata
AS (
  -- joindata channelcards & Structures join
  SELECT card_id
    ,A.channel_id
    ,channel_name
    ,CASE
      WHEN structure_name IS NULL
        THEN 'Channels'
      ELSE structure_name
      END AS carousel_name
    ,structured_item_position channel_position
    ,is_structure_enabled is_carousel_enabled
    ,card_title
    ,card_state
    ,card_type
  FROM channelcards A
  LEFT OUTER JOIN structures B ON A.channel_id = B.structured_item_id
  )
  ,joindata1
AS (
  -- joindata1 cardpack & journeypack join
  SELECT journey_id
    ,journey_title
    ,pathway_id journey_pathway_id
    ,pathway_title journey_pathway_title
    ,B.card_id
    ,B.card_title card_title
    ,B.card_type card_type
    ,pathway_state
    ,journey_state
  FROM journeypack A
  LEFT JOIN cardpack B ON A.card_id = B.pathway_id
  )
  ,joindata2
AS (
  -- joindata2 channelcards & cardpack join
  SELECT pathway_id
    ,A.card_id
    ,A.card_type
    ,pathway_state
    ,A.card_title
    ,pathway_title
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,'Pathway' AS Overall_Content_Structure
    ,pathway_id AS Overall_Content_Structure_id
  FROM cardpack A
  LEFT OUTER JOIN joindata B ON A.pathway_id = B.card_id
  )
  ,joindata3
AS (
  -- joindata3 journey&cardpackjoin(joindata1) & channelcards join
  SELECT channel_id
    ,channel_name
    ,journey_id
    ,journey_title
    ,journey_pathway_id
    ,journey_pathway_title
    ,A.card_id
    ,A.card_title
    ,A.card_type
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,pathway_state
    ,journey_state
    ,'Journey' AS Overall_Content_Structure
    ,journey_id AS Overall_Content_Structure_id
  FROM joindata1 A
  LEFT OUTER JOIN joindata B ON A.journey_id = B.card_id
  )
  ,joindata4
AS (
  --joindata4 joindata(channels&structures join) & cardpack join
  SELECT A.card_id
    ,channel_id
    ,channel_name
    ,A.carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,A.card_title
    ,A.card_type
    ,A.card_state
  FROM joindata A
  LEFT OUTER JOIN cardpack B ON A.card_id = B.pathway_id
  WHERE B.card_id IS NULL
  )
  ,joindata5
AS (
  -- joindata5 is join of non-pathwaychannelcards (joindata4) and joindata1(cardpack&journeypackjoin)
  SELECT A.card_id
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,A.card_type
    ,A.card_title
    ,journey_id
    ,journey_title
    ,journey_pathway_id
    ,journey_pathway_title
    ,A.card_state
    ,'SmartCard' AS Overall_Content_Structure
    ,A.card_id AS Overall_Content_Structure_id
  FROM joindata4 A
  LEFT OUTER JOIN joindata1 B ON A.card_id = B.journey_id
  WHERE B.card_id IS NULL
  )
  ,appendrows
AS (
  SELECT Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,card_id
    ,card_title
    ,card_type
    ,carousel_name
    ,channel_id
    ,channel_name
    ,channel_position
    ,is_carousel_enabled
    ,NULL AS journey_id
    ,NULL AS journey_pathway_id
    ,NULL AS journey_pathway_title
    ,NULL AS journey_state
    ,NULL AS journey_title
    ,pathway_id
    ,pathway_state
    ,pathway_title
    ,NULL AS card_state
  FROM joindata2

  UNION ALL

  SELECT Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,card_id
    ,card_title
    ,card_type
    ,carousel_name
    ,channel_id
    ,channel_name
    ,channel_position
    ,is_carousel_enabled
    ,journey_id
    ,journey_pathway_id
    ,journey_pathway_title
    ,journey_state
    ,journey_title
    ,NULL AS pathway_id
    ,pathway_state
    ,NULL AS pathway_title
    ,NULL AS card_state
  FROM joindata3

  UNION ALL

  SELECT Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,card_id
    ,card_title
    ,card_type
    ,carousel_name
    ,channel_id
    ,channel_name
    ,channel_position
    ,is_carousel_enabled
    ,journey_id
    ,journey_pathway_id
    ,journey_pathway_title
    ,NULL AS journey_state
    ,journey_title
    ,NULL AS pathway_id
    ,NULL AS pathway_state
    ,NULL AS pathway_title
    ,card_state
  FROM joindata5
  )
SELECT DISTINCT *
  ,current_timestamp() AS etl_record_created_time
FROM appendrows