--here i call __config and it shows bydefault = table, we can change it to view also
--currently we have given materialised option on model level but we can give the same in folder level also by using dbt_project.yml

{{
    config(
        materialized='table',
        transient='False'
    )
}}

with cte as (
select * 
from {{ source('raw', 'raw_data') }}
)
select raw_file,filename,load_date
from cte

--- we are going to materialised it and so we will save it and then run DBT run -- this run all the model
-- its good part is now its bydeafult giving Table not view-- reason is , i checked schema.yml and its showing materialised is 'Table'