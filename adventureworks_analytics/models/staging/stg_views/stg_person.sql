{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','person') }}
)

select * from cte1