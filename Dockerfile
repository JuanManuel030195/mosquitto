FROM eclipse-mosquitto:latest

# Copy the mosquitto.conf file into the container
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Expose the default MQTT and WebSocket ports
EXPOSE 1883 9001

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]