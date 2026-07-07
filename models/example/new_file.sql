WITH RAW_HOSTES_DAILY AS
(
    SELECT * FROM 
    {{ source('source', 'RAW_HOSTS') }}

),

aggr as
(
    select
    IS_SUPERHOST,
    count(*)
    from RAW_HOSTES_DAILY
    group by IS_SUPERHOST
)

SELECT * FROM aggr