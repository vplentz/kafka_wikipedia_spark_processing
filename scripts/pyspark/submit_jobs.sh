#!/bin/bash

nohup spark-submit --repositories https://packages.confluent.io/maven --packages org.apache.spark:spark-streaming-kafka-0-10_2.12:3.2.1,org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.1,io.confluent:kafka-schema-registry-client:7.1.1,io.confluent:kafka-avro-serializer:7.1.1,za.co.absa:abris_2.12:6.3.0 work/pyspark_structured_streaming/bot_job.py &> bot.out &

nohup spark-submit --repositories https://packages.confluent.io/maven --packages org.apache.spark:spark-streaming-kafka-0-10_2.12:3.2.1,org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.1,io.confluent:kafka-schema-registry-client:7.1.1,io.confluent:kafka-avro-serializer:7.1.1,za.co.absa:abris_2.12:6.3.0 work/pyspark_structured_streaming/no_bot_job.py &> no_bot.out &

nohup spark-submit --repositories https://packages.confluent.io/maven --packages org.apache.spark:spark-streaming-kafka-0-10_2.12:3.2.1,org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.1,io.confluent:kafka-schema-registry-client:7.1.1,io.confluent:kafka-avro-serializer:7.1.1,za.co.absa:abris_2.12:6.3.0 work/pyspark_structured_streaming/domain_count.py &> domain_count.out &

nohup spark-submit --repositories https://packages.confluent.io/maven --packages org.apache.spark:spark-streaming-kafka-0-10_2.12:3.2.1,org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.1,io.confluent:kafka-schema-registry-client:7.1.1,io.confluent:kafka-avro-serializer:7.1.1,za.co.absa:abris_2.12:6.3.0 work/pyspark_structured_streaming/count_gt_1_job.py &> count_gt_1.out

tail -F /dev/null