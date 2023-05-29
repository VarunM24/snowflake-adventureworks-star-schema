with stg_address as (
    select addressid,
    city,
    addressline1,
    addressline2,
    stateprovinceid
     FROM
    {{ ref('stg_address') }}

),
stg_stateprovince as (
    select * from  {{ ref('stg_stateprovince') }}
),
stg_countryregion as (
    select * from   {{ ref('stg_countryregion') }}

)
select 
{{dbt_utils.generate_surrogate_key(['a.addressid']) }} as address_key,
a.addressid,
a.stateprovinceid,
s.countryregioncode,
a.city ,
a.addressline1,
a.addressline2,
s.name as stateprovincename,
s.stateprovincecode,
c.name as countryname
from 
stg_address a
left join stg_stateprovince s on a.stateprovinceid = s.stateprovinceid
left join stg_countryregion c on s.countryregioncode = c.countryregioncode 