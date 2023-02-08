-- m0_channel_cards_dim_part1_vw
/**
{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'channel_id', 'data_type': 'int64', 'range': {
            'end': 100,
            'interval': 10,
            'start': 0
        }
        },
    cluster_by = ["card_id","channel_id"],
    tags=['incremental']
  )
}}
**/
-- NOTE : Changed partition key due to errors while running in genpact dataset, where channel_id has null values and
-- dbt doesnt support null values for partition keys

{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'etl_record_created_time', 'data_type': 'timestamp','granularity': 'month'},
    tags=['incremental']
  )
}}

select ChnlLatest.*,C1Latest.card_title, card_state, ecl_source_name, card_type, card_subtype, C1Latest.card_type_new, current_timestamp() AS etl_record_created_time from (
Select ChnlUserCards.*,ChnlLatest.Channel_Name from (
SELECT
  ChnlCards.card_id, ChnlCards.channel_id, ChnlCards.org_id_s
FROM (
  SELECT
    *,
    RANK() OVER(PARTITION BY channel_id,card_id ORDER BY record_insert_time DESC) AS rank
  FROM
    {{ref('channels_cards_dim_m_v')}} QUALIFY rank = 1
) ChnlCards
Left outer join (
  SELECT
    channel_id,
    card_id,
    org_id_s,
    RANK() OVER(PARTITION BY channel_id, card_id ORDER BY time DESC) AS rank
  FROM (
    SELECT
      card_id,
      channel_id,
      record_insert_time,
      time,
      org_id_s,
      event
    FROM
      {{ ref('u0_usercards_event_vw') }}
    WHERE
      event IN ('card_added_to_channel',
        'card_removed_from_channel') ) QUALIFY rank = 1
    AND event='card_removed_from_channel'
) UserCards on ChnlCards.channel_id = UserCards.channel_id And ChnlCards.card_id = UserCards.card_id and ChnlCards.org_id_s = UserCards.org_id_s
where UserCards.channel_id is null and UserCards.card_id is null
) ChnlUserCards
Left outer join {{ ref('ch1_channel_latest_metadata_vw') }} ChnlLatest on ChnlUserCards.channel_id = ChnlLatest.Channel_ID
) ChnlLatest left outer join 
(
  select card_id, card_title, card_state, ecl_source_name, card_type, card_subtype, 
  Case when card_type in ('Journey', 'journey') then 'journey'
when card_type in ('Pathway', 'pathway' , 'pack') then 'pack'
else card_type
end as card_type_new from {{ ref('c1_content_latest_metadata_vw') }} 
) C1Latest on ChnlLatest.card_id = C1Latest.card_id