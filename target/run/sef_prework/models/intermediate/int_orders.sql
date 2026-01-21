
  
  create view "mydb"."main"."int_orders__dbt_tmp" as (
    SELECT 
    o.order_id,
    o.user_id,
    o.order_date,
    o.amount,
    o.status,
    p.payment_id,
    p.payment_method,
    p.payment_status
FROM "mydb"."main"."stg_orders" o
LEFT JOIN "mydb"."main"."stg_payments" p
  ON o.order_id = p.order_id
  );
