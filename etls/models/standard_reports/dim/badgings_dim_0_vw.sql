  -- 1454_Glue_Badgings_dim[0]
  -- badgings_dim_0_vw

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'time_badge_created', 'data_type': 'timestamp','granularity': 'day'},
    cluster_by = ["badgeable_card_id"],
    tags=['incremental']
  )
}}

 SELECT
  badge_title,
  badgeable_card_id,
  time_badge_created,
  time_badge_last_updated,
  org_id_s
FROM (
  SELECT
    *,
    RANK() OVER(PARTITION BY id, badgeable_card_id ORDER BY record_insert_time DESC) AS rank
  FROM
    {{ref('badgings_dim_m_v')}} QUALIFY rank = 1 )