{{ config(materialized='view') }}

with cte1 as (
select* FROM
{{ source('raw','productsubcategory') }}
)

select * from cte1