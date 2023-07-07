# HAComfoairMqtt
Container based Home Assistant integration for ComfoAir devices via serial communication and MQTT

*It is not compatible with the newer Q or Aeris Next models as they use a different communication standard.

This work is based on the following projects and scripts:
- Domoticz integration https://github.com/AlbertHakvoort/StorkAir-Zehnder-WHR-930-Domoticz-MQTT
- Adaption for HomeAssistant and MQTT https://github.com/adorobis/hacomfoairmqtt/

## Project content
- `app/ca350.py` - python script to communicate with the Comfoair unit via serial port, publish data on MQTT broker and react to control messages
- `app/config.ini.sample` - sample configuration file
- `app/config.ini.tpl` - skeleton configuration file used for in place configuration when starting container

# Usage
Command Line:

```bash
docker run --net=host \
  -e SERIAL_PORT='/dev/ttyUSB0' \
  -e MQTT_SERVER='10.144.1.103' \
  -e MQTT_PORT=1883 \
  --name=hacomfoairmqtt ghcr.io/revog/hacomfoairmqtt:latest
```

Using [Docker Compose](https://docs.docker.com/compose/) (recommended):

```yml
version: '3.8'
services:
  hacomfoairmqtt:
    image: ghcr.io/revog/hacomfoairmqtt:latest
    restart: always
    devices:
      - /dev/ttyUSB0:/dev/ttyUSB0
    environment:
      - PUID=0
      - PGID=0
      - TZ=Europe/Zurich
      - SERIAL_PORT='/dev/cuau3'
      - RS485_PROTOCOL=false
      - REFRESH_INTERVAL=10
      - ENABLE_PC_MODE=false
      - DEBUG=false
      - MQTT_SERVER='10.144.1.103'
      - MQTT_PORT=1883
      - MQTT_KEEP_ALIVE=45
      - MQTT_USER=''
      - MQTT_PASSWORD=''
      - HA_ENABLE_AUTO_DISCOVERY_SENSORS=true
      - HA_ENABLE_AUTO_DISCOVERY_CLIMATE=true
      - HA_AUTO_DISCOVERY_DEVICE_ID=true
      - HA_AUTO_DISOCVERY_DEVICE_NAME='CA350'
      - HA_AUTO_DISOCVERY_DEVICE_MANUFACTURER='Zehnder'
      - HA_AUTO_DISOCVERY_DEVICE_MODEL='ComfoAir 350'
```
# Configuration
## Home Assistant Comfoair MQTT Configuration
Configuration Name | Description
------------ | -------------
`SerialPort`       | The Serialport to the Comfoair on the Host Linux Machine. Examples: /dev/ttyUSB0 or /dev/cuau3
`MQTTServer`       | IP Adress to your MQTT Server, may be different to the HA Server
`MQTTPort`         | Port of your MQTT Server. Default: 1833
`MQTTKeepalive`    | MQTT Keepalive Settings. Default: 45
`MQTTUser`         | MQTT User, if you enabled authorization on your MQTT Server. Default: False (no authentication)
`MQTTPassword`     | MQTT User Password, if you enabled authorization on your MQTT Server. Default: False (no authentication)
`refresh_interval` | Refresh Interval in Seconds. Default: 10
`enablePcMode`     | Automaticly enable PC Mode (disable comfosense). Default: False (disabled)
`RS485_protocol`   | Enable RS485 protocol, if false RSS232 is used Default: False (RS232)
`debug`            | Enable Debug Output. Default: False (disabled)

## MQTT Auto Discovery Configuration
If you are using MQTT in Home Assistant, you will probably have the Auto Discovery enabled by default. The MQTT AD implementation is expected to run with the prefix "homeassistant/". 

### Configuration: HAEnableAutoDiscoverySensors = True 
Configuration Name | Description
------------ | -------------
`HAEnableAutoDiscoverySensors` | Enable Home Assistant Auto Discovery
`HAAutoDiscoveryDeviceId` | Unique ID to use for Home Assistant Device Discovery
`HAAutoDiscoveryDeviceName` | Device name to show in the Home Assistant frontend
`HAAutoDiscoveryDeviceManufacturer` | Device manufacturer to show in the Home Assistant frontend
`HAAutoDiscoveryDeviceModel` | Device model to show in the Home Assistant frontend

If you enable Autodiscovery in this Service, you will get following entities:
The entity id consists of the `HAAutoDiscoveryDeviceName` and the Entity Name.

Entity Type | Entity Name | Unit | Description
------------| ----------- | ---- | -------------
sensor | Analog sensor 1 | % | Analog reading for accesories, eg: Comfosense CO2 sensor
sensor | Analog sensor 2 | % | Analog reading for accesories, eg: Comfosense CO2 sensor
sensor | Analog sensor 3 | % | Analog reading for accesories, eg: Comfosense CO2 sensor
sensor | Analog sensor 4 | % | Analog reading for accesories, eg: Comfosense CO2 sensor
sensor | Bypass valve    | % | Bypass valve value: 0 % = Closed, 100 % = Open
sensor | Return air level | % | Fan level for exhaust fan
sensor | Supply air level | % | Fan level for supply fan
sensor | Exhaust fan speed | rpm | Fan rotation speed for exhaust fan
sensor | Supply fan speed | rpm | Fan rotation speed for supply fan
sensor | Outside temperature | °C | Air temperature from outside
sensor | Supply temperature | °C | Air temperature supplied to the house
sensor | Return temperature | °C | Air temperature extracted from the house 
sensor | Exhaust temperature | °C | Air temperature going outside
sensor | Summer mode | | Current climate mode: `Summer` means cooling via bypass at nighttime, `Winter` means bypass always closed
sensor | Filter hours| h | Filter hours counter
number | Filter weeks | weeks | Configuration for filter weeks, possible values from 1 to 26, appears as "number" entity type in HA
button | Reset filter | | Button entity type to reset filter status
binary_sensor | Summer mode | | Current climate mode: `On` means cooling via bypass at nighttime, `Off` means bypass always closed
binary_sensor | Preheating status | | Whether the unit is preheating the air before it enters the heat exchanger.
binary_sensor | Bypass valve | | State of the bypass valve
binary_sensor | Filter status | | Whether or not the air filters need cleaning / replacing
sensor | EWT Temperature | °C | EWT Temperature (geothermal heat exchanger)
number | EWT Lower Set Temperature | °C | EWT Lower Set Temperature control
number | EWT Upper Set Temperature | °C | EWT Upper Set Temperature control
number | EWT speed up | % | EWT speed up control