-- job_family_roles_dim_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  jfr.id,
  jfr.job_family_id,
  jf.name AS job_family_name,
  jf.default_name AS job_family_default_name,
  jfr.job_role_id,
  jr.title AS job_role_title,
  TIMESTAMP(jfr.created_at) AS created_at,
  TIMESTAMP(jfr.updated_at) AS updated_at,
  jfr.organization_id AS org_id_s,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(jfr.record_insert_time)) AS record_insert_time,
  CAST(jfr.yr AS STRING) yr,
  CAST(jfr.month AS STRING) month,
  jfr.day,
  CAST(jfr.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM
  {{get_master_db('job_family_roles')}} jfr
LEFT JOIN
  {{get_master_db('job_families')}} jf
ON
  jfr.job_family_id = jf.id
LEFT JOIN
  {{get_master_db('job_roles')}} jr
ON
  jfr.job_role_id = jr.id
WHERE
  organization_id={{var("var_cust_id")}}


{% if is_incremental() %}
    and jfr.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
