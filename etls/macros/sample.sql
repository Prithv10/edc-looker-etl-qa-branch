
{%- macro extract_clean_tag() -%}
    1,2,3
{%- endmacro -%}
/*
{% set message =  ['skill_assessments_dim_m','journey_pack_relations_dim_m','card_relations_dim_m','user_custom_fields_dim_m','user_job_family_roles_dim_m','groups_dim_m','structured_items_fact_m','job_family_role_skills_dim_m','skill_category_level_courses_dim_m','badgings_dim_m','cards_dim_m','card_languages_dim_m','user_onboardings_dim_m','custom_fields_dim_m','comments_fact_m','badges_dim_m','user_roles_dim_m','structures_dim_m','user_metrics_aggregations_fact_m','skills_details_dim_m','teams_users_fact_m','taggings_dim_m','card_custom_fields_dim_m','team_assignments_fact_m','user_job_family_role_skills_dim_m','card_reportings_dim_m','channels_cards_dim_m','teams_dim_m','assignments_fact_m','users_dim_m','user_profiles_fact_m','quizzes_fact_m','channels_dim_m','card_pack_relations_dim_m','skills_users_dim_m','profiles_dim_m','roles_dim_m','organizations_dim_m','user_content_completions_dim_m','clcs_dim_m','job_family_roles_dim_m'] %}
    {% set total = 41 %}
{% for tn in range(total) %}
    SELECT CONCAT('{{message[tn]}}',' - ',CAST(COUNT(*) as STRING)) as row_count_of_tables
    FROM `aws-eu-central-1-preview-01`.`edc_preview_analytics_customer_400011`.{{message[tn]}}
{% if tn < total - 1 %}
    UNION ALL 
{% endif %}
{% endfor %}
*/
{% set message =  ['channel_performance_reporting_i_v','invalid_user_card_performance_reporting_i_v','user_card_performance_reporting_i_v','user_assignments_performance_i_v','searches_fact_i_v','group_performance_reporting_i_v','skill_assessments_dim_m','journey_pack_relations_dim_m','card_relations_dim_m','user_custom_fields_dim_m','user_job_family_roles_dim_m','groups_dim_m','structured_items_fact_m','job_family_role_skills_dim_m','skill_category_level_courses_dim_m','badgings_dim_m','cards_dim_m','card_languages_dim_m','user_onboardings_dim_m','custom_fields_dim_m','comments_fact_m','badges_dim_m','user_roles_dim_m','structures_dim_m','user_metrics_aggregations_fact_m','skills_details_dim_m','teams_users_fact_m','taggings_dim_m','card_custom_fields_dim_m','team_assignments_fact_m','user_job_family_role_skills_dim_m','card_reportings_dim_m','channels_cards_dim_m','teams_dim_m','assignments_fact_m','users_dim_m','user_profiles_fact_m','quizzes_fact_m','channels_dim_m','card_pack_relations_dim_m','skills_users_dim_m','profiles_dim_m','roles_dim_m','organizations_dim_m','user_content_completions_dim_m','clcs_dim_m','job_family_roles_dim_m'] %}
    {% set total = 47 %}
{% for tn in range(total) %}
    SELECT '{{message[tn]}}' as table_name ,COUNT(*) as row_count
    FROM `aws-eu-central-1-preview-01`.`edc_preview_analytics_customer_400011`.{{message[tn]}}
{% if tn < total - 1 %}
    UNION ALL 
{% endif %}
{% endfor %}
