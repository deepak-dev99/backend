import pyodbc
import re
from fastapi.encoders import jsonable_encoder

# ---------- Configuration ----------
server = '127.0.0.1,11433'
database = 'test_db'  # Replace with your database
username = 'sa'
password = 'YourStrong!Passw0rd'
sql_file = 'testing_sql.sql'  # Path to your SQL file

# ---------- Connect to SQL Server ----------
conn_str = (
    f'DRIVER={{ODBC Driver 18 for SQL Server}};'
    f'SERVER={server};'
    f'DATABASE={database};'
    f'UID={username};PWD={password};Encrypt=no;'
)
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()


def run_query(stmt):
    
    cursor.execute(stmt)
    rows = cursor.fetchall()
    
    data = []
    columns = [column[0] for column in cursor.description]  # Get column names

    for row in rows:
        data.append(dict(zip(columns, row)))

    json_data = jsonable_encoder(data)
    
    
    return json_data
    
    
    