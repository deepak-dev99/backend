import pyodbc

# ---------- Configuration ----------
server = '127.0.0.1,11433'
database = 'YourDatabaseName'  # Replace with your database
username = 'sa'
password = 'YourStrong!Passw0rd'
sql_file = 'your_sql_file.sql'  # Path to your SQL file

# ---------- Connect to SQL Server ----------
conn_str = (
    f'DRIVER={{ODBC Driver 18 for SQL Server}};'
    f'SERVER={server};'
    f'DATABASE={database};'
    f'UID={username};PWD={password};Encrypt=no;'
)
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

# ---------- Read SQL file ----------
with open(sql_file, 'r', encoding='utf-8') as f:
    sql_content = f.read()

# ---------- Split statements ----------
# Split by 'GO' for SQL Server batch execution
statements = [s.strip() for s in sql_content.split('GO') if s.strip()]

# ---------- Execute statements ----------
for stmt in statements:
    try:
        cursor.execute(stmt)
        conn.commit()
        print("Executed successfully.")
    except Exception as e:
        print("Error executing statement:")
        print(stmt[:200])  # Print first 200 chars of statement
        print("Error:", e)

# ---------- Close connection ----------
cursor.close()
conn.close()
print("All done!")
