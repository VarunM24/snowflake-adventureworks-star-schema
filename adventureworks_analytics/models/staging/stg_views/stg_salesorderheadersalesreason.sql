{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','salesorderheadersalesreason') }}
)

select * from cte1