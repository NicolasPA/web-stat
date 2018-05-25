#!/usr/bin/env bash

date1=$(date +%Y-%m-%dT%H:%M:%S.%3NZ)
sleep 1
date2=$(date +%Y-%m-%dT%H:%M:%S.%3NZ)
sleep 1
date3=$(date +%Y-%m-%dT%H:%M:%S.%3NZ)

declare -a kafkaMessages=(
'{"user_id": "019mr8mf4r","name": "Pricing Page","timestamp": "'"$date1"'"}'
'{"user_id": "119mr8mf4r","name": "Front Page","timestamp": "'"$date2"'"}'
'{"user_id": "219mr8mf4r","name": "Info Page","timestamp": "'"$date3"'"}'
)


for message in "${kafkaMessages[@]}"
do
    echo "${message}" | ${KAFKA_HOME}/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic user-visit
done


