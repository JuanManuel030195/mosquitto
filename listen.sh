#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: ./listen.sh <topic>"
  exit 1
fi

TOPIC=$1
CONTAINER_NAME="mosquitto-broker"

# Subscribe to the topic using the Mosquitto client inside the container
docker exec -it $CONTAINER_NAME mosquitto_sub -t "$TOPIC"

# Check if the subscription was successful
if [ $? -eq 0 ]; then
  echo "Subscribed to topic '$TOPIC'. Listening for messages..."
else
  echo "Failed to subscribe to topic '$TOPIC'."
  exit 1
fi