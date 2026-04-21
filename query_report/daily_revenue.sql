SELECT 
    DATE(ORDER_PURCHASE_TIMESTAMP) AS order_day,
    SUM(PRICE + FREIGHT_VALUE) AS total_revenue
FROM  SIGMATECH_DEMO.PUBLIC.FACT_SALES
WHERE ORDER_STATUS IN ('delivered','invoiced','canceled','created','processing','unavailable','approved','shipped')
GROUP BY order_day
ORDER BY order_day;