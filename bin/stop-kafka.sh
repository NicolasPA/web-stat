#!/usr/bin/env bash

# Stops Kafka and Zookeeper servers

# stop Kafka
${KAFKA_HOME}/bin/kafka-server-stop.sh
# stop Zookeeper
${KAFKA_HOME}/bin/zookeeper-server-stop.sh