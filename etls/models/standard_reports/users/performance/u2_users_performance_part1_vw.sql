-- 1454_Glue_Users [U][2] [User Performance Data Explorer]

-- PART-1 Query - COMBINED RESULTS
-- u2_users_performance_part1_vw

SELECT * FROM {{ ref('u2_users_performance_part1_sub1_vw') }}
UNION ALL
SELECT * FROM {{ ref('u2_users_performance_part1_sub2_vw') }}
UNION ALL
SELECT * FROM {{ ref('u2_users_performance_part1_sub3_vw') }}
UNION ALL
SELECT * FROM {{ ref('u2_users_performance_part1_sub4_vw') }}
UNION ALL 
SELECT * FROM {{ ref('ucc_merged_buffered_temp_vw') }}

