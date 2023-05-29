{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','productcategory') }}
)

select * from cte1