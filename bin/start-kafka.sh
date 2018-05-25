#!/usr/bin/env bash

# Start Zookeeper, Kafka, create Kafka topic, describe topic

# start Zookeeper
${KAFKA_HOME}/bin/zookeeper-server-start.sh ${KAFKA_HOME}/config/zookeeper.properties &
# start Kafka
${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties &

# create topics
# input: user-visit, retention 5 days
${KAFKA_HOME}/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --log.retention.hours 120 --topic user-visit
# output: user-stat, retention 10 days
${KAFKA_HOME}/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --log.retention.hours 240 --topic user-stat

# describe topics
${KAFKA_HOME}/bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic user-visit
${KAFKA_HOME}/bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic user-stat
