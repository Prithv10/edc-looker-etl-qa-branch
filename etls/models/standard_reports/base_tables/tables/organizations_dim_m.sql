-- organizations_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  host_name,
  TIMESTAMP(organizations.co_branding_logo_updated_at) AS co_branding_logo_updated_at,
  mobile_image_content_type,
  name,
  co_branding_mobile_logo_content_type,
  co_branding_mobile_logo_file_size,
  TIMESTAMP(organizations.co_branding_mobile_logo_updated_at) AS co_branding_mobile_logo_updated_at,
  client_id,
  comments_count,
  custom_domain,
  users_count,
  redirect_uri,
  co_branding_logo_file_name,
  co_branding_mobile_logo_file_name,
  TIMESTAMP(organizations.favicon_updated_at) AS favicon_updated_at,
  TIMESTAMP(organizations.mobile_image_updated_at) AS mobile_image_updated_at,
  favicon_file_name,
  TIMESTAMP(organizations.splash_image_updated_at) AS splash_image_updated_at,
  savannah_app_id,
  co_branding_logo_content_type,
  image_content_type,
  co_branding_logo_file_size,
  TIMESTAMP(organizations.created_at) AS created_at,
  TIMESTAMP(organizations.updated_at) AS updated_at,
  status,
  platform_domain,
  splash_image_content_type,
  splash_image_file_size,
  image_file_name,
  slug,
  favicon_file_size,
  TIMESTAMP(organizations.image_updated_at) AS image_updated_at,
  description,
  mobile_image_file_name,
  id AS org_id_s,
  favicon_content_type,
  image_file_size,
  splash_image_file_name,
  mobile_image_file_size,
  CAST(is_registrable AS bool) is_registrable,
  CAST(send_weekly_activity AS bool) send_weekly_activity,
  CAST(show_sub_brand_on_login AS bool) show_sub_brand_on_login,
  CAST(social_enabled AS bool) social_enabled,
  CAST(xapi_enabled AS bool) xapi_enabled,
  CAST(show_onboarding AS bool) show_onboarding,
  CAST(enable_role_based_authorization AS bool) enable_role_based_authorization,
  CAST(enable_analytics_reporting AS bool) enable_analytics_reporting,
  CAST(whitelabel_build_enabled AS bool) whitelabel_build_enabled,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(organizations.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('organizations')}} organizations
WHERE
  id = {{var("var_cust_id")}}


{% if is_incremental() %}
    and organizations.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
