
{% macro get_db_source(table_name) %}

	{% if target.name in ['default', 'dev'] %}
	  {{ return("spark_edcast_dev." ~ table_name) }}
    {%- elif target.name == 'test' -%}
        {{ return("spark_edcast_qa." ~ table_name) }}
    {% elif target.name == 'spark_initial' %}
	  {{ return("spark_edcast." ~ table_name) }}
	{% elif target.name == 'env_genpact' %}
	  {{ return("genpact_dataset." ~ table_name) }}
	{% elif target.name == 'env_baptist_health_datasets' %}
	  {{ return("baptist_health_datasets." ~ table_name) }}
	{% elif target.name == 'env_audible_dataset' %}
	  {{ return("audible_dataset." ~ table_name) }}
	{% elif target.name == 'env_bank_of_canada_dataset' %}
	  {{ return("bank_of_canada_dataset." ~ table_name) }}
	{% elif target.name == 'env_edc_qa_analytics_customer' %}
	  {{ return("edc_qa_analytics_customer_" ~ var("var_cust_id") ~  "."  ~ table_name) }}
	{% elif target.name == 'env_edc_prod_analytics_customer' %}
	  {{ return("edc_prod_analytics_customer_" ~ var("var_cust_id") ~  "."  ~ table_name) }}
	{% elif target.name in ['env_edc_prod_analytics_customer_1_us_east4','env_edc_prod_analytics_customer_2_europe_west3','env_edc_prod_analytics_customer_3_us_west1','env_edc_prod_analytics_customer_4_australia_southeast1'] %}
	  {{ return("edc_prod_analytics_customer_" ~ var("var_cust_id") ~  "."  ~ table_name) }}
	{% elif target.name in ['env_edc_qa_analytics_customer_phase1'] %}
	  {{ return("edc_qa_analytics_customer_" ~ var("var_cust_id") ~  "."  ~ table_name) }}
    {% elif target.name in ['env_edc_preview_analytics_customer'] %}
	  {{ return("edc_preview_analytics_customer_" ~ var("var_cust_id") ~  "."  ~ table_name) }}
	{% else %}
	  {{ return("spark_edcast_dev." ~ table_name) }}
	{% endif %}

{% endmacro %}
