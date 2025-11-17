!pip install pyspark

from pyspark.sql import SparkSession

# Create the new session using the most forceful configuration
spark = SparkSession.builder \
    .appName("JDBCFix") \
    .config("spark.driver.extraClassPath", '/kaggle/input/jarfile/sqlite-jdbc-3.45.1.0.jar') \
    .getOrCreate()

print(spark.sparkContext.getConf().get("spark.driver.extraClassPath"))

from pyspark.sql.functions import *
import sqlite3
import os

if os.path.exists('/kaggle/working/ecommerce.db'):
    print('Already DB Exists')
    pass
else:
    sqlite3.connect('ecommerce.db')

db_file_path = "jdbc:sqlite:/kaggle/working/ecommerce.db"
# Converted into a dataframe
def sqltodf(query):
    df=spark.read.format("jdbc") \
        .option("url",f"{db_file_path}") \
        .option("driver","org.sqlite.JDBC") \
        .option("dbtable",f"{query}").load()
    return df

df=sqltodf(f"(select tbl_name from sqlite_master)")
df.show(truncate=False)