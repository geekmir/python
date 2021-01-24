import psycopg2
import requests
con = psycopg2.connect(database="post_db", user="post_user", password="password", host="127.0.0.1", port="5432")


x = requests.get('psycopg2.connect(database="post_db", user="post_user", password="password", host="127.0.0.1", port="5432")')



print(x.status_code)
print("Database opened successfully")




