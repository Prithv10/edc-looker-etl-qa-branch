-- tags_t1_vw

Select card_id, string_agg(DISTINCT tag_name) as Tags from {{ ref('tags_t0_vw') }} group by card_id