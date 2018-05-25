#!/usr/bin/env bash

# stop Kafka
${KAFKA_HOME}/bin/kafka-server-stop.sh
# stop Zookeeper
${KAFKA_HOME}/bin/zookeeper-server-stop.sh