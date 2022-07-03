from pyspark.sql import SparkSession
from pyspark.sql.functions import col

from confluent_avro import ConfluentAvro

class SparkKafkaConnector:
    def __init__(self, app_name: str):
        self.spark_context = SparkSession.builder.appName(app_name).getOrCreate()
        self.confluent_avro = ConfluentAvro()
    
    def read_from_kafka(self, topic, starting_offsets='earliest'):
        wikipedia_df = self.spark_context.readStream.format('kafka')\
        .option('kafka.bootstrap.servers', 'kafka1:12091')\
        .option('subscribe', topic)\
        .option("startingOffsets", starting_offsets)\
        .load()
        wikipedia_df = wikipedia_df.select(col('value'))
        return wikipedia_df.withColumn('value', self.confluent_avro.from_avro(col('value'), topic))
    
    def load_to_kafka(self, df, topic):
        df = df.withColumn('value', self.confluent_avro.to_avro(col('value'), topic))
        df.writeStream.format('kafka')\
        .option("kafka.bootstrap.servers", 'kafka1:12091') \
        .option("checkpointLocation", "./checkpoints/") \
        .option("topic", topic) \
        .outputMode("append") \
        .start()
        self.spark_context.streams.awaitAnyTermination()  