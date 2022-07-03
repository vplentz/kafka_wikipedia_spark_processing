from pyspark.sql.functions import col, struct

class BotFilter:
    @staticmethod
    def create_bytechenge_col(df):
        return df.withColumn('value',
                             struct('value.*', 
                                    (col('value.length.new') - col('value.length.old')) \
                                    .alias('BYTECHANGE')))
    @staticmethod
    def filter_bot(df, bot):
        return df.filter((col('value.bot') == bot) 
                         & (col('value.length.new').isNotNull()) 
                         & (col('value.length.new').isNotNull()))
    