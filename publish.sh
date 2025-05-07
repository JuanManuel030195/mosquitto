#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: ./publish.sh <topic> <message>"
  exit 1
fi

TOPIC=$1
MESSAGE=$2
CONTAINER_NAME="mosquitto-broker"

# Publish the message using the Mosquitto client inside the container
docker exec -it $CONTAINER_NAME mosquitto_pub -t "$TOPIC" -m "$MESSAGE"

# Check if the publish was successful
if [ $? -eq 0 ]; then
  echo "Message published to topic '$TOPIC': $MESSAGE"
else
  echo "Failed to publish message."
  exit 1
fi