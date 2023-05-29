{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','creditcard') }}
)

select * from cte1