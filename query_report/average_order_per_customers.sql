
WITH cte_level AS (
    SELECT
        ORDER_ID,
        CUSTOMER_ID,
        SUM(PRICE + FREIGHT_VALUE) AS order_value
    FROM   SIGMATECH_DEMO.PUBLIC.FACT_SALES
    WHERE ORDER_STATUS IN ('confirmed', 'processing', 'shipped', 'delivered')
    GROUP BY ORDER_ID, CUSTOMER_ID
)

SELECT
    CUSTOMER_ID,
    AVG(order_value) AS avg_order_value
FROM cte_level
GROUP BY CUSTOMER_ID
ORDER BY avg_order_value DESC;
