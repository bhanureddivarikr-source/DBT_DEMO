{{
    config(
        materialized='view',
        alias='Dim_view_customer',
        schema='Dim_view_schema',
        database='god',
        tags=['daily','daily_two'],
        enabled=true,
        meta={
            'owenr':'customer_data',
            'project':'customers',
            'version':'crm 360'
        }

    )
}}



select
    CUSTOMER_ID
    , CUSTOMER_NAME
    , UPPER(TRIM(CUSTOMER_NAME))               AS CUSTOMER_NAME_CLEAN
    , EMAIL
    , LOWER(TRIM(EMAIL))                      AS EMAIL_CLEAN
    , PHONE
    , REGEXP_REPLACE(PHONE,'[^0-9]','')       AS PHONE_NUMBER
    , CITY
    , UPPER(CITY)                             AS CITY_NAME
    , STATE
    , COUNTRY
    , CASE
          WHEN STATUS='A'
          THEN 'ACTIVE'
          ELSE 'INACTIVE'
      END                                     AS CUSTOMER_STATUS
    , CASE
          WHEN GENDER='M'
          THEN 'MALE'
          WHEN GENDER='F'
          THEN 'FEMALE'
          ELSE 'UNKNOWN'
      END                                     AS GENDER
    , TO_DATE(CREATED_DATE)                   AS CREATED_DATE
    , CURRENT_TIMESTAMP                       AS LOAD_TIMESTAMP

    from {{ source('God_mode','cust')}}