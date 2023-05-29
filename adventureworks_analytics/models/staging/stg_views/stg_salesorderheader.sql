{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','salesorderheader') }}
)

select * from cte1