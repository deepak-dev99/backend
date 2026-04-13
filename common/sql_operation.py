from base import *
import psycopg2
import os
import traceback



class CommonDB:

    def __init__(self):
        try:
            # ✅ Step 1: Connect to default DB
            db_connect = psycopg2.connect(
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT"),
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                dbname="postgres"
            )
            db_connect.autocommit = True
            cur = db_connect.cursor()

            # ✅ Step 2: Create DB if not exists
            target_db = os.getenv("DB_NAME")

            cur.execute("SELECT datname FROM pg_database WHERE datistemplate = false;")
            dbs = [db[0] for db in cur.fetchall()]

            if target_db not in dbs:
                cur.execute(f'CREATE DATABASE "{target_db}"')
                print(f"✅ Database '{target_db}' created.")
            else:
                print(f"ℹ️ Database '{target_db}' already exists.")

            cur.close()
            db_connect.close()

            # ✅ Step 3: Connect to actual DB
            self.db_connect = psycopg2.connect(
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT"),
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                dbname=target_db
            )

        except Exception as e:
            print("DB Init Error:", str(e))
            traceback.print_exc()

    # -------------------------------
    # ✅ Helpers
    # -------------------------------

    def _extract_table_name(self, sql_query):
        try:
            sql = sql_query.lower()
            if "into" in sql:
                return sql.split("into")[1].split("(")[0].strip()
            return None
        except:
            return None

    def _get_primary_key(self, cur, table_name):
        try:
            pk_query = """
                SELECT a.attname
                FROM pg_index i
                JOIN pg_attribute a 
                ON a.attrelid = i.indrelid
                AND a.attnum = ANY(i.indkey)
                WHERE i.indrelid = %s::regclass
                AND i.indisprimary;
            """
            cur.execute(pk_query, (table_name,))
            result = cur.fetchone()
            return result[0] if result else None
        except:
            return None

    def _has_uuid_column(self, cur, table_name):
        try:
            query = """
                SELECT 1
                FROM information_schema.columns
                WHERE table_name = %s
                AND column_name = 'uuid'
                LIMIT 1;
            """
            cur.execute(query, (table_name,))
            return cur.fetchone() is not None
        except:
            return False

    # -------------------------------
    # ✅ SELECT
    # -------------------------------

    def get_data(self, sql_query, data=None):
        cur = self.db_connect.cursor()
        cur.execute(sql_query, data)
        result = cur.fetchall()
        cur.close()
        return result

    def get_data_as_json(self, sql_query, data=None):
        cur = self.db_connect.cursor()
        cur.execute(sql_query, data)

        columns = [desc[0] for desc in cur.description]
        rows = cur.fetchall()

        cur.close()

        return [dict(zip(columns, row)) for row in rows]

    # -------------------------------
    # ✅ INSERT (SAFE)
    # -------------------------------

    def save_data(self, sql_query, data):
        cur = self.db_connect.cursor()

        try:
            modified_query = sql_query

            # ✅ Only for INSERT
            if "INSERT" in sql_query.upper() and "RETURNING" not in sql_query.upper():

                table_name = self._extract_table_name(sql_query)
                returning_column = None

                if table_name:
                    # Priority 1: uuid
                    if self._has_uuid_column(cur, table_name):
                        returning_column = "uuid"
                    else:
                        # Priority 2: primary key (id)
                        returning_column = self._get_primary_key(cur, table_name)

                # ✅ Add RETURNING only once
                if returning_column:
                    modified_query = sql_query.rstrip(";") + f" RETURNING {returning_column};"

            print("FINAL QUERY:", modified_query)

            cur.execute(modified_query, data)

            new_id = None

            # ✅ Safe fetch
            try:
                result = cur.fetchone()
                if result:
                    new_id = result[0]
            except:
                pass

            self.db_connect.commit()

            affected = cur.rowcount

            cur.close()

            return {
                "success": True,
                "rows_affected": affected,
                "new_id": new_id
            }

        except Exception as e:
            self.db_connect.rollback()
            cur.close()

            traceback.print_exc()

            return {
                "success": False,
                "error": str(e)
            }

    # -------------------------------
    # ✅ UPDATE / DELETE
    # -------------------------------

    def execute_update_query(self, sql_query, data=None):
        cur = self.db_connect.cursor()
        try:
            cur.execute(sql_query, data)
            self.db_connect.commit()

            affected = cur.rowcount
            cur.close()

            return {"success": True, "rows_affected": affected}

        except Exception as e:
            self.db_connect.rollback()
            cur.close()

            traceback.print_exc()

            return {"success": False, "error": str(e)}

    def delete_data(self, sql_query, data):
        return self.execute_update_query(sql_query, data)

    def execute_query(self, sql_query, data=None):
        return self.execute_update_query(sql_query, data)




# ---------------------------------------
# ✅ MIGRATOR
# ---------------------------------------

def migrator(db_connect):
    print("🚀 Running migrator...")

    queries = [

        # USERS
        """
        CREATE TABLE IF NOT EXISTS users(
            id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            name VARCHAR(255),
            username VARCHAR(255),
            email VARCHAR(255),
            mobile_number VARCHAR(255),
            password VARCHAR(255),
            status BOOLEAN
        );
        """,

        # CATEGORY
        """
        CREATE TABLE IF NOT EXISTS category(
            id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            uuid UUID UNIQUE DEFAULT gen_random_uuid(),
            category_name VARCHAR(255),
            status BOOLEAN DEFAULT TRUE
        );
        """,

        # SUB CATEGORY
        """
        CREATE TABLE IF NOT EXISTS sub_category(
            id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            uuid UUID UNIQUE DEFAULT gen_random_uuid(),
            category_id INT,
            sub_category_name VARCHAR(255),
            status BOOLEAN DEFAULT TRUE
        );
        """,

        # PRODUCT TYPE
        """
        CREATE TABLE IF NOT EXISTS product_type(
            id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            uuid UUID UNIQUE DEFAULT gen_random_uuid(),
            category_id INT,
            sub_category_id INT,
            product_type_name VARCHAR(255),
            status BOOLEAN DEFAULT TRUE
        );
        """,

        # CUSTOMERS
        """
        CREATE TABLE IF NOT EXISTS customers (
            id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) UNIQUE,
            phone VARCHAR(50),
            address TEXT,
            city VARCHAR(100),
            state VARCHAR(100),
            country VARCHAR(100),
            zip_code VARCHAR(20),
            customer_type VARCHAR(50),
            status BOOLEAN DEFAULT TRUE,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        """,

        # SUB CUSTOMERS
        """
        CREATE TABLE IF NOT EXISTS sub_customers (
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
        """
    ]

    try:
        cur = db_connect.cursor()

        for query in queries:
            cur.execute(query)

        db_connect.commit()
        cur.close()

        print("✅ Migration completed")

    except Exception as e:
        print("Migration Error:", str(e))
        traceback.print_exc()