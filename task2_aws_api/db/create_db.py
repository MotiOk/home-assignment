import sqlite3
import os
from dotenv import load_dotenv

load_dotenv()

def db_creation():
    # connect to the database (will create a new db if it doesn't exist)
    conn = sqlite3.connect(os.environ["db_name"])

    # create a cursor object
    cursor = conn.cursor()

    # create the 'services' table
    cursor.execute('''CREATE TABLE services
                (id INTEGER PRIMARY KEY,
                name TEXT,
                client TEXT,
                describe_method TEXT,
                main_parameter TEXT,
                secondary_parameter TEXT)''')

    # create the 'sub_parameters' table
    cursor.execute('''CREATE TABLE sub_parameters
                (id INTEGER PRIMARY KEY,
                name TEXT,
                description TEXT,
                service_id INTEGER,
                FOREIGN KEY(service_id) REFERENCES services(id))''')

    # commit the changes
    conn.commit()

    # close the connection
    conn.close()


db_creation()