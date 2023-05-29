with stg_creditcard as (
    select * FROM
    {{ ref('stg_creditcard') }}

)
select 
{{dbt_utils.generate_surrogate_key(['stg_creditcard.creditcardid']) }} as creditcard_key,
creditcardid,
cardtype,
expyear,
expmonth

from 
stg_creditcard 