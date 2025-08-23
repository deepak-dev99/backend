import pyodbc

conn = pyodbc.connect(r'DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=C:\BusyWin\DATA\BUSYCOMPANY.mdb;')
cursor = conn.cursor()

cursor.execute("SELECT TOP 10 * FROM Ledger")
for row in cursor.fetchall():
    print(row)