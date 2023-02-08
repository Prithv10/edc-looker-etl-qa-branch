
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/


{{ config(materialized='table') }}

with source_data as (

    select 1 as id,TIMESTAMP('2021-05-15 16:45:23') as sample_record_insert_ts,current_timestamp() as etl_record_created_time
    union all
    select 2 as id,TIMESTAMP('2021-05-18 16:45:23') as sample_record_insert_ts,current_timestamp() as etl_record_created_time
    union all
    select 3 as id,TIMESTAMP('2021-05-13 16:45:23') as sample_record_insert_ts,current_timestamp() as etl_record_created_time
    union all
    select 4 as id,TIMESTAMP('2021-05-14 16:45:23') as sample_record_insert_ts,current_timestamp() as etl_record_created_time
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not nullll
