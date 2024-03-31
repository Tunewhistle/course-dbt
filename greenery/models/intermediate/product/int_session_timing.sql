SELECT 
    session_id
    , MIN(created_at) AS session_started_at
    , MAX(created_at) AS session_ended_at
FROM {{ref('int_product_events')}}
GROUP BY session_id