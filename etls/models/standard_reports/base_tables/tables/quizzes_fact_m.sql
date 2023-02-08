-- quizzes_fact_m

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'updated_at', 'data_type': 'timestamp','granularity': 'day'},
    tags=['incremental']
  )
}}

SELECT
  quizzes.id,
  organization_id AS org_id_s,
  card_id,
  CAST(reanswerable AS bool) reanswerable,
  passing_criteria,
  TIMESTAMP(quizzes.created_at) AS created_at,
  TIMESTAMP(quizzes.updated_at) AS updated_at,
  CAST(quizzes.mandatory AS bool) mandatory,
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MILLIS(quizzes.record_insert_time)) AS record_insert_time,
  CAST(quizzes.yr AS STRING) yr,
  CAST(quizzes.month AS STRING) month,
  quizzes.day,
  CAST(quizzes.hour AS STRING) hour,
  current_timestamp() AS etl_record_created_time
FROM 
  {{get_master_db('quizzes')}} quizzes
LEFT JOIN
  {{ref('cards_dim_m_v')}} cards
ON
  quizzes.card_id=cards.id
WHERE
  cards.organization_id={{var("var_cust_id")}}



{% if is_incremental() %}
    and quizzes.day >= (SELECT max(day) FROM {{ this }})
{% endif %}
