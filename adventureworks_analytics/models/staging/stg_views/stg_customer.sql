{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','customer') }}
)

select * from cte1