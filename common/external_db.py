import pyodbc
import re
from fastapi.encoders import jsonable_encoder

# ---------- Configuration ----------
server = '10.18.213.225,1433'
database = 'BusyComp0013_db12025'  # Replace with your database
username = 'mebadba'
password = 'Virgovgz@123'
sql_file = 'testing_sql.sql'  # Path to your SQL file

# ---------- Connect to SQL Server ----------
conn_str = (
    f'DRIVER={{ODBC Driver 18 for SQL Server}};'
    f'SERVER={server};'
    f'DATABASE={database};'
    f'UID={username};PWD={password};Encrypt=no;'
)
conn = pyodbc.connect(conn_str)
# cursor = conn.cursor()


def run_query(stmt):
    
    
    print(stmt,"stmtstmtstmtstmtstmtstmtstmtstmtstmt")
    
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    cursor.execute(stmt)
    rows = cursor.fetchall()
    
    
    data = []
    columns = [column[0] for column in cursor.description]  # Get column names

    for row in rows:
        data.append(dict(zip(columns, row)))

    json_data = jsonable_encoder(data)
    
    cursor.close()
    conn.close()
    
    return json_data
    
    
    