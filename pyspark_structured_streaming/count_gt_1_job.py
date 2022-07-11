from pyspark.sql.functions import col, struct, window, to_json
from pyspark.sql.types import StringType

from spark_kafka_connector import SparkKafkaConnector
from bot_filter import BotFilter

domain_conn = SparkKafkaConnector('CountGT1App')

df = domain_conn.read_from_kafka('wikipedia.parsed')

df = df.filter(col('value.meta.domain') == 'commons.wikimedia.org')

df.printSchema()

df = df.groupBy(window(col('timestamp'), "5 minutes"), 
                col('value.user').alias('user'),
                col('value.meta.uri')).count().withColumnRenamed('count', 'COUNT')

df =  df.withColumn('key', to_json(struct(col('user'), col('uri').alias('URI'))))
df =  df.withColumn('value', struct(col('COUNT')))
df = df.select(col('key'), col('value'))
df.printSchema()

domain_conn.load_to_kafka(df, 'WIKIPEDIA_COUNT_GT_1', 'update')

domain_conn.await_any_termination()
