
  
  create view "mydb"."main"."stg_payments__dbt_tmp" as (
    SELECT 
    payment_id,
    order_id,
    payment_method,
    payment_status
FROM payments
  );
