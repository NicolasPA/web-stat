# web-stat
Basic web user statistics processing with Apache Kafka and Apache Spark structured steaming.

## Getting Started

### Prerequisites

- Java jdk1.8
- SBT 1.0+
- Apache Spark 2.3 and defined SPARK_HOME
- Apache Kafka 0.10+ and defined KAFKA_HOME

### Installing

1. Clone repository

 ```git clone https://github.com/NicolasPA/web-stat.git```
 
2. Get inside the created folder

 ```cd web-stat```
 
3. Build the jar with SBT

 ```sbt package```

### Test

1. In a new console, start Zookeeper server, Kafka server and create Kafka topics "user-visit" and "user-stat":
 
 ```bash bin/start-kafka.sh```
 
2. In a new console, start the Spark streaming job that reads "user-visit" and writes in "user-stat": 

 ```bash bin/start-spark.sh```
 
3. In a new console, feed the Kafka input topic "user-visit" with some messages: 

 ```bash bin/feed-kafka.sh``` 

4. In a new console, open a simple Kafka consumer to see what's written to "user-stat": 

 ```$KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic user-stat --from-beginning``` 
  
5. Repeat step 3 and watch logs from the Kafka consumer.