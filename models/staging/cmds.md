**Step 1: Environment Setup**



cmd> python -m venv sef-dbt-env



cmd> sef-dbt-env\\Scripts\\activate



cmd> pip install dbt-core dbt-duckdb



cmd> dbt --version





**Step 2: Project Initialization**



cmd> dbt init my\_project





**Step 3: Download CSV and Keep in data folder in your project.**





**Step 4: Create DuckDB Database \& Load CSVs**



cmd> duckdb mydb.duckdb       //NOT WORKING



cmd> python



python cmd> 	import duckdb

&nbsp;		conn = duckdb.connect("mydb.duckdb")



&nbsp;		conn.execute("CREATE TABLE users AS SELECT \* FROM read\_csv\_auto('users.csv');")

&nbsp;		conn.execute("CREATE TABLE orders AS SELECT \* FROM read\_csv\_auto('orders.csv');")

&nbsp;		conn.execute("CREATE TABLE payments AS SELECT \* FROM read\_csv\_auto('payments.csv');")

&nbsp;		conn.close()





**Step 5: Configure dbt Profiles**

File: profiles.yml in your home directory (~/.dbt/ or C:\\Users\\<YourUsername>\\.dbt\\).

Content:



yaml

my\_project:

&nbsp; target: dev

&nbsp; outputs:

&nbsp;   dev:

&nbsp;     type: duckdb

&nbsp;     path: c:/users/admin/desktop/ag/assignment solution/my\_project/mydb.duckdb





**Step 6: Create Models**

📂 Folder structure:



Code

my\_project/models/

├── staging/

│   ├── stg\_users.sql

│   ├── stg\_orders.sql

│   └── stg\_payments.sql

├── intermediate/

│   └── int\_orders.sql

└── final/

&nbsp;   └── fct\_daily\_revenue.sql







**Step 7: Add Tests**

File: schema.yml.



Content:



yaml

models:

&nbsp; - name: stg\_users

&nbsp;   columns:

&nbsp;     - name: user\_id

&nbsp;       tests:

&nbsp;         - not\_null

&nbsp;         - unique

&nbsp; - name: stg\_orders

&nbsp;   columns:

&nbsp;     - name: order\_id

&nbsp;       tests:

&nbsp;         - not\_null

&nbsp;         - unique

&nbsp; - name: stg\_payments

&nbsp;   columns:

&nbsp;     - name: payment\_id

&nbsp;       tests:

&nbsp;         - not\_null

&nbsp;         - unique



Run:

cmd> dbt test





**Step 8: Documentation**

Add descriptions in schema.yml:



yaml

models:

&nbsp; - name: fct\_daily\_revenue

&nbsp;   description: "Aggregated daily revenue from orders with completed payments"



Run:

cmd> dbt docs generate

cmd> dbt docs serve













