{{ config(materialized="view") }}


select

    created_at as created_date,
    to_timestamp(created_at) as created_date_1,
    to_char(to_timestamp(created_at), 'YYYY-MM-DD') as date_2,
    day(to_timestamp(created_at)) as day,
    dayname(to_timestamp(created_at)) as day_in_a_week,
    case
        when dayname(to_timestamp(created_at)) in ('SUN', 'SAT')
        then 'WEEKEND'
        else 'WEEKDAYS'
    end as dayss,
    month(to_timestamp(created_at)) as month,
    {{ value("CREATED_AT") }} as staion_of

from {{ source("source", "RAW_HOSTS") }}
