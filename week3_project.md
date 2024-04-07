## 1. Create a model fact_product_events to calculate conversion rate. 
1.query to get conversion rate from that model
    SELECT
    COUNT(DISTINCT CASE WHEN is_conversion_session THEN session_id END)/COUNT(DISTINCT session_id) AS conversion_rate
    FROM marts.product.fact_product_events

2. query to get conversion rate by product

WITH product_session AS (
    SELECT product_id
    , COUNT(DISTINCT session_id) AS session_count
    FROM marts.product.fact_product_events
    GROUP BY product_id
)
, product_conversion_session AS (
    SELECT product_id
    , COUNT(DISTINCT session_id) AS conversion_session_count
    FROM marts.product.fact_product_events
    WHERE is_conversion_session
    GROUP BY product_id
)
    SELECT
    product_session.product_id
    , SAFE_DIVIDE(product_conversion_session.conversion_session_count, product_session.session_count) AS product_conversion_rate
    conversion_session_count/
    FROM product_session
    LEFT JOIN product_conversion_session
    ON product_session.product_id = product_conversion_session.product_id

## 2. Create a macro sum_of to replace code in fact_page_views.

## 3. Create macro grant, add a post hook to grant role reporting.

## 4. Install dbt packages and use utils unique_combination_of_columns test.

## 5. Run dbt snapshot for products_snapshot.