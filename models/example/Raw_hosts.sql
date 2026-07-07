{{ config(materialized = 'table') }}

SELECT
NAME,
UPPER(NAME) AS UPPER_NAME,
LOWER(NAME) AS LOWER_NAME,
INITCAP(NAME) AS INIT_NAME,
substr(name,1,position(' '  in name)) as in_sub_string
FROM
{{ source('source', 'RAW_LISTINGS')}}


