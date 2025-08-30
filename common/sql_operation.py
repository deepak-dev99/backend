from base import *

class CommonDB:
    
    
    def __init__(self):
        
        
        try:
                
            # Step 1: Connect to the default 'postgres' DB with autocommit
            db_connect = psycopg2.connect(
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT"),
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                dbname="postgres"  # important: connect to existing DB to create new one
            )
            db_connect.autocommit = True  # ✅ REQUIRED for CREATE DATABASE
            cur = db_connect.cursor()

            # Step 2: Check if target DB exists
            target_db = os.getenv("DB_NAME")
            cur.execute("SELECT datname FROM pg_database WHERE datistemplate = false;")
            dbs = [db[0] for db in cur.fetchall()]
            if target_db not in dbs:
                cur.execute(f"CREATE DATABASE {target_db}")
                print(f"✅ Database '{target_db}' created.")
            else:
                print(f"ℹ️ Database '{target_db}' already exists.")

            cur.close()
            db_connect.close()

            # Step 3: Connect to the target DB
            self.db_connect = psycopg2.connect(
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT"),
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                dbname=target_db
            )
            
            
            # if target_db not in dbs:
                # migrator(self.db_connect)

        except Exception as e:
            print("Error name:", type(e).__name__)
            print("Error message:", str(e))
            print(f"{type(e).__name__}: {e}")
            traceback.print_exc()

    def create_database(self):
        
        print(self.db_conn, "✅ Connection to target DB is ready")



    def get_data(self,sql_query,data):
        
        cur = self.db_connect.cursor()
        cur.execute(sql_query,data)
        
        return cur.fetchall()
        
        
    def get_data_as_json(self, sql_query,data):
        cur = self.db_connect.cursor()
        cur.execute(sql_query,data)

        # Get column names
        columns = [desc[0] for desc in cur.description]

        # Fetch rows and convert to list of dicts
        rows = cur.fetchall()
        result = [dict(zip(columns, row)) for row in rows]

        cur.close()

        # Return as pretty JSON string
        return result

    
    
    def save_data(self, sql_query, data):
        cur = self.db_connect.cursor()
        try:
            cur.execute(sql_query, data)
            self.db_connect.commit()
            affected = cur.rowcount  # Number of rows affected
            cur.close()
            return {"success": True, "rows_affected": affected}
        except Exception as e:
            self.db_connect.rollback()
            cur.close()
            return {"success": False, "error": str(e)}




    
    
    def delete_data(self, sql_query, data):
        cur = self.db_connect.cursor()
        try:
            cur.execute(sql_query, data)
            self.db_connect.commit()
            affected = cur.rowcount  # Number of rows affected
            cur.close()
            return {"success": True, "rows_affected": affected}
        except Exception as e:
            self.db_connect.rollback()
            cur.close()
            return {"success": False, "error": str(e)}







def migrator_v2(db_connect):
    print("migrator_v2")
    
    """
    CREATE TABLE category (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
        category_name VARCHAR(255) NOT NULL UNIQUE,
        status BOOLEAN DEFAULT TRUE,
        created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
        deleted BOOLEAN DEFAULT FALSE
    );
    
    
    
    CREATE TABLE sub_category(  
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
        category_id UUID,
        sub_category_name VARCHAR(255),
        status BOOLEAN DEFAULT TRUE,
        created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
        deleted BOOLEAN DEFAULT FALSE
    );
    
    
    
    
    
    CREATE TABLE product_type(  
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
        category_id UUID,
        sub_category_id UUID,
        product_type_name VARCHAR(255),
        status BOOLEAN DEFAULT True,
        created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
        deleted BOOLEAN DEFAULT FALSE
    );
        
        
    


    """
    
    print("migrator_v2")



def migrator(db_connect):
    user_table_create = '''
    
    
    
    
    
    
    
    
    


CREATE TABLE users(  
        id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(255),
        username VARCHAR(255),
        email VARCHAR(255),
        mobile_number VARCHAR(255),
        password VARCHAR(255),
        status BOOLEAN
    );

    


    CREATE TABLE category(  
        id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        category_name VARCHAR(255),
        status BOOLEAN DEFAULT True);


    CREATE TABLE sub_category(  
        id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        category_id INT,
        sub_category_name VARCHAR(255),
        status BOOLEAN DEFAULT True);

        
    CREATE TABLE product_type(  
        id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        category_id INT,
        sub_category_id INT,
        product_type_name VARCHAR(255),
        status BOOLEAN DEFAULT True);

    
    
    
        
    CREATE TABLE customers (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE,
        phone VARCHAR(50),
        address TEXT,
        city VARCHAR(100),
        state VARCHAR(100),
        country VARCHAR(100),
        zip_code VARCHAR(20),
        customer_type VARCHAR(50), -- e.g., 'Individual', 'Business'
        status BOOLEAN DEFAULT TRUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );




    CREATE TABLE sub_customers (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        customer_id INT NOT NULL,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255),
        phone VARCHAR(50),
        address TEXT,
        city VARCHAR(100),
        state VARCHAR(100),
        country VARCHAR(100),
        zip_code VARCHAR(20),
        status BOOLEAN DEFAULT TRUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
    );

    
    '''
    
    
    print("going to create table start")
    try:
            
        cur = db_connect.cursor()
        cur.execute(user_table_create)
        cur.close()
        
    except Exception as e:
        print(e)
        
        pass
    print("going to create table stop")
    
    