{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','store') }}
)

select * from cte1