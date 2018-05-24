#!/usr/bin/env bash

export SPARK_MAJOR_VERSION=2

${SPARK_HOME}/bin/spark-submit --class rocks.npa.web.stat.Main target/scala-2.11/web-stat_2.11-0.1.jar
