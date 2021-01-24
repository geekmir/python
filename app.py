import psycopg2

con = psycopg2.connect(database="post_db", user="post_user", password="password", host="127.0.0.1", port="5432")

print("Database opened successfully")




