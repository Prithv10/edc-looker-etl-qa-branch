-- cards_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  answers_count,
  author_first_name,
  author_id,
  author_last_name,
  author_picture_url,
  authoritative_all_time_views_count,
  bookmarks_count,
  card_subtype,
  CASE
    WHEN card_type IS NULL OR card_type = '' THEN ''
    WHEN card_type='pack' THEN 'Pathway'
    WHEN card_type='video_stream' THEN 'Video Stream'
  ELSE
  INITCAP(card_type)
END
  AS card_type,
  cards_config_id,
  client_id,
  client_item_id,
  comments_count,
  TIMESTAMP(cards.created_at) AS created_at,
  TIMESTAMP(cards.deleted_at) AS deleted_at,
  TRIM(
    CASE
      WHEN duration < 60 THEN 'less than a minute'
    ELSE
    CONCAT(
    IF
      ((EXTRACT(year
          FROM
            DATE(TIMESTAMP_SECONDS(duration))) - 1970) != 0, CONCAT(EXTRACT(year
          FROM
            DATE(TIMESTAMP_SECONDS(duration))) - 1970, ' year(s)'), ''),
    IF
      (MOD(CAST(FLOOR(UNIX_DATE(DATE(TIMESTAMP_SECONDS(duration))) / 30) AS INT64), 12) != 0, CONCAT(MOD(CAST(FLOOR(UNIX_DATE(DATE(TIMESTAMP_SECONDS(duration))) / 30) AS INT64), 12), ' Month(s)'), ''),
    IF
      (CAST(FLOOR(MOD(UNIX_DATE(DATE(TIMESTAMP_SECONDS(duration))), 30) / 7) AS INT64) != 0, CONCAT(CAST(FLOOR(MOD(UNIX_DATE(DATE(TIMESTAMP_SECONDS(duration))), 30) / 7) AS INT64), ' Week(s)'), ''),
    IF
      (MOD(MOD(UNIX_DATE(DATE(TIMESTAMP_SECONDS(duration))), 30), 7) != 0, CONCAT(MOD(MOD(UNIX_DATE(DATE(TIMESTAMP_SECONDS(duration))), 30), 7), ' Day(s)'), ''),
    IF
      (EXTRACT(hour
        FROM
          TIME(TIMESTAMP_SECONDS(duration))) != 0, CONCAT(EXTRACT(hour
          FROM
            TIME(TIMESTAMP_SECONDS(duration))), ' Hour(s)'), ''),
    IF
      (EXTRACT(minute
        FROM
          TIME(TIMESTAMP_SECONDS(duration))) != 0, CONCAT(EXTRACT(minute
          FROM
            TIME(TIMESTAMP_SECONDS(duration))), ' minute(s)'), ''),
    IF
      (EXTRACT(second
        FROM
          TIME(TIMESTAMP_SECONDS(duration))) != 0, CONCAT(EXTRACT(second
          FROM
            TIME(TIMESTAMP_SECONDS(duration))), ' second(s)'), '') )
  END
    ) AS duration,
  ecl_id,
  ecl_metadata,
  card_metadata.unique_code AS unique_code,
  CASE
    WHEN source_id IS NULL THEN JSON_VALUE(ecl_metadata, '$.source_id')
  ELSE
  source_id
END
  AS source_id,
  CASE
    WHEN external_id IS NULL THEN JSON_VALUE(ecl_metadata, '$.external_id')
  ELSE
  external_id
END
  AS external_id,
  card_metadata.plan AS plan,
  CAST(card_metadata.average_rating AS FLOAT64) AS average_rating,
  card_metadata.content_platform AS content_platform,
  JSON_VALUE(ecl_metadata, '$.source_display_name') AS source_display_name,
  JSON_VALUE(ecl_metadata, '$.source_type_name') AS source_type_name,
  JSON_VALUE(ecl_metadata, '$.source_logo_url') AS source_logo_url,
  CAST(JSON_VALUE(ecl_metadata, '$.promotion') AS BOOLEAN) AS promotion,
  CAST(JSON_VALUE(ecl_metadata, '$.discount') AS BOOLEAN) AS discount,
  CAST(JSON_VALUE(ecl_metadata, '$.allow_enrollment') AS BOOLEAN) AS allow_enrollment,
  SUBSTR(card_metadata.custom_data, 1, 4000) AS custom_data,
  CASE
    WHEN ecl_source_name IS NULL OR ecl_source_name = '' THEN ''
    WHEN ecl_source_name='UGC' THEN 'User Generated Content'
  ELSE
  INITCAP(ecl_source_name)
END
  AS ecl_source_name,
  expansions_count,
  features,
  filestack,
  group_id,
  cards.id,
  impressions_count,
  LANGUAGE,
  INITCAP(level) AS card_level,
  SUBSTR(CONCAT(UPPER(SUBSTRING(message,1,1)),LOWER(SUBSTRING(message,2))), 1, 4000) AS message,
  order_index,
  organization_id AS org_id_s,
  duration AS original_duration,
  outbounds_count,
  plays_count,
  TIMESTAMP(cards.promoted_at) AS promoted_at,
  provider,
  provider_image,
  TIMESTAMP(cards.published_at) AS published_at,
  readable_card_type,
  resource_id,
  shares_count,
  slug,
  standard_type,
  INITCAP(state) AS state,
  super_card_id,
  taxonomy_topics,
  SUBSTR(CONCAT(UPPER(SUBSTRING(COALESCE(NULLIF(title, ''), message), 1, 1)),LOWER(SUBSTRING(COALESCE(NULLIF(title, ''), message), 2))), 1, 4000) AS title,
  TIMESTAMP(cards.updated_at) AS updated_at,
  user_taxonomy_topics,
  votes_count,
  CAST(is_public AS bool) is_public,
  CAST(is_manual AS bool) is_manual,
  CAST(hidden AS bool) hidden,
  CAST(is_official AS bool) is_official,
  CAST(can_be_reanswered AS bool) can_be_reanswered,
  CAST(auto_complete AS bool) auto_complete,
  CAST(is_paid AS bool) is_paid,
  CAST(is_taxonomy_generated AS bool) is_taxonomy_generated,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(cards.record_insert_time)) AS record_insert_time,
  CAST(cards.yr AS STRING) yr,
  CAST(cards.month AS STRING) month,
  cards.day day,
  CAST(cards.hour AS STRING) hour,
  organization_id,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('cards')}} cards
LEFT JOIN
  {{get_master_db('card_metadata')}} card_metadata

ON
  cards.id=card_metadata.card_id
WHERE
  organization_id = {{var("var_cust_id")}}

{% if is_incremental() %}
    and cards.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
