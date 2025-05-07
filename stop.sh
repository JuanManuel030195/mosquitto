#!/bin/bash

# Stop and remove the Mosquitto container
echo "Stopping and removing the Mosquitto container..."
docker compose down

# Check if the container was stopped successfully
if [ $? -eq 0 ]; then
  echo "Mosquitto container stopped and removed successfully."
else
  echo "Failed to stop and remove the Mosquitto container."
  exit 1
fi
