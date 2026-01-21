SELECT 
    DATE(order_date) AS day,
    SUM(amount) AS daily_revenue
FROM "mydb"."main"."int_orders"
WHERE payment_status = 'Completed'   -- only count successful payments
GROUP BY day
ORDER BY day