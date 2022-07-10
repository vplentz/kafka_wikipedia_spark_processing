from bot_filter import BotFilter
from spark_kafka_connector import SparkKafkaConnector

no_bot_conn = SparkKafkaConnector('NoBotApp')

no_bot_df = no_bot_conn.read_from_kafka('wikipedia.parsed')

no_bot_df = BotFilter.transform(no_bot_df, False)

no_bot_conn.load_to_kafka(no_bot_df, 'WIKIPEDIANOBOT')

no_bot_conn.await_any_termination()