
-- cf_0_latest_user_details_vw 
-- depends_on: {{ ref('cf_0_latest_metadata_vw') }} 

{% set value_list = dbt_utils.get_column_values(
    table=ref("cf_0_distinct_column_vw"), column="abbreviation"
) %}
{% if value_list %}

select *
from
    (select user_id, abbreviation, value from {{ ref("cf_0_latest_metadata_vw") }})
    pivot (max(value) for abbreviation in ("{{ value_list | join('", "') }}"))
{% else %} select 1 as No_data
{% endif %}
