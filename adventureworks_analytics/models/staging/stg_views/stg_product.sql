{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','product') }}
)

select * from cte1