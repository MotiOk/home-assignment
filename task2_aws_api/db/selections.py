import sqlite3
import pandas as pd
import os
from dotenv import load_dotenv

load_dotenv()

# function to select all the services records in the db
def get_services():
    df_services = None
    # try:
        # connect to the database
    conn = sqlite3.connect(os.environ["db_name"])

    # execute the query and read the results into a df
    df_services = pd.read_sql_query('''SELECT * FROM services''', conn)

    # close the connection
    conn.close()
    # except:
    #     print ("something went wrong with the get_services..")

    return df_services

# function to select all the sub_parameters records linked to the service_id
def get_parameters(service_id):
    df_parameters = None
    try:
        # connect to the database
        conn = sqlite3.connect(os.environ["db_name"])

        # execute the query and read the results into a df
        df_parameters = pd.read_sql_query(f'''SELECT * FROM sub_parameters WHERE service_id = '{service_id}' ''', conn)

        # close the connection
        conn.close()
    except:
        print("something went wrong with the get_parameters..")
    
    return df_parameters