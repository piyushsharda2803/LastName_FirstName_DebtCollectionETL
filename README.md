# LastName_FirstName_DebtCollectionETL

### `README.md` Instructions

```markdown
# Data Loading and Database Setup

This repository includes a Python script to load data from a CSV file into a PostgreSQL database. Below are the details on how to execute the script and set up the database.

## Python Script

The script performs the following actions:
1. Loads data from a CSV file into a Pandas DataFrame.
2. Creates a SQLAlchemy engine to connect to a PostgreSQL database.
3. Writes the DataFrame to a SQL table named `borrowers`.
4. Closes the database connection.

### Script

```python
import numpy as np
import pandas as pd
import sqlalchemy as sal

# Load data from CSV file into a DataFrame
df = pd.read_csv('5k_borrowers_data.csv', encoding='unicode_escape')

# Display the shape and first few rows of the DataFrame
print("DataFrame Shape:", df.shape)
print("First few rows of the DataFrame:")
print(df.head())

# Create a SQLAlchemy engine to connect to the PostgreSQL database
engine = sal.create_engine('postgresql://postgres:password@localhost:5432/analysis_queries')

# Connect to the database
conn = engine.connect()

# Write the DataFrame to a SQL table named 'borrowers'
df.to_sql('borrowers', con=conn, index=False, if_exists='replace')

# Close the connection
conn.close()
```

### Instructions for Running the Script

1. **Install Required Packages:**
   Ensure you have the required Python packages installed. You can install them using pip:
   ```bash
   pip install numpy pandas sqlalchemy psycopg2
   ```

2. **Update Database Credentials:**
   Replace `'postgres:password@localhost:5432/analysis_queries'` with your actual PostgreSQL credentials and database details in the `create_engine` function.

3. **Prepare CSV File:**
   Ensure you have the `5k_borrowers_data.csv` file in the same directory as the script or update the file path accordingly.

4. **Run the Script:**
   Execute the script in a Jupyter Notebook or any Python environment. This will load the data from the CSV file into the PostgreSQL database.

5. **Verify Data:**
   After running the script, verify that the `borrowers` table has been created in your PostgreSQL database and contains the data from the CSV file.

# SQL Queries for Borrower Data Analysis

This repository contains SQL queries to analyze borrower data. Below are the queries and instructions for running them.

## Queries

1. **Average Loan Amount for Borrowers More Than 5 Days Past Due**
   - **Description:** Calculates the average loan amount for borrowers who are more than 5 days past due on their payments.
   - **SQL Query:**
     ```sql
     SELECT AVG("Loan Amount") AS Average_Loan_Amount
     FROM borrowers
     WHERE "Days Left to Pay Current EMI" < -5;
     ```

2. **Top 10 Borrowers with the Highest Outstanding Balances**
   - **Description:** Lists the top 10 borrowers with the highest outstanding balances.
   - **SQL Query:**
     ```sql
     SELECT "Name", "Loan Amount" - "EMI" * "Loan Term" AS Outstanding_Balance
     FROM borrowers
     ORDER BY Outstanding_Balance DESC
     LIMIT 10;
     ```

3. **List of All Borrowers with Good Repayment History**
   - **Description:** Retrieves all borrowers with a good repayment history (no delayed payments).
   - **SQL Query:**
     ```sql
     SELECT "Name", "Email Address"
     FROM borrowers
     WHERE "Delayed Payment" = 'No';
     ```

4. **Brief Analysis with Respect to Loan Type**
   - **Description:** Provides the number of borrowers and average loan amount for each loan purpose.
   - **SQL Query:**
     ```sql
     SELECT "Loan Purpose", COUNT(*) AS Number_of_Borrowers, AVG("Loan Amount") AS Average_Loan_Amount
     FROM borrowers
     GROUP BY "Loan Purpose";
     ```

## Instructions for Running Queries

1. **Set Up Your Database:**
   - Ensure that you have a SQL database set up with a table named `borrowers`.
   - Ensure that the table contains columns matching those used in the queries (e.g., "Loan Amount", "Days Left to Pay Current EMI", "EMI", "Loan Term", "Delayed Payment", "Loan Purpose").

2. **Run the Queries:**
   - Use your preferred SQL client or command-line tool to connect to your database.
   - Copy and paste the queries from the `Queries` section into your SQL client.
   - Execute the queries to view the results.

3. **Review Results:**
   - The results will be displayed in your SQL client. Review them according to the provided interpretations.

Feel free to adjust the queries and instructions based on your specific database schema and requirements.

