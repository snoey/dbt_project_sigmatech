SELECT 
    DATE_TRUNC('month', date(ORDER_PURCHASE_TIMESTAMP)) AS month,
    TO_CHAR(DATE_TRUNC('month', date(ORDER_PURCHASE_TIMESTAMP)), 'MON') AS month_name,
    COUNT(DISTINCT CUSTOMER_ID) AS active_customers
FROM  SIGMATECH_DEMO.PUBLIC.FACT_SALES
WHERE ORDER_STATUS IN ('delivered','invoiced','canceled','created','processing','unavailable','approved','shipped')
GROUP BY month
ORDER BY month;