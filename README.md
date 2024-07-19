# LastName_FirstName_DebtCollectionETL

### Python Script in Jupyter Notebook

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

