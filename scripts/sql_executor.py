!pip install pyspark

from pyspark.sql import SparkSession

# Create the new session using the most forceful configuration
spark = SparkSession.builder \
    .appName("JDBCFix") \
    .config("spark.driver.extraClassPath", '/kaggle/input/jarfile/sqlite-jdbc-3.45.1.0.jar') \
    .getOrCreate()

print(spark.sparkContext.getConf().get("spark.driver.extraClassPath"))

from py4j.java_gateway import java_import
import sqlite3
import os

if os.path.exists('/kaggle/working/ecommerce.db'):
    print('Already DB Exists')
    pass
else:
    sqlite3.connect('ecommerce.db')

db_file_path = "jdbc:sqlite:/kaggle/working/ecommerce.db"

def excutequery(query):
    gateway = spark.sparkContext._gateway
    java_import(gateway.jvm, 'java.sql.DriverManager')
    connection = gateway.jvm.DriverManager.getConnection(db_file_path)
    statement = connection.createStatement()
    statement.executeUpdate(query)

query="""
    CREATE TABLE IF NOT EXISTS stg_customers (
        customer_id TEXT,
        customer_unique_id TEXT,
        customer_zip_code_prefix INTEGER,
        customer_city TEXT,
        customer_state TEXT,
        file_name Text,
        file_process_date Date
     )"""
excutequery(query)

query="""
    CREATE TABLE IF NOT EXISTS per_customers (
        customer_id TEXT,
        customer_unique_id TEXT,
        customer_zip_code_prefix INTEGER,
        customer_city TEXT,
        customer_state TEXT,
        insert_updt_flag Text,
        insert_updt_ts timestamp,
        active_flg Text,
        file_name Text,
        created_date Date
     )"""
excutequery(query)