from pyspark.sql import SparkSession
from pyspark.sql.types import *
from pyspark.sql.functions import col, udf, struct
from pyspark import SparkContext
from pyspark.sql.column import Column, _to_java_column

spark_context = SparkSession.builder.appName('processingBots').getOrCreate()

def from_avro(col, config):
    """
    avro deserialize

    :param col (PySpark column / str): column name "key" or "value"
    :param config (za.co.absa.abris.config.FromAvroConfig): abris config, generated from abris_config helper function
    :return: PySpark Column
    """
    jvm_gateway = SparkContext._active_spark_context._gateway.jvm
    abris_avro = jvm_gateway.za.co.absa.abris.avro

    return Column(abris_avro.functions.from_avro(_to_java_column(col), config))

def from_avro_abris_config(config_map, topic, is_key):
    """
    Create from avro abris config with a schema url

    :param config_map (dict[str, str]): configuration map to pass to deserializer, ex: {'schema.registry.url': 'http://localhost:8081'}
    :param topic (str): kafka topic
    :param is_key (bool): boolean
    :return: za.co.absa.abris.config.FromAvroConfig
    """
    jvm_gateway = SparkContext._active_spark_context._gateway.jvm
    scala_map = jvm_gateway.PythonUtils.toScalaMap(config_map)

    return jvm_gateway.za.co.absa.abris.config \
        .AbrisConfig \
        .fromConfluentAvro() \
        .downloadReaderSchemaByLatestVersion() \
        .andTopicNameStrategy(topic, is_key) \
        .usingSchemaRegistry(scala_map)

starting_offsets = 'earliest'

wikipedia_df = spark_context.readStream.format('kafka')\
    .option('kafka.bootstrap.servers', 'kafka1:12091')\
    .option('subscribe', 'wikipedia.parsed')\
    .option("startingOffsets", starting_offsets)\
    .load()

confluent_config = {
    'schema.registry.url':'https://schemaregistry:8085',
    "schema.registry.ssl.truststore.location" :"/home/jovyan/work/scripts/security/kafka.schemaregistry.truststore.jks",
    "schema.registry.ssl.truststore.password": 'confluent',
    "schema.registry.ssl.keystore.location": '/home/jovyan/work/scripts/security/kafka.schemaregistry.keystore.jks',
    "schema.registry.ssl.keystore.password" : "confluent",
    "basic.auth.credentials.source": "USER_INFO",
    "basic.auth.user.info": "superUser:superUser"
} 
from_avro_abris_settings = from_avro_abris_config(confluent_config, 'wikipedia.parsed', False)
wikipedia_df = wikipedia_df.withColumn('value', from_avro(col('value'), from_avro_abris_settings))

wikipedia_df = wikipedia_df.withColumn('value', struct('value.*', 
                                       (col('value.length.new') - col('value.length.old')).alias('BYTECHANGE')))
#bots_df = wikipedia_df.filter((col('value.bot') == True) & (col('value.length.new').isNotNull()) & (col('value.length.new').isNotNull()))
no_bots_df = wikipedia_df.filter((col('value.bot') == False) & (col('value.length.new').isNotNull()) & (col('value.length.new').isNotNull()))

def to_avro(col, config):
    """
    avro serialize
    :param col (PySpark column / str): column name "key" or "value"
    :param config (za.co.absa.abris.config.ToAvroConfig): abris config, generated from abris_config helper function
    :return: PySpark Column
    """
    jvm_gateway = SparkContext._active_spark_context._gateway.jvm
    abris_avro = jvm_gateway.za.co.absa.abris.avro

    return Column(abris_avro.functions.to_avro(_to_java_column(col), config))

def to_avro_abris_config(config_map, topic, is_key):
    """
    Create to avro abris config with a schema url

    :param config_map (dict[str, str]): configuration map to pass to the serializer, ex: {'schema.registry.url': 'http://localhost:8081'}
    :param topic (str): kafka topic
    :param is_key (bool): boolean
    :return: za.co.absa.abris.config.ToAvroConfig
    """
    jvm_gateway = SparkContext._active_spark_context._gateway.jvm
    scala_map = jvm_gateway.PythonUtils.toScalaMap(config_map)

    return jvm_gateway.za.co.absa.abris.config \
        .AbrisConfig \
        .toConfluentAvro() \
        .downloadSchemaByLatestVersion() \
        .andTopicNameStrategy(topic, is_key) \
        .usingSchemaRegistry(scala_map)

no_bots_df = no_bots_df.select(col('value'))
to_avro_abris_settings = to_avro_abris_config(confluent_config, 'WIKIPEDIANOBOT', False)
no_bots_df = no_bots_df.withColumn('value', to_avro(col('value'), to_avro_abris_settings))
no_bots_df.writeStream.format('kafka')\
    .option("kafka.bootstrap.servers", 'kafka1:12091') \
    .option("checkpointLocation", "./checkpoints/") \
    .option("topic", "WIKIPEDIANOBOT") \
    .outputMode("append") \
    .start()
spark_context.streams.awaitAnyTermination()  