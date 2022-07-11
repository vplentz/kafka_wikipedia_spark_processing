# Kafka + Spark Structured Streaming + ElasticSearch (Kibana)

This project modifies [Confluent WIKIPEDIA repo](https://github.com/confluentinc/cp-demo), changing the streamming processing engine from KSQL and Kafka Streams to Spark Structured Streaming.

|![Old Architecture](/docs/images/old_architecture.png)|
|:--:|
| Old Architecture using KStreams and K-SQL to process data.  <i>Image from [Confluent Repo](https://github.com/confluentinc/cp-demo)</i>|



|![New Architecture](/docs/images/new_architecture.jpeg)|
|:--:|
| New Architecure using PySpark to process data (the ElasticSearch and Kibana still exists if you wanna use them)|


## Overview

I was studying about Kafka using videos and tutorials from Confluent, eventually, when digging around their tutorials and videos I've got into the Wikipedia repository. 

The Wikipedia repository lifts a Docker Confluent Kafka Infrastructure (as the old architecture image). It has Kafka Connect sending Wikipedia data to topics, and real-time processing done by K-SQL and a KStreams App, and lastly the transformed data is sent to other topics which are consumed by ElasticSearch Sink Connector.

When I looked at this I thought "What if I transform all this data using PySpark Structured Streamming instead of KStreams and K-SQL? This seems a nice home project to do!!"… and that's what this repository is about.

## UIs:

After you start the Docker Containers with `./scripts/start.sh` some UIs will be available:
* localhost:9091 : Confluent Central (user: superUser, pwd: superUser);
* localhost:5601 : Kibana Dashboards;
* localhost:4040 : Spark Server Web UI (BotApp);
* localhost:4041 : Spark Server Web UI (NoBotApp);
* localhost:4042 : Spark Server Web UI (DomainCountApp);
* localhost:4043 : Spark Server Web UI (CountGT1App).
