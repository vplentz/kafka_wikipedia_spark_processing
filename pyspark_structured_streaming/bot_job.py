from bot_filter import BotFilter
from spark_kafka_connector import SparkKafkaConnector

bot_conn = SparkKafkaConnector('BotApp')

bot_df = bot_conn.read_from_kafka('wikipedia.parsed')

bot_df = BotFilter.transform(bot_df, False)

bot_conn.load_to_kafka(bot_df, 'WIKIPEDIABOT')

bot_conn.await_any_termination()