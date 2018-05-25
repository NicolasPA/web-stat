#!/usr/bin/env bash

# Delete all messages in the Kafka topics by setting retention time to 1ms and back to previous retention time

# Topics to delete: ( "topic-name1",retention1 "topic-name2",retention2 ...)
declare -a kafkaTopics=( "user-visit",120 "user-stat",240 )


OLDIFS=$IFS
IFS=','

for i in "${kafkaTopics[@]}"
do
    set -- $i # splits name and retention
    echo "Setting retention to 1ms for Kafka topic ${1}:"
    ${KAFKA_HOME}/bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name ${1} --alter --add-config retention.ms=1
    sleep 5
    ${KAFKA_HOME}/bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name ${1} --describe

    echo "Setting retention back to ${2} hours for Kafka topic ${1}:"
    ${KAFKA_HOME}/bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name ${1} --alter --add-config retention.ms=$(( ${2} * 3600 * 1000))
    ${KAFKA_HOME}/bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name ${1} --describe

done

IFS=$OLDIFS


# Loop for each given topic
#for i in "${kafkaTopics[@]}"
#do
#    echo "Existing messages in Kafka topic 'user-visit':"
#    ${KAFKA_HOME}/bin/kafka-console-consumer.sh --bootstrap-server localhost:2181 --topic user-visit --from-beginning
#
#    echo "Setting retention to 1ms for Kafka topic 'user-visit':"
#    ${KAFKA_HOME}/bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name user-visit --alter --add-config retention.ms=1
#    ${KAFKA_HOME}/bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name user-visit --describe
#
#    echo "Existing messages in Kafka topic 'user-visit':"
#    ${KAFKA_HOME}/bin/kafka-console-consumer.sh --bootstrap-server localhost:2181 --topic user-visit --from-beginning
#
#    echo "Setting retention back to normal for Kafka topic 'user-visit':"
#    ${KAFKA_HOME}/bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name user-visit --alter --add-config retention.hours=120
#    ${KAFKA_HOME}/bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name user-visit --describe
#done


