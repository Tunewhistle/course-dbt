SELECT
    inventory
    , name
    , price
    , product_id
FROM {{ source('postgres', 'products') }}
