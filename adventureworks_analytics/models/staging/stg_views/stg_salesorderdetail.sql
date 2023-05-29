{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','salesorderdetail') }}
)

select * from cte1