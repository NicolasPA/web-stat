#!/usr/bin/env bash
#
# Starts Spark streaming job
#


export SPARK_MAJOR_VERSION=2

${SPARK_HOME}/bin/spark-submit --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.3.0 --class rocks.npa.web.stat.Main target/scala-2.11/web-stat_2.11-0.1.jar
