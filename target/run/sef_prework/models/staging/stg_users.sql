
  
  create view "mydb"."main"."stg_users__dbt_tmp" as (
    SELECT 
    user_id,
    signup_date,
    city
FROM users
  );
