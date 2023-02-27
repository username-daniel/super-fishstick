import dotenv
import mysql.connector
import mysql.connector as db_conn
from dotenv import load_dotenv

load_dotenv()

GUSER = dotenv.dotenv_values().get("GETUSER")
GPASSWORD = dotenv.dotenv_values().get("GETPASSWORD")
GHOST = dotenv.dotenv_values().get("GETHOST")
GDATABASE = dotenv.dotenv_values().get("GETDATABASE")

try:
    dbg = db_conn.connect(user=GUSER, password=GPASSWORD, host=GHOST, database=GDATABASE)
    getdb = dbg.cursor()
except db_conn.Error:
    print("Error you started without a piece !!")

PUSER = dotenv.dotenv_values().get("POSTUSER")
PPASSWORD = dotenv.dotenv_values().get("POSTPASSWORD")
PHOST = dotenv.dotenv_values().get("POSTHOST")
PDATABASE = dotenv.dotenv_values().get("POSTDATABASE")

try:
    dbp = db_conn.connect(user=PUSER, password=PPASSWORD, host=PHOST, database=PDATABASE)
    postdb = dbp.cursor()
except db_conn.Error:
    print("Error you started without a piece !!")
