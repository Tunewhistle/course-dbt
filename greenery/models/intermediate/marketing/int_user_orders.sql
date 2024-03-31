WITH orders AS (
    SELECT *
    FROM {{ref('stg_postgres_orders')}}
)
, users AS (
    SELECT *
    FROM {{ref('stg_postgres_users')}}
)
, order_items AS (
    SELECT *
    FROM {{ref('stg_postgres_order_items')}}
)

SELECT
    users.user_id
    , users.first_name
    , users.last_name
    , orders.order_id
    , order_items.product_id
    , orders.address_id
    , orders.created_at
    , orders.delivered_at
    , orders.estimated_delivery_at
    , orders.order_cost
    , orders.order_total
    , orders.promo_id
    , orders.shipping_cost
    , orders.shipping_service
    , orders.status
    , orders.tracking_id
FROM users
LEFT JOIN orders
    ON orders.user_id = users.user_id
LEFT JOIN order_items
    ON orders.order_id = order_items.order_id

