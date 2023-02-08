-- c2_content_structure_metadata_vw
-- c2_content_structure_metadata_part2_vw

-- Srini: card_resource_url still needs to be added from c1 latest metadata -- will take it up once we have resources table available

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

  WITH appendrows1
AS (
  SELECT COALESCE(card_type, '') AS card_type
    ,
    -- cast(coalesce(cast(journey_pathway_id as string),'') as int) as
    journey_pathway_id
    ,
    -- cast(COALESCE(cast(pathway_id as string), '') as int) as
    pathway_id
    ,
    -- cast(COALESCE(cast(journey_id as string), '') as int) as
    journey_id
    ,pathway_state
    ,card_title
    ,pathway_title
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,journey_title
    ,journey_pathway_title
    ,journey_state
    ,card_id
    ,card_state
  FROM {{ ref('c2_content_structure_metadata_part1_vw') }}
  WHERE CAST(card_id AS string) IS NOT NULL
    AND COALESCE(CAST(journey_pathway_id AS string), '') != COALESCE(CAST(card_id AS string), '')
    AND COALESCE(CAST(pathway_id AS string), '') != COALESCE(CAST(card_id AS string), '')
    AND COALESCE(CAST(journey_id AS string), '') != COALESCE(CAST(card_id AS string), '')
    AND card_type NOT IN (
      'pack'
      ,'journey'
      )

  UNION ALL

  SELECT CASE
      WHEN card_type LIKE '%journey%'
        THEN 'pathway journey container'
      END AS card_type
    ,journey_pathway_id
    ,pathway_id
    ,journey_id
    ,pathway_state
    ,card_title
    ,pathway_title
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,journey_title
    ,journey_pathway_title
    ,journey_state
    ,card_id
    ,card_state
  FROM {{ ref('c2_content_structure_metadata_part1_vw') }}
  WHERE card_id IS NOT NULL
    AND journey_id IS NULL
    AND journey_pathway_id IS NULL
    AND Overall_Content_Structure = 'Pathway'
    AND card_type = 'journey'

  UNION ALL

  SELECT 'journey container' AS card_type
    ,journey_pathway_id
    ,pathway_id
    ,journey_id
    ,pathway_state
    ,journey_title AS card_title
    ,pathway_title
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,journey_title
    ,journey_pathway_title
    ,journey_state
    ,journey_id AS card_id
    ,card_state
  FROM {{ ref('c2_content_structure_metadata_part1_vw') }}
  WHERE card_id IS NULL
    AND journey_id IS NOT NULL
    AND pathway_id IS NULL
    AND journey_pathway_id IS NULL

  UNION ALL

  SELECT CASE
      WHEN card_type LIKE '%pack%'
        THEN 'journey pathway container'
      END AS card_type
    ,journey_pathway_id
    ,pathway_id
    ,journey_id
    ,pathway_state
    ,journey_pathway_title AS card_title
    ,pathway_title
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,journey_title
    ,journey_pathway_title
    ,journey_state
    ,card_id
    ,card_state
  FROM {{ ref('c2_content_structure_metadata_part1_vw') }}
  WHERE card_id IS NOT NULL
    AND journey_pathway_id = card_id
    AND pathway_id IS NULL

  UNION ALL

  SELECT CASE
      WHEN card_type LIKE '%pack%'
        THEN 'pathway container'
      END AS card_type
    ,journey_pathway_id
    ,pathway_id
    ,journey_id
    ,pathway_state
    ,pathway_title AS card_title
    ,pathway_title
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,journey_title
    ,journey_pathway_title
    ,journey_state
    ,card_id
    ,card_state
  FROM {{ ref('c2_content_structure_metadata_part1_vw') }}
  WHERE card_id IS NOT NULL
    AND pathway_id = card_id
    AND journey_id IS NULL
    AND journey_pathway_id IS NULL
    AND pathway_id IS NOT NULL
    AND card_type = 'pack'
  )
  ,c2firsthalf
AS (
  SELECT pathway_id
    ,card_id
    ,card_type
    ,pathway_state
    ,card_title
    ,pathway_title
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,journey_id
    ,journey_title
    ,journey_pathway_id
    ,journey_pathway_title
    ,journey_state
    ,card_state
    ,B.badge_title AS pathway_badge_title
    ,C.badge_title AS journey_badge_title
    ,D.badge_title AS journey_pathway_badge_title
    ,CASE
      WHEN (
          B.badge_title IS NULL
          AND c.badge_title IS NULL
          AND D.badge_title IS NULL
          )
        THEN 'False'
      WHEN (
          B.badge_title IS NOT NULL
          OR C.badge_title IS NOT NULL
          OR D.badge_title IS NOT NULL
          )
        THEN 'True'
      END AS badge_content
    ,CASE
      WHEN channel_id IS NULL
        THEN 'False'
      ELSE 'True'
      END AS channel_content
    ,CASE
      WHEN journey_id IS NULL
        THEN 'False'
      ELSE 'True'
      END AS journey_content
    ,CASE
      WHEN pathway_id IS NULL
        THEN 'False'
      ELSE 'True'
      END AS pathway_content
    ,CASE
      WHEN journey_pathway_id IS NULL
        THEN 'False'
      ELSE 'True'
      END AS journey_pathway_content
    ,CASE
      WHEN carousel_name IS NULL
        THEN 'False'
      ELSE 'True'
      END AS carousel_content
  FROM appendrows1 A
  LEFT JOIN {{ ref('badgings_dim_0_vw') }} B ON A.pathway_id = B.badgeable_card_id
  LEFT JOIN {{ ref('badgings_dim_0_vw') }} C ON A.journey_id = C.badgeable_card_id
  LEFT JOIN {{ ref('badgings_dim_0_vw') }} D ON A.journey_pathway_id = D.badgeable_card_id
  )
  ,joindata10
AS (
  SELECT A.pathway_id
    ,A.card_id
    ,A.card_type
    ,A.pathway_state
    ,A.card_title
    ,A.pathway_title
    ,A.channel_id
    ,A.channel_name
    ,A.carousel_name
    ,A.channel_position
    ,A.is_carousel_enabled
    ,A.Overall_Content_Structure
    ,A.Overall_Content_Structure_id
    ,A.journey_id
    ,A.journey_title
    ,A.journey_pathway_id
    ,A.journey_pathway_title
    ,A.journey_state
    ,A.pathway_badge_title
    ,A.journey_badge_title
    ,A.journey_pathway_badge_title
    ,A.badge_content
    ,A.channel_content
    ,A.journey_content
    ,A.pathway_content
    ,A.journey_pathway_content
    ,A.carousel_content
    ,B.author_id AS card_author_id
    ,B.card_author_full_name
    ,NULL AS card_resource_url
    ,card_subtype
    ,ecl_id
    ,ecl_source_name
    ,is_public
    ,Duration_HHMM
    ,B.standard_card_type
    ,B.card_level
    ,B.average_rating
    ,current_content_owner_full_name
    ,B.card_state
    ,B.Duration_seconds
  FROM c2firsthalf A
  LEFT OUTER JOIN {{ ref('c1_content_latest_metadata_vw') }} B ON A.card_id = B.card_id
  WHERE B.card_title IS NULL

  UNION ALL

  SELECT A.pathway_id
    ,A.card_id
    ,A.card_type
    ,A.pathway_state
    ,B.card_title AS card_title
    ,A.pathway_title
    ,A.channel_id
    ,A.channel_name
    ,A.carousel_name
    ,A.channel_position
    ,A.is_carousel_enabled
    ,A.Overall_Content_Structure
    ,A.Overall_Content_Structure_id
    ,A.journey_id
    ,A.journey_title
    ,A.journey_pathway_id
    ,A.journey_pathway_title
    ,A.journey_state
    ,A.pathway_badge_title
    ,A.journey_badge_title
    ,A.journey_pathway_badge_title
    ,A.badge_content
    ,A.channel_content
    ,A.journey_content
    ,A.pathway_content
    ,A.journey_pathway_content
    ,A.carousel_content
    ,B.author_id AS card_author_id
    ,B.card_author_full_name
    ,B.card_resource_url
    ,B.card_subtype
    ,B.ecl_id
    ,B.ecl_source_name
    ,B.is_public
    ,B.Duration_HHMM
    ,B.standard_card_type
    ,B.card_level
    ,B.average_rating
    ,current_content_owner_full_name
    ,B.card_state
    ,B.Duration_seconds
  FROM c2firsthalf A
  LEFT OUTER JOIN {{ ref('c1_content_latest_metadata_vw') }} B ON A.card_id = B.card_id
  WHERE B.card_title IS NOT NULL
  )
  ,pretotalchannelassociations
AS (
  SELECT A.*
    ,CASE
      WHEN B.Overall_Content_Structure_Title IS NULL
        THEN A.card_title
      ELSE B.Overall_Content_Structure_Title
      END AS Overall_Content_Structure_Title
    ,CASE
      WHEN B.Overall_Content_Structure_Status IS NULL
        THEN 'Active'
      ELSE B.Overall_Content_Structure_Status
      END AS Overall_Content_Structure_Status
  FROM joindata10 A
  LEFT OUTER JOIN (
    SELECT card_id
      ,card_title AS Overall_Content_Structure_Title
      ,card_state AS Overall_Content_Structure_Status
    FROM {{ ref('c1_content_latest_metadata_vw') }}
    ) B ON A.Overall_Content_Structure_id = B.card_id
  )
  ,joindata11
AS (
  SELECT A.*
    ,B.total_channel_associations
  FROM pretotalchannelassociations A
  LEFT OUTER JOIN (
    SELECT card_id
      ,card_title
      ,count(DISTINCT channel_id) AS total_channel_associations
    FROM (
      SELECT DISTINCT card_id,
      card_title,channel_id
      FROM pretotalchannelassociations
      WHERE channel_id IS NOT NULL
      AND card_id IS NOT NULL
      )
    GROUP BY card_id
    ,card_title
    ) B ON A.card_id = B.card_id
  )
  ,finalc2
AS (
  SELECT pathway_id
    ,card_id
    ,initcap(card_type) AS card_type
    ,CASE
      WHEN pathway_state IS NULL
        THEN 'N/A'
      ELSE pathway_state
      END AS pathway_state
    ,pathway_title
    ,channel_id
    ,channel_name
    ,carousel_name
    ,channel_position
    ,is_carousel_enabled
    ,Overall_Content_Structure
    ,Overall_Content_Structure_id
    ,journey_id
    ,journey_title
    ,journey_pathway_id
    ,journey_pathway_title
    ,CASE
      WHEN journey_state IS NULL
        THEN 'N/A'
      ELSE journey_state
      END AS journey_state
    ,CASE
      WHEN card_state IS NULL
        THEN 'N/A'
      ELSE card_state
      END AS card_state
    ,pathway_badge_title
    ,journey_badge_title
    ,journey_pathway_badge_title
    ,badge_content
    ,channel_content
    ,journey_content
    ,pathway_content
    ,journey_pathway_content
    ,carousel_content
    ,card_author_id
    ,card_author_full_name
    ,card_title
    ,card_resource_url
    ,card_subtype
    ,ecl_id
    ,ecl_source_name
    ,is_public
    ,duration_hhmm
    ,duration_seconds
    ,Overall_Content_Structure_Title
    ,Overall_Content_Structure_Status
    ,total_channel_associations
    ,standard_card_type
    ,card_level
    ,average_rating
    ,current_content_owner_full_name
    ,current_timestamp() AS etl_record_created_time
  FROM joindata11
  )
SELECT *
  ,CASE
    WHEN (
        total_channel_associations IS NULL
        OR total_channel_associations = 0
        )
      THEN 'No Associated Channels'
    WHEN total_channel_associations = 1
      THEN 'Exclusive Channel Content'
    WHEN total_channel_associations > 1
      THEN 'Associated with Multiple Channels'
    END AS channel_content_exclusivity
FROM finalc2