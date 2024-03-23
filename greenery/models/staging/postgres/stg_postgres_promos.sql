SELECT
    discount
    , promo_id
    , status
FROM {{ source('postgres', 'promos') }}
