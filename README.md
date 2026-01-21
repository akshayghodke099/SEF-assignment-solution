# 📘 Assignment A – dbt + DuckDB Project

## 1. How to Set Up and Run the Project
**1. Create environment**

   ```python -m venv dbt-env```<br>
   ```dbt-env\Scripts\activate```<br>
   ```pip install dbt-core dbt-duckdb duckdb```

**2. Initialize project**
   ```dbt init sef_prework```

**3. Initialize project**
  Save <b> users.csv, orders.csv, payments.csv </b> into <b> sef_prework/data/ </b>

    Create DuckDB database

<b> python </b>
> import duckdb <br>
conn = duckdb.connect("sef_prework/mydb.duckdb") <br>
conn.execute("CREATE TABLE users AS SELECT * FROM read_csv_auto('sef_prework/data/users.csv');") <br>
conn.execute("CREATE TABLE orders AS SELECT * FROM read_csv_auto('sef_prework/data/orders.csv');") <br>
conn.execute("CREATE TABLE payments AS SELECT * FROM read_csv_auto('sef_prework/data/payments.csv');") <br>
conn.close() <br>
Configure profiles.yml

<b> yaml </b> <br> 
> sef_prework:  <br>
  target: dev  <br>
  outputs: <br>
    dev: <br>
      type: duckdb <br>
      path: <your_project_dir_path>/mydb.duckdb <br>

>Run models and tests: <br>
 ```dbt run```<br>
```dbt test```<br>
```dbt docs generate```<br>
```dbt docs serve```<br>

## 2. What Transformations I Applied and Why
<u> **Staging models** </u>

**stg_users:** selected user_id, signup_date, city → cleaned user data.

**stg_orders:** selected order_id, user_id, order_date, amount, status → standardized order data.

**stg_payments:** selected payment_id, order_id, payment_method, payment_status → cleaned payment data.

<u>**Intermediate model**</u>

**int_orders:** joined orders with payments → combined order and payment details for analysis.

<u>**Final model**</u>

**fct_daily_revenue:** aggregated amount by order_date where payment_status = 'Completed' → produced daily revenue totals.

## 3. Assumptions Made
•	Only completed payments contribute to 'revenue' <br>
•	Each order has a unique 'order_id'<br>
•	Each user has a unique 'user_id'<br>
•	Each payment has a unique 'payment_id'<br>
•	Revenue is calculated strictly from the amount field in 'orders.csv'

## 4. What Confused or Challenged Me
•	'Profiles.yml'  path issues: Initially dbt couldn’t find mydb.duckdb until I corrected the path and used forward slashes. <br>
•	Semicolons in SQL: dbt models failed when queries ended with ';' Removing them fixed the parser errors.<br>
•	Configuration Error: dbt warned about unused paths in dbt_project.yml until I aligned folder names (staging, intermediate, final).<br>
•	Encountered and fixed Runtime Error: (No dbt_project.yml found at expected path C:\Users\admin\Desktop\AG\Assignment Solution\dbt_project.yml)<br>
•	Joins: Ensuring the join between orders and payments was correct.

## 5. What I Would Improve With More Time
•	Add more tests (e.g., check valid payment_status values, ensure amount > 0) <br>
•	Extend final model to include revenue by city or payment method <br>
•	Automate CSV ingestion rather than manual loading <br>
•	Add snapshots to track changes in user signups or payment statuses <br>
•	Improve documentation with detailed descriptions for each staging and intermediate model <br>
•	Explore incremental models for scalability with larger datasets.

## 6. Approximate Time Spent
Environment setup: **~50 minutes** <br>
Project initialization + CSV loading: **~40 minutes** <br>
Debugging column mismatches + path issues: **~1.5 hours** <br>
Writing models + restructuring staging queries: **~1.5 hours** <br>
Adding tests + documentation: **~1 hour** <br>
Preparing README + reflection + Github Repo: **~2 hours** <br>
**Total: ~7.5 hours**


## Reflection:

**1) First concept or tool I had to understand**  
<I> The first concept I needed to grasp was how **dbt connects to DuckDB through the `profiles.yml` file**. At first, this felt confusing because dbt would not run until the connection was set up correctly. Once I understood that `profiles.yml` is the bridge between dbt and the database, the assignment became “doable”. I now feel confident about configuring profiles and running models, but I would still like to explore advanced dbt features such as incremental models and snapshots. </I>

**2) How I built understanding and skills**  
<I> I built my understanding by reading dbt documentation, carefully examining error messages, and experimenting with small changes until things worked. Each time I hit an error—like mismatched column names or semicolons in SQL—I slowed down, checked the docs, and retried. What supported me most was a combination of official documentation, online examples, and persistence in debugging. Seeing the models finally run successfully gave me confidence that I was learning the right way. </I>

**3) What I learned about myself as a learner**  
<I> This process taught me that I am patient and persistent when faced with technical challenges. Instead of getting discouraged by repeated errors, I treated them as clues to what I needed to fix. I also realized that I learn best by *doing*—hands‑on trial and error helped me more than just reading instructions. Spending over seven hours on this assignment showed me that I can stay focused, solve problem step by step, and grow more confident as I build new skills.
</I>