{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','address') }}
)

select * from cte1