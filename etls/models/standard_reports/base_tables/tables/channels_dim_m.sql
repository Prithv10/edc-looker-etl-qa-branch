-- channels_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  card_fetch_limit,
  card_query_id,
  client_id,
  content_discovery_freq,
  content_type,
  TIMESTAMP(channels.created_at) AS created_at,
  description,
  group_id,
  id,
  image_content_type,
  image_file_name,
  image_file_size,
  TIMESTAMP(channels.image_updated_at) AS image_updated_at,
  keywords,
  label,
  LANGUAGE,
  TIMESTAMP(channels.last_discovered_at) AS last_discovered_at,
  mobile_image_content_type,
  mobile_image_file_name,
  mobile_image_file_size,
  TIMESTAMP(channels.mobile_image_updated_at) AS mobile_image_updated_at,
  organization_id AS org_id_s,
  parent_id,
  provider,
  provider_image,
  slug,
  topics,
  TIMESTAMP(channels.updated_at) AS updated_at,
  user_id,
  CAST(visible AS bool) visible,
  CAST(is_private AS bool) is_private,
  CAST(autopull_content AS bool) autopull_content,
  CAST(show_authors AS bool) show_authors,
  CAST(visible_during_onboarding AS bool) visible_during_onboarding,
  CAST(only_authors_can_post AS bool) only_authors_can_post,
  CAST(is_general AS bool) is_general,
  CAST(is_promoted AS bool) is_promoted,
  CAST(auto_follow AS bool) auto_follow,
  CAST(ecl_enabled AS bool) ecl_enabled,
  CAST(curate_only AS bool) curate_only,
  CAST(is_open AS bool) is_open,
  CAST(curate_ugc AS bool) curate_ugc,
  CAST(allow_follow AS bool) allow_follow,
  CAST(shareable AS bool) shareable,
  CAST(auto_pin_cards AS bool) auto_pin_cards,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(channels.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  organization_id,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('channels')}} channels

WHERE
  organization_id = {{var("var_cust_id")}}


{% if is_incremental() %}
    and channels.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
