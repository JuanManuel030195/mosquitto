#!/bin/bash

# Create data directory if it doesn't exist
if [ ! -d "data" ]; then
  mkdir data
fi

# Create log directory if it doesn't exist
if [ ! -d "log" ]; then
  mkdir log
fi

# Create password file if it doesn't exist
PASSWORD_FILE_CREATED=false
if [ ! -f "passwd_file" ]; then
  PASSWORD_FILE_CREATED=true
  touch passwd_file
  chmod 700 passwd_file
  echo "passwd_file file created with permissions set to 700."
fi

# Build and start the Mosquitto container
echo "Building and starting the Mosquitto container..."
docker compose up --build -d

# Check if the container is running
if [ $? -eq 0 ]; then
  echo "Mosquitto container is up and running."

  # If the password file was created, connect to the container and update the password file permissions to 700
   if [ "$PASSWORD_FILE_CREATED" = true ]; then
      echo "Updating passwd_file permissions to 700..."
      docker exec -it mosquitto-broker chmod 700 /mosquitto/passwd_file
      echo "passwd_file permissions updated to 700."
   fi

  echo "You can now publish and subscribe to topics using the Mosquitto client."
else
  echo "Failed to start the Mosquitto container."
  exit 1
fi