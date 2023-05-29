{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','stateprovince') }}
)

select * from cte1