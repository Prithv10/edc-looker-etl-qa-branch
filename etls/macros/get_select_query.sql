{%- macro get_select_query(tbl_name) -%}
	SELECT * FROM {{ ref(tbl_name) }}
{%- endmacro -%}
