{{
    config(
        materialized='table'
    )
}}

select
room_type,
count(*) as total_count
from
{{ ref('stg_raw_listings') }}
group by room_type