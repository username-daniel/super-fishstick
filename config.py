import dotenv
import mysql.connector as db_conn
from dotenv import load_dotenv

load_dotenv()

USER = dotenv.dotenv_values().get("USER")
PASSWORD = dotenv.dotenv_values().get("PASSWORD")
HOST = dotenv.dotenv_values().get("HOST")
DATABASE = dotenv.dotenv_values().get("DATABASE")

try:
    dbp = db_conn.connect(user=USER, password=PASSWORD, host=HOST, database=DATABASE)
    db = dbp.cursor()
except db_conn.Error:
    print("Error you started without a piece !!")
