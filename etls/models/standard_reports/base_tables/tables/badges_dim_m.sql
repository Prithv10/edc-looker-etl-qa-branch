-- badges_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}


SELECT
  id,
  organization_id AS org_id_s,
  type,
  TIMESTAMP(badges.created_at) AS created_at,
  TIMESTAMP(badges.updated_at) AS updated_at,
  image_file_name,
  image_content_type,
  image_file_size,
  TIMESTAMP(badges.image_updated_at) AS image_updated_at,
  image_social_file_name,
  image_social_content_type,
  image_social_file_size,
  TIMESTAMP(badges.image_social_updated_at) AS image_social_updated_at,
  CAST(is_default AS bool) is_default,
  image_original_url,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(badges.record_insert_time)) AS record_insert_time,
  CAST(yr AS STRING) yr,
  CAST(month AS STRING) month,
  day,
  CAST(hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
    {{get_master_db('badges')}} badges
WHERE
  organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and badges.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
