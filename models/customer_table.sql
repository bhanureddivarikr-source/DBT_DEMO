{{
    config(
        materialized='table',
    alias='dim_table_customer',
    schema='dim_table_schema',
    database='god',
    enabled=true,
    on_schema_change='append_new_columns',
    tags=['stage','tables'],
    meta={
        'name':'bhanu',
        'age':'25',
        'area':'bnglr'
    }
    )
}}

select 
* 
from
{{ ref('customer_view')}}