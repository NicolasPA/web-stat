#!/usr/bin/env bash
#
# Starts Spark streaming job
#
# Steps:
# 1: cd project root
# 2: sbt package
# 3: new console 1: bash bin/start-kafka
# 3: new console 2: bash bin/start-spark.sh
# 4: new console 3: bash bin/feed-kafka.sh
# 5: new console 4: $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic user-stat --from-beginning
# 6: Repeat step 4

export SPARK_MAJOR_VERSION=2

${SPARK_HOME}/bin/spark-submit --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.3.0 --class rocks.npa.web.stat.Main target/scala-2.11/web-stat_2.11-0.1.jar
