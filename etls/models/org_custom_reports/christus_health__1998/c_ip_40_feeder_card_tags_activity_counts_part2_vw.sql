-- C-OP-40 [FEEDER] CARD + TAGS + ACTIVITY COUNTS
-- c_ip_40_feeder_card_tags_activity_counts_part2_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT *, current_timestamp() as etl_record_created_time FROM 
(
  SELECT card_id, card_title, event, time, comment_message, views_unique, views_all, completions, clicked_link, shared_to_person, 
  shared_to_group, comments, Likes, Bookmarks, Badges_Earned,
    CASE
      WHEN (`views_unique`>= 1000)THEN 'Very High >1000'
      WHEN (`views_unique`>= 100
      AND `views_unique`< 1000) THEN 'High 100-1000'
      WHEN (`views_unique`>= 50 AND `views_unique`< 100) THEN 'Medium 50-100'
      WHEN (`views_unique`>= 5
      AND `views_unique`< 50) THEN 'Low 5-50'
      WHEN (`views_unique`< 5) THEN 'Very Low <5'
    ELSE 'No Views'
  END AS unique_views_category,
    CASE
      WHEN (`views_all`>= 1000)THEN 'Very High >1000'
      WHEN (`views_all`>= 500
      AND `views_all`< 1000) THEN 'High 500-1000'
      WHEN (`views_all`>= 50 AND `views_all`< 500) THEN 'Medium 50-500'
      WHEN (`views_all`>= 10
      AND `views_all`< 50) THEN 'Low 10-50'
      WHEN (`views_all`< 10) THEN 'Very Low <10'
    ELSE 'No Views'
  END AS all_views_category FROM 
  (
    SELECT card_id, card_title, event, time, comment_message, total_unique_card_views AS views_unique, total_views AS views_all, 
    total_completions AS completions, total_content_source_visits AS clicked_link, total_shares_to_direct_users AS shared_to_person, 
    total_shares_to_groups AS shared_to_group, total_comments AS comments, current_likes AS Likes, current_bookmarks AS Bookmarks, 
    total_badges_earned AS Badges_Earned, "No_Views" AS unique_views_category, "No_Views" AS all_views_category FROM 
    (
      SELECT * FROM 
      (
        SELECT * FROM 
        (
          SELECT event_count, card_id, card_title, event, performance_metric, time, comment_message FROM 
          (
            SELECT COUNT(Time) AS event_count, card_id, card_title, event, performance_metric, time, 
            LOWER(comment_message) AS comment_message FROM 
            (
              SELECT * FROM
                {{ref('c_ip_40_feeder_card_tags_activity_counts_part1_vw')}} )
            GROUP BY card_id, performance_metric, card_title, event, performance_metric, time, comment_message))
             
            PIVOT(SUM(event_count) FOR performance_metric IN ("total_unique_card_views", "total_views", "total_completions", 
            "total_content_source_visits", "total_shares_to_direct_users", "total_shares_to_groups", "total_comments", 
            "current_likes", "current_bookmarks", "total_badges_earned"))))))AS u2
 
  LEFT OUTER JOIN 
  (
    SELECT
      REPLACE(REPLACE(journey_content, 'False', 'N'), 'True', 'Y')AS in_journey,
      REPLACE(REPLACE(pathway_content, 'False', 'N'), 'True', 'Y')AS in_pathway,
      REPLACE(REPLACE(channel_content, 'False', 'N'), 'True', 'Y')AS in_channel,
      tags, metadata_card_id FROM 
      (
      SELECT DISTINCT tags, journey_content, pathway_content, channel_content, card_id AS metadata_card_id FROM
        {{ref('c2_content_structure_metadata_vw')}}
      WHERE
        card_type NOT IN ("journey pathway container"))) AS c2
  ON
    u2.card_id = c2.metadata_card_id
