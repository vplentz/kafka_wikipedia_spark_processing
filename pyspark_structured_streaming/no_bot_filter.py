from spark_kafka_connector import SparkKafkaConnector

from bot_filter import BotFilter

spark_kafka_conn = SparkKafkaConnector("NoBotFilter")

wikipedia_df = spark_kafka_conn.read_from_kafka('wikipedia.parsed')

wikipedia_df = BotFilter.create_bytechenge_col(wikipedia_df)

no_bots_df = BotFilter.filter_bot(wikipedia_df, False)

spark_kafka_conn.load_to_kafka(no_bots_df, 'WIKIPEDIANOBOT')