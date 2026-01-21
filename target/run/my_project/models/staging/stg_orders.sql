
  
  create view "mydb"."main"."stg_orders__dbt_tmp" as (
    SELECT 
    order_id,
    user_id,
    order_date,
    amount,
    status
FROM orders
  );
