{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','date') }}
)

select * from cte1