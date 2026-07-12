{{
    config(
        materialized='incremental',
        incremental_strategy='append',
        unique_key='customer_id',
        on_schema_change='append_new_columns',
        tags=['incr_append'],
        alias='append_dim_customer_table',
        schema='append_dim_schema',
        database='god',
        enabled=true,
        meta={
            'name':'bhanu',
            'age':'35'
        }

    )
}}


select * from {{ source('God_mode','cust') }}


{% if is_incremental() %}

where updated_date >= (select coalesce(max(updated_date), to_timestamp('1999-01-01')) from {{ this }} )

{% endif %}














