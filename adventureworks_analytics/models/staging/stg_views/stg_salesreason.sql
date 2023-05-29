{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','salesreason') }}
)

select * from cte1