-- cf_0_distinct_column_vw

SELECT DISTINCT(abbreviation) FROM {{ ref('cf_0_latest_metadata_vw') }} 
