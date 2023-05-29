{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','countryregion') }}
)

select * from cte1