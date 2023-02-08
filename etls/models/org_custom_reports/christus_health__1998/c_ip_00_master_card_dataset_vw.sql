-- C-OP-00 [MASTER] CARD DATASET
-- c_ip_00_master_card_dataset_vw
-- is_card_promoted, is_live_stream, is_user_generated, content_status are NULL

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp', 'granularity':'month'},
    cluster_by = ['card_state'],
    tags=['incremental']
  )
}}

SELECT card_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, is_public, content_structure, 
card_author_id, card_author_full_name, Duration_seconds, Duration_HHMM, standard_card_type, activity_type, published_at, created_at, 
updated_at, card_level, average_rating, tags, Duration_Hours, Duration_Minutes, Genesis_card_link, clickable_genesis_url, in_channel, 
in_journey, in_pathway, views_unique, views_all, completions, clicked_link, shared_to_person, shared_to_group, comments, likes, bookmarks, 
badges_earned, unique_views_category, all_views_category, current_timestamp() as etl_record_created_time
FROM 
(
  SELECT * FROM 
  (
    SELECT
      `Duration_Minutes`/60 AS Duration_Hours,
      `Duration_seconds`/60 AS Duration_Minutes,
      CONCAT('https://christushealth.edcast.com/insights/ECL-',`ecl_id`) AS Genesis_card_link,
      CONCAT('<a href="', `Genesis_card_link`, '" target="_blank">', `Genesis_card_link`, '</a>') AS clickable_genesis_url,
      CASE
        WHEN `activity_type`='course' THEN `card_subtype`
        WHEN `activity_type`= 'media' THEN `card_subtype`
        WHEN `activity_type`= 'training' THEN `card_subtype`
      ELSE
      `activity_type`
    END AS activity_type, card_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, is_public,
    content_structure, card_author_id, card_author_full_name, Duration_seconds, Duration_HHMM, standard_card_type, published_at, created_at,
    updated_at, card_level, average_rating, tags
    FROM 
    (
      SELECT Duration_Hours, Duration_Minutes, Genesis_card_link, card_type AS activity_type, card_id, card_resource_url, card_state, 
      card_subtype, card_title, card_type, ecl_id, ecl_source_name, is_public, content_structure, card_author_id, card_author_full_name,
      Duration_seconds, Duration_HHMM, standard_card_type, published_at, created_at, updated_at, card_level, average_rating, tags
      FROM 
      (
        SELECT 0 AS Duration_Hours, 0 AS Duration_Minutes, 'No_link' AS Genesis_card_link, 'link' AS activity_type, card_id, 
        card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, is_public, content_structure, 
        card_author_id, card_author_full_name, Duration_seconds, Duration_HHMM, standard_card_type, published_at, created_at, updated_at, 
        card_level, average_rating, tags
        FROM 
        (
          SELECT card_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id,
            REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(ecl_source_name, 'User Generated Content', 
            'CHRISTUS Curator Content'), 'Christus Documents', 'CHRISTUS Inkling'), 'Christus Health', 'CHRISTUS Xyleme'), 
            'Christus Videos', 'CHRISTUS Panopta'), 'Sociative', 'EdCast Curated Articles'), 'Xyleme Published Content','CHRISTUS Xyleme'),
            'Null','Source Missing or Corrupted'), 'Inkling', 'CHRISTUS Inkling') AS ecl_source_name, is_public, content_structure, card_author_id, 
            card_author_full_name, Duration_seconds, Duration_HHMM, standard_card_type, published_at, created_at, updated_at, card_level, 
            average_rating, tags
          FROM 
          (
            SELECT DISTINCT card_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, 
            REPLACE(REPLACE(is_public, 'true', 'Public'), 'false', 'Private')AS is_public, content_structure, card_author_id, 
            card_author_full_name, Duration_seconds, Duration_HHMM, standard_card_type, published_at, created_at, updated_at, card_level, 
            average_rating, tags
            FROM 
            (
              SELECT card_id, card_resource_url, card_state, card_subtype, card_title, card_type, ecl_id, ecl_source_name, 
              CAST(is_public AS STRING) AS is_public, content_structure, current_content_owner_id AS card_author_id, card_author_full_name, 
              Duration_seconds, Duration_HHMM, standard_card_type, published_at, created_at, updated_at, card_level, average_rating,tags
              FROM
                {{ref('c1_content_latest_metadata_vw')}})))))) AS c1
  LEFT OUTER JOIN (
    SELECT card_id AS activity_counts_card_id, in_channel, in_pathway, in_journey, views_unique, views_all, completions, clicked_link, 
    shared_to_person, shared_to_group, comments, likes, bookmarks, badges_earned, unique_views_category, all_views_category
    FROM
      {{ref('c_ip_40_feeder_card_tags_activity_counts_part2_vw')}}) AS feeder
  ON
    c1.card_id = feeder.activity_counts_card_id)