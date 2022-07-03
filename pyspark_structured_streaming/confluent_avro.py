from pyspark import SparkContext
from pyspark.sql.column import Column, _to_java_column

class ConfluentAvro:

    def __init__(self, confluent_config:dict= {
            'schema.registry.url':'https://schemaregistry:8085',
            "schema.registry.ssl.truststore.location" :"/home/jovyan/work/scripts/security/kafka.schemaregistry.truststore.jks",
            "schema.registry.ssl.truststore.password": 'confluent',
            "schema.registry.ssl.keystore.location": '/home/jovyan/work/scripts/security/kafka.schemaregistry.keystore.jks',
            "schema.registry.ssl.keystore.password" : "confluent",
            "basic.auth.credentials.source": "USER_INFO",
            "basic.auth.user.info": "superUser:superUser"
        }):        
        self.jvm_gateway = SparkContext._active_spark_context._gateway.jvm
        self.scala_map = self.jvm_gateway.PythonUtils.toScalaMap(confluent_config)
        self.abris_avro = self.jvm_gateway.za.co.absa.abris.avro

    def from_avro(self, col, topic):
        return Column(self.abris_avro.functions.from_avro(_to_java_column(col), self.from_avro_abris_config(topic)))

    def from_avro_abris_config(self, topic, is_key=False):
        return self.jvm_gateway.za.co.absa.abris.config \
            .AbrisConfig \
            .fromConfluentAvro() \
            .downloadReaderSchemaByLatestVersion() \
            .andTopicNameStrategy(topic, is_key) \
            .usingSchemaRegistry(self.scala_map)

    def to_avro(self, col, topic):
        return Column(self.abris_avro.functions.to_avro(
            _to_java_column(col),
            self.to_avro_abris_config(topic)))

    def to_avro_abris_config(self, topic, is_key=False):
        return self.jvm_gateway.za.co.absa.abris.config \
            .AbrisConfig \
            .toConfluentAvro() \
            .downloadSchemaByLatestVersion() \
            .andTopicNameStrategy(topic, is_key) \
            .usingSchemaRegistry(self.scala_map)
