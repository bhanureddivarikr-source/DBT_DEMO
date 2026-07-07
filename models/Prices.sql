{{
    config(
        materialized='table'
    )
}}


select
name,
count(*) as total_count
from
{{ ref('stg_raw_listings') }}
group by name