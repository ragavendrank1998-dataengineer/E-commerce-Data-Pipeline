!pip install pyspark

from pyspark.sql import SparkSession

# Create the new session using the most forceful configuration
spark = SparkSession.builder \
    .appName("JDBCFix") \
    .config("spark.driver.extraClassPath", '/kaggle/input/jarfile/sqlite-jdbc-3.45.1.0.jar') \
    .getOrCreate()

print(spark.sparkContext.getConf().get("spark.driver.extraClassPath"))

from pyspark.sql.functions import *
from pyspark.sql.types import *
import sqlite3
import os

if os.path.exists('/kaggle/working/ecommerce.db'):
    print('Already DB Exists')
    pass
else:
    sqlite3.connect('ecommerce.db')

db_file_path = "jdbc:sqlite:/kaggle/working/ecommerce.db"

#Dataframe written into the table

def writetodb(df_to_write,tbl_name):
    tbl_col=sqltodf(f'(select * from {tbl_name} where 1=0)')
    df_write = df_to_write.select(*tbl_col.columns)
    df_write.write.format("jdbc") \
        .option("url",f"{db_file_path}") \
        .option("driver","org.sqlite.JDBC") \
        .option("dbtable",f"{tbl_name}") \
        .mode("append") \
        .save()
		
df_src=spark.read.csv("/kaggle/input/ecommerce-files/olist_customers_dataset.csv",header=True,sep=',')
df_src=df_src.withColumn('file_name',lit('olist_customers_dataset'))
df_src=df_src.withColumn('file_process_date',lit(current_date()).cast(DateType()))
df_src.show(5,truncate=False)
print(df_src.count())

writetodb(df_src,'stg_customers')