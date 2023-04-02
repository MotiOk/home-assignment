import sqlite3
import os
from dotenv import load_dotenv

load_dotenv()

# function to insert records to the services table in the db
def register_service(id, name, client, describe_command, main_parameter, secondary_parameter):
    try:
        # connect to the database
        conn = sqlite3.connect(os.environ["db_name"])
        cursor = conn.cursor()

        # execute the query and save the record into the table
        params = (id, name, client, describe_command, main_parameter, secondary_parameter)
        cursor.execute("INSERT INTO services VALUES (?,?,?,?,?,?)",params)

        # save & close the connection
        conn.commit()
        print(f'{name} Service Registered Successfuly')
        conn.close()
    except:
        print("something went wrong..")

# function to insert records to the sub_parameters table in the db
def register_parameter(id, name, description, service_id):
    try:
        # connect to the database
        conn = sqlite3.connect(os.environ["db_name"])
        cursor = conn.cursor()

        # execute the query and save the record into the table
        params = (id, name, description, service_id)
        cursor.execute("INSERT INTO sub_parameters VALUES (?,?,?,?)",params)

        # save & close the connection
        conn.commit()
        print(f'{name} Parameter Registered Successfuly')
        conn.close()
    except:
        print("something went wrong..")

