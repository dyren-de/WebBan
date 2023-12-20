#open the ./insall/sql.py file and execute the sql commands
#to create the database and tables

# Path: install/sql.py
import mysql.connector
import os

def init_db():
    conn = mysql.connector.connect(
        host=os.environ.get("SQL_HOST"),
        port=os.environ.get("SQL_PORT"),
        user=os.environ.get("SQL_USER"),
        password=os.environ.get("SQL_PASSWORD"),
        database=os.environ.get("SQL_DATABASE")
    )

    with open("install/install.sql", "r") as f:
        sql_script = f.read()

    sql_statements = sql_script.split(";")

    cursor = conn.cursor()

    for sql_statement in sql_statements:
        if sql_statement.strip():
            print(f"Executing: {sql_statement}")
            cursor.execute(sql_statement)

    conn.commit()
    cursor.close()
    conn.close()


