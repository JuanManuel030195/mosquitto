# Mosquitto MQTT Broker with Docker

This project sets up an MQTT broker using Eclipse Mosquitto, Docker, and Docker Compose. It includes scripts for starting, stopping, publishing, and subscribing to MQTT topics.

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone this repository.
2. Ensure Docker and Docker Compose are installed on your system.

## Usage

### Start the Broker

Run the following command to start the Mosquitto broker:

```bash
./start.sh
```

This script will:
- Create the `data` and `log` directories if they don't exist.
- Create the `passwd_file` with appropriate permissions if it doesn't exist.
- Build and start the Mosquitto container.

### Stop the Broker

Run the following command to stop and remove the Mosquitto broker:

```bash
./stop.sh
```

### Publish a Message

To publish a message to a topic, use the `publish.sh` script:

```bash
./publish.sh <topic> <message>
```

Example:

```bash
./publish.sh test "Hello, MQTT!"
```

### Subscribe to a Topic

To subscribe to a topic, use the `listen.sh` script:

```bash
./listen.sh <topic>
```

Example:

```bash
./listen.sh test
```

## Configuration

The MQTT broker is configured using the `mosquitto.conf` file. Key configurations include:
- Persistence enabled with data stored in the `data/` directory.
- Logs stored in the `log/` directory.
- Password file located at `passwd_file`.
- MQTT listener on port `1883`.
- WebSocket listener on port `9001`.

## Logs and Data

- Logs are stored in the `log/` directory.
- Persistent data is stored in the `data/` directory.
