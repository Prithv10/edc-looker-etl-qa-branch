{%- macro get_tags_embed_query(join_tbl_name,join_tbl_varname) -%}
	SELECT A.*,B.tags FROM {{ join_tbl_name }} A LEFT JOIN {{ ref('tags_t1_vw') }} B ON A.{{ join_tbl_varname }} = B.card_id
{%- endmacro -%}

