-- groups_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  ACCESS,
  client_id,
  client_resource_id,
  course_code,
  course_data_url,
  course_term,
  TIMESTAMP(g.created_at) AS created_at,
  creator_id,
  description,
  TIMESTAMP(end_date) AS end_date,
  id,
  image_url,
  LANGUAGE,
  name,
  organization_id AS org_id_s,
  parent_id,
  picture_content_type,
  picture_file_name,
  picture_file_size,
  TIMESTAMP(g.picture_updated_at) AS picture_updated_at,
  TIMESTAMP(start_date) start_date,
  topic_id,
  type,
  TIMESTAMP(g.updated_at) AS updated_at,
  users_count,
  website_url,
  CAST(details_locked AS bool) details_locked,
  CAST(close_access AS bool) close_access,
  CAST(is_private AS bool) is_private,
  CAST(connect_to_social_mediums AS bool) connect_to_social_mediums,
  CAST(enable_mobile_app_download_buttons AS bool) enable_mobile_app_download_buttons,
  CAST(share_to_social_mediums AS bool) share_to_social_mediums,
  CAST(daily_digest_enabled AS bool) daily_digest_enabled,
  CAST(forum_notifications_enabled AS bool) forum_notifications_enabled,
  CAST(is_promoted AS bool) is_promoted,
  CAST(is_hidden AS bool) is_hidden,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(g.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('groups')}} g
WHERE
  organization_id = {{var("var_cust_id")}}


{% if is_incremental() %}
    and g.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
