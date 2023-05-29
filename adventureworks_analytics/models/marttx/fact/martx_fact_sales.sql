-- This will join sales and sales detail table from the oltp database and will contain FK for all the dimensions

with salesorderheader as 
(
    select 
    * from {{ ref('stg_salesorderheader') }}

),
salesorderdetail as 
(
 select 
    * from {{ ref('stg_salesorderdetail') }}

)
select 
{{dbt_utils.generate_surrogate_key(['sod.salesorderid','sod.salesorderdetailid']) }} as sales_key,
{{dbt_utils.generate_surrogate_key(['soh.customerid']) }}  as customer_key,
{{dbt_utils.generate_surrogate_key(['soh.salespersonid']) }}  as salesperson_key,
{{dbt_utils.generate_surrogate_key(['soh.creditcardid']) }} as creditcard_key,
{{dbt_utils.generate_surrogate_key(['soh.shiptoaddressid']) }}  as shiptoaddress_key,
{{dbt_utils.generate_surrogate_key(['soh.orderdate']) }}  as orderdate_key,
{{dbt_utils.generate_surrogate_key(['sod.productid']) }}  as product_key,
soh.salesorderid,
sod.salesorderdetailid,
sod.unitprice,
sod.orderqty,
sod.unitprice * sod.orderqty as revenue
from
salesorderdetail sod
inner join salesorderheader  soh
on soh.salesorderid= sod.salesorderid

