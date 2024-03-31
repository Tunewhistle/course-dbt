WITH orders AS(
    SELECT
        user_id
        , MIN(created_at) AS first_order_created_at
        , MAX(created_at) AS last_order_created_at
        , SUM(order_cost) AS total_spend
        , COALESCE(COUNT(order_id), 0) AS orders_count
        , MAX(order_id IS NOT NULL) AS is_buyer
        , COUNT(product_id) AS product_purchased
    FROM {{ref('int_user_orders')}}
    GROUP BY user_id
)
SELECT
    user_id
    , is_buyer
    , orders_count>=2 AS is_frequent_buyer
    , first_order_created_at
    , last_order_created_at
    , orders_count
    , total_spend
    , product_purchased
FROM orders
