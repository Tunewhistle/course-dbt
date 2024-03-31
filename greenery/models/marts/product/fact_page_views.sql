SELECT
    int_product_events.session_id
    , int_product_events.user_id
    , int_product_events.product_id
    , int_session_timing.session_started_at
    , int_session_timing.session_ended_at
    , SUM(CASE WHEN int_product_events.event_type = 'page_view' THEN 1 ELSE 0 END) AS page_view_count
    , SUM(CASE WHEN int_product_events.event_type = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_cart_count
    , SUM(CASE WHEN int_product_events.event_type = 'checkout' THEN 1 ELSE 0 END) AS checkout_count
    , SUM(CASE WHEN int_product_events.event_type = 'package_shipped' THEN 1 ELSE 0 END) AS package_shipped_count
    , DATEDIFF('minute', int_session_timing.session_ended_at, int_session_timing.session_started_at) AS session_length_minutes
FROM {{ref('int_product_events')}}
LEFT JOIN {{ref('int_session_timing')}}
GROUP BY int_product_events.session_id, int_product_events.user_id, int_product_events.product_id, int_session_timing.session_started_at, int_session_timing.session_ended_at