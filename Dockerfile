# Set base image and version
ARG PYTHON_BASE_IMAGE_VERSION=3.9.17
FROM python:${PYTHON_BASE_IMAGE_VERSION}-alpine

LABEL maintainer="revog"
LABEL version="v0.0.9"
LABEL org.opencontainers.image.description="Container based Home Assistant integration for ComfoAir devices via serial communication and MQTT"
LABEL org.opencontainers.image.source=https://github.com/revog/hacomfoairmqtt
LABEL org.opencontainers.image.licenses=MIT

# Define default config parameters - Refer to config.ini.sample for detailed descriptions
ENV SERIAL_PORT="/dev/cuau3"
ENV RS485_PROTOCOL=false
ENV REFRESH_INTERVAL=10
ENV ENABLE_PC_MODE=false
ENV DEBUG=false

ENV MQTT_SERVER="10.144.1.103"
ENV MQTT_PORT=1883
ENV MQTT_KEEP_ALIVE=45
ENV MQTT_USER=""
ENV MQTT_PASSWORD=""

ENV HA_ENABLE_AUTO_DISCOVERY_SENSORS=true
ENV HA_ENABLE_AUTO_DISCOVERY_CLIMATE=true
ENV HA_AUTO_DISCOVERY_DEVICE_ID=true
ENV HA_AUTO_DISOCVERY_DEVICE_NAME="CA350"
ENV HA_AUTO_DISOCVERY_DEVICE_MANUFACTURER="Zehnder"
ENV HA_AUTO_DISCOVERY_DEVICE_MODEL="ComfoAir 350"

# Install additional pip packages
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install files for Comfair CA350 integration
COPY . /

# Set working directory
WORKDIR /app

# Create config file by injecting provided ENV values
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["python3", "ca350.py"]
