
-- 1) To run standard charts
   -- Run all standard reports models
-- dbt run --select standard_reports
   -- Run specific models
-- dbt run --full-refresh --select standard_reports.content
-- dbt run --select standard_reports.content

-- 2) Org specific commands
   -- Only standard reports
-- dbt run --full-refresh --vars "var_cust_id: '2014'" --select standard_reports
-- dbt run --vars "var_cust_id: '2014'" --select standard_reports
   -- Both standard and custom reports
-- dbt run --full-refresh --vars "var_cust_id: '2014'" --select standard_reports org_custom_reports.amfi__2014
-- dbt run --vars "var_cust_id: '2014'" --select standard_reports org_custom_reports.amfi__2014


