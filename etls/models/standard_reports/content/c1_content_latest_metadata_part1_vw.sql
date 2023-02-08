-- Content [C][1] [Latest Metadata]
-- c1_content_latest_metadata_part1_vw

{{
  config(
    materialized = 'incremental',
    partition_by = {'field': 'created_at', 'data_type': 'timestamp','granularity': 'month'},
    incremental_strategy = 'insert_overwrite',
    cluster_by = ["card_id"],
    tags=['incremental']
  )
}}

SELECT
  id AS card_id,
  author_id as current_content_owner_id, -- srini: renamed this from card_author_id to current_content_owner_id as this is from cards_dim and always currentid is captured here
  u.User_Full_Name as current_content_owner_full_name, -- Srini: same as current_content_owner_id
  case when status in ('draft','error','new','processing') then 'draft' else status End AS card_state,
  --case when `Status` in ('deleted','archived') then 'Deleted' else 'Active' END AS content_status, -- Srini: removed this column as this has the same data as card_state and will create confusion
  card_subtype,
  card_type,
  ecl_id,
  ecl_source_name,
  is_public,
  case when duration is null then 'Missing Card Duration' else regexp_replace(
    cast(time(ts) as string),
    r'^\d\d',
    cast(extract(hour from time(ts)) + 24 * unix_date(date(ts)) as string)
  ) End as Duration_HHMM, -- convert Duration to HH:MM:SS
  Duration,
  duration as Duration_seconds,
  published_at,
  case when (title is null or title = '') then message else title end as card_title,
  created_at,
  updated_at,
  case when card_level is null or card_level = '' then 'No Level' else card_level End as card_level,
  average_rating,
  standard_type as standard_card_type,
    -- card_resource_url,is_card_promoted,is_live_stream,current_content_owner_full_name
  NUll as card_resource_url, -- Need to get this value from resources table, currently not available in GCP
  --NULL AS is_card_promoted, --Srini: remove this field
  --NULL AS is_live_stream, --Srini: remove this field
  --Null AS is_user_generated, --Srini: remove this field
  case when card_type='pack' then 'Pathway' when card_type='journey' then 'Journey' else 'SmartCard' end AS content_structure, 
  org_id_s,
  b.card_author_id as author_id, -- this is the original author of a card
  u1.User_Full_Name as card_author_full_name, -- original author's full name
  current_timestamp() AS etl_record_created_time
FROM (-- --SELECT COLUMNS & RANK & WINDOW, FILTER ROWS 1
  SELECT
    id,
    cards_config_id,
    card_level,
    group_id,
    author_first_name,
    author_last_name,
    author_picture_url,
    super_card_id,
    author_id,
    created_at,
    updated_at,
    is_public,
    is_manual,
    features,
    client_id,
    client_item_id,
    comments_count,
    order_index,
    slug,
    impressions_count,
    outbounds_count,
    shares_count,
    answers_count,
    expansions_count,
    plays_count,
    HIDDEN,
    resource_id,
    state as status,
    title,
    message,
    published_at,
    is_official,
    card_type,
    card_subtype,
    votes_count,
    promoted_at,
    ecl_id,
    ecl_metadata,
    taxonomy_topics,
    filestack,
    bookmarks_count,
    deleted_at,
    ecl_source_name,
    readable_card_type,
    can_be_reanswered,
    provider,
    provider_image,
    auto_complete,
    user_taxonomy_topics,
    safe_cast(original_duration AS int64) as Duration,
    is_paid,
    LANGUAGE,
    authoritative_all_time_views_count,
    is_taxonomy_generated,
    standard_type,
    unique_code,
    source_id,
    external_id,
    plan,
    average_rating,
    custom_data,
    content_platform,
    org_id_s,
    -- minute,
    record_insert_time,
    source_display_name,
    source_type_name,
    source_logo_url,
    promotion,
    discount,
    allow_enrollment,
    RANK() OVER(PARTITION BY id ORDER BY record_insert_time DESC) AS Rnk
  FROM
    {{ref('cards_dim_m_v')}}
     QUALIFY Rnk = 1 
     ) a
  left outer join (select card_id,card_author_id, row_number() over(partition by card_id order by time asc) as rn from {{ ref('u0_usercards_event_vw') }} where card_author_id is not null QUALIFY rn=1 ) b on a.id=b.card_id
  left outer join {{ ref('u1_users_latest_metadata_vw') }} u
  on a.author_id = u.user_id,
unnest([timestamp_seconds(Duration)]) ts
left outer join {{ ref('u1_users_latest_metadata_vw') }} u1 on b.card_author_id=u1.user_id