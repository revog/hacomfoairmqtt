[DEFAULT]
# Serial port CA350 RS232 / RS485 direct or via USB TTL adapter
SerialPort=VALUE_ENV_SERIAL_PORT
# Select RS232 or RS485 protocol
RS485_protocol=VALUE_ENV_RS485_PROTOCOL
# Interval in seconds at which data from RS232 will be polled
refresh_interval=VALUE_ENV_REFRESH_INTERVAL
# automatically enable PC Mode (disable comfosense)
enablePcMode=VALUE_ENV_ENABLE_PC_MODE
debug=VALUE_ENV_DEBUG

[MQTT]
# MQTT broker - IP
MQTTServer=VALUE_ENV_MQTT_SERVER
# MQTT broker - Port
MQTTPort=VALUE_ENV_MQTT_PORT
 # MQTT broker - keepalive
MQTTKeepalive=VALUE_ENV_MQTT_KEEP_ALIVE
# MQTT broker - user - default: empty (disabled/no authentication)
MQTTUser=VALUE_ENV_MQTT_USER
# MQTT broker - password - default: empty (disabled/no authentication)
MQTTPassword=VALUE_ENV_MQTT_PASSWORD

[HA]
# Home Assistant sensor auto discovery
HAEnableAutoDiscoverySensors=VALUE_ENV_HA_ENABLE_AUTO_DISCOVERY_SENSORS
# Home Assistant climate auto discovery
HAEnableAutoDiscoveryClimate=VALUE_ENV_HA_ENABLE_AUTO_DISCOVERY_CLIMATE
# Home Assistant Device Discovery - Unique device ID (change this to be unique if running multiple instances)
HAAutoDiscoveryDeviceId=VALUE_ENV_HA_AUTO_DISCOVERY_DEVICE_ID
# Device name shown in the frontend
HAAutoDiscoveryDeviceName=VALUE_ENV_HA_AUTO_DISCOVERY_DEVICE_NAME
# Device manufacturer shown in device info
HAAutoDiscoveryDeviceManufacturer=VALUE_ENV_HA_AUTO_DISCOVERY_DEVICE_MANUFACTURER
# Device model shown in device info
HAAutoDiscoveryDeviceModel=VALUE_ENV_HA_AUTO_DISCOVERY_DEVICE_MODEL
