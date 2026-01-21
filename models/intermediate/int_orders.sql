SELECT 
    o.order_id,
    o.user_id,
    o.order_date,
    o.amount,
    o.status,
    p.payment_id,
    p.payment_method,
    p.payment_status
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_payments') }} p
  ON o.order_id = p.order_id