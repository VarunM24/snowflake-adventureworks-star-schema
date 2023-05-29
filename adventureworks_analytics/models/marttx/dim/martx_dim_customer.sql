with stg_customer as (
    select * FROM
    {{ ref('stg_customer') }}

),
stg_person as (
    select * from  {{ ref('stg_person') }}
),
stg_store as (
    select * from   {{ ref('stg_store') }}

)
select 
{{dbt_utils.generate_surrogate_key(['c.customerid']) }} as customer_key,
c.personid ,
c.storeid,
p.firstname,
p.middlename,
p.lastname,
s.storename,
s.salespersonid
from 
stg_customer c
left join stg_person p on c.personid = p.businessentityid
left join stg_store s on c.storeid = s.businessentityid 