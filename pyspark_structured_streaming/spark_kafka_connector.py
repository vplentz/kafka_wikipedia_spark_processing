from pyspark.sql import SparkSession
from pyspark.sql.functions import col

from confluent_avro import ConfluentAvro

class SparkKafkaConnector:
    def __init__(self, app_name: str):
        self.spark_context = SparkSession.builder.appName(app_name).getOrCreate()
        self.confluent_avro = ConfluentAvro()
        print('SPARK CONTEXT')
        print(self.spark_context)
    
    def read_from_kafka(self, topic, starting_offsets='earliest'):
        df = self.spark_context.readStream.format('kafka')\
        .option('kafka.bootstrap.servers', 'kafka1:12091')\
        .option('subscribe', topic)\
        .option("startingOffsets", starting_offsets)\
        .load()
        return df.withColumn('value', self.confluent_avro.from_avro(col('value'), topic))
    
    def read_value_from_kafka(self, topic, starting_offsets='earliest'):
        df = self.read_from_kafka(topic, starting_offsets)
        return df.select(col('value'))

    def load_to_kafka(self, df, topic, output_mode='append'):
        df = df.withColumn('value', self.confluent_avro.to_avro(col('value'), topic))
        df.writeStream.format('kafka')\
        .option("kafka.bootstrap.servers", 'kafka1:12091') \
        .option("checkpointLocation", f"./checkpoints/{topic}/") \
        .option("topic", topic) \
        .outputMode(output_mode) \
        .start()

    def await_any_termination(self):
        self.spark_context.streams.awaitAnyTermination()
