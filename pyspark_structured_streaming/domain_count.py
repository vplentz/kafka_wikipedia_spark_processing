from pyspark.sql.functions import col, struct

from spark_kafka_connector import SparkKafkaConnector
from bot_filter import BotFilter

domain_conn = SparkKafkaConnector('DomainCountApp')

df = domain_conn.read_value_from_kafka('wikipedia.parsed')

df = BotFilter.filter_bot(df, False)

df = df.groupBy('value.meta.domain').count().withColumnRenamed('count', 'editCount')

df =  df.withColumn('value', struct(col('domain'), col('editCount')))

domain_conn.load_to_kafka(df, 'wikipedia.parsed.count-by-domain', 'update')

domain_conn.await_any_termination()
