POC on web-stat with Spark Structured Streaming and Kafka

Steps:
1: cd project root
2: sbt package
3: new console 1: bash bin/start-kafka
3: new console 2: bash bin/start-spark.sh
4: new console 3: bash bin/feed-kafka.sh
5: new console 4: $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic user-stat --from-beginning
6: Repeat step 4