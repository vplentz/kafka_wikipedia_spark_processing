# Kafka + Spark Structured Streaming + ElasticSearch (Kibana)

This project does the same as the original [repo](https://github.com/confluentinc/cp-demo), but changes the streamming processing engine from KSQL and Kafka Streams to Spark Structured Streaming.

## Overview

The use case is a Kafka event streaming application for real-time edits to real Wikipedia pages.

Wikimedia's EventStreams publishes a continuous stream of real-time edits happening to real wiki pages.
Using Kafka Connect, a Kafka source connector `kafka-connect-sse` streams raw messages for the server sent events (SSE), and a custom Kafka Connect transform `kafka-connect-json-schema` transforms these messages and then the messages are written to a Kafka cluster.

This example Spark Structured Streamming application for data processing.

Then a Kafka sink connector `kafka-connect-elasticsearch` streams the data out of Kafka and is materialized into Elasticsearch for analysis by Kibana.

All data is using Confluent Schema Registry and Avro.

Confluent Control Center is managing and monitoring the deployment.
