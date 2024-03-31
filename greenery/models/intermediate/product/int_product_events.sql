WITH events AS (
    SELECT *
    FROM {{ref('stg_postgres_events')}}
)
, order_items AS (
    SELECT *
    FROM {{ref('stg_postgres_order_items')}}
)
, products AS (
    SELECT *
    FROM {{ref('stg_postgres_products')}}
)

SELECT
    events.created_at
    , events.event_id
    , events.event_type
    , events.order_id
    , events.page_url
    , COALESCE(events.product_id, order_items.product_id) AS product_id
    , products.name AS product_name
    , events.session_id
    , events.user_id
FROM events
LEFT JOIN order_items
    ON events.order_id = order_items.order_id
LEFT JOIN products
    ON COALESCE(events.product_id, order_items.product_id) = products.product_id