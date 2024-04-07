WITH conversion_sessions AS (
SELECT DISTINCT session_id
FROM {{ref('int_product_events')}}
WHERE event_type = 'checkout'
)
SELECT
    int_product_events.created_at
    , int_product_events.event_id
    , int_product_events.event_type
    , int_product_events.order_id
    , int_product_events.page_url
    , int_product_events.product_id
    , int_product_events.product_name
    , int_product_events.session_id
    , int_product_events.user_id
    , conversion_sessions.session_id IS NOT NULL AS is_conversion_session
FROM {{ref('int_product_events')}}
LEFT JOIN conversion_sessions
    ON int_product_events.session_id = conversion_sessions.session_id
