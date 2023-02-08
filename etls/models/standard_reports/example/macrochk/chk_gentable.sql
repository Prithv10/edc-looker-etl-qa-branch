-- {{ var("var_db_name") }}.`structured_items_fact_m`
SELECT * FROM
 {{get_db_source('structured_items_fact_m')}}


 

