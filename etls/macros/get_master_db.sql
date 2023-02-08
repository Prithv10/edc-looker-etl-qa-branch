{% macro get_master_db(table_name) %}

	{% if target.name in ['default', 'dev'] %}
	  {{ return("dev_eddata_system." ~ table_name) }}
    {% elif target.name in ['env_edc_preview_analytics_customer'] %}
	  {{ return("preview_eddata_system." ~ table_name) }}
    {% elif target.name in ['env_edc_qa_analytics_customer','env_edc_qa_analytics_customer_phase1'] %}
	  {{ return("qa_eddata_system." ~ table_name) }}
	{% else %}
	  {{ return("NULL_eddata_system." ~ table_name) }}
	{% endif %}

{% endmacro %}

