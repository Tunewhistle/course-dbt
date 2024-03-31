SELECT
    inventory
    , name
    , price
    , product_id
FROM {{ref('stg_postgres_products')}}