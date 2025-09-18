import pandas as pd
import sqlite3

# Read the CSV file
csv_file = 'Online_Retail.csv'
df = pd.read_csv(csv_file)

# Connect to SQLite database (or create it)
db_file = 'Online_Retail.db'
conn = sqlite3.connect(db_file)

# Write the DataFrame to the SQLite database
table_name = 'retail_data'
df.to_sql(table_name, conn, if_exists='replace', index=False)

print(f"CSV data has been written to {db_file} in table '{table_name}'.")

# Close the connection
conn.close()
