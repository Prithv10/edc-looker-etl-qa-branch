-- By default, custom schema name will be combined with target.schema name
-- Override this schema to based on requirements

{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- set var_cust_id = var("var_cust_id") -%}

    {% if target.name in ['env_edc_qa_analytics_customer', 'env_edc_prod_analytics_customer',
'env_edc_prod_analytics_customer_1_us_east4','env_edc_prod_analytics_customer_2_europe_west3','env_edc_prod_analytics_customer_3_us_west1','env_edc_prod_analytics_customer_4_australia_southeast1','env_edc_qa_analytics_customer_phase1','env_edc_preview_analytics_customer'] %}
	  {{ return(default_schema ~ '_' ~ var_cust_id) }}
    {%- else -%}
      {{ return(default_schema) }}
    {%- endif -%}

{%- endmacro %}