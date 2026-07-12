{{
   config(
     materialized='incremental',
    incremental_strategy='merge',
    unique_key='customer_id',
    alias='dim_incr_customer_merge',
    schema='dim_incr_merge',
    database='god',
    tags=['merges'],
    on_schema_change='sync_all_columns',
    enabled=true,
    meta={
        'name':'bhanu',
        'age':'25'
    }
   )
}}


select * from 
{{
    source('God_mode','cust')
}}



{% if is_incremental() %}

where updated_date >= (select coalesce(max(updated_date),to_timestamp('1999-01-01')) from {{ this }} )

{% endif %}