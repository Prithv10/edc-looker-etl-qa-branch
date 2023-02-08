
-- Use the `ref` function to select from other models
-- Model


{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field': 'sample_record_insert_ts', 'data_type': 'timestamp','granularity': 'month'},
    tags=['example']
  )
}}

select id,sample_record_insert_ts,etl_record_created_time
from {{ ref('my_first_dbt_model') }}

{% if is_incremental() %}
    where sample_record_insert_ts > (SELECT max(sample_record_insert_ts) FROM {{ this }})
{% endif %}

