with stg_date as (
    select * FROM
    {{ ref('stg_date') }}

)
select 
{{dbt_utils.generate_surrogate_key(['stg_date.date_day']) }} as date_key,
date_day,
prior_date_day,
next_date_day,
prior_year_date_day,
prior_year_over_year_date_day,
day_of_week,
day_of_week_name,
day_of_month,
day_of_year
from 
stg_date 