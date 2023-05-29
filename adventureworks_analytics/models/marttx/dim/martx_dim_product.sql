with product as (
    select * FROM
    {{ ref('stg_product') }}

),
productcategory as (
    select * FROM
    {{ ref('stg_productcategory') }}

),
productsubcategory as (
    select * FROM
    {{ ref('stg_productsubcategory') }}

)
select 
{{dbt_utils.generate_surrogate_key(['p.productid']) }} as product_key,
p.productid,
pc.productcategoryid ,
p.productsubcategoryid,
p.name as product_name,
pc.name as product_category_name,
psc.name as product_subcategory_name,
p.color as color,
p.weight,
p.standardcost,
p.class
from 
product p
left join productsubcategory psc on p.productsubcategoryid = psc.productsubcategoryid
left join productcategory pc on psc.productcategoryid = pc.productcategoryid 