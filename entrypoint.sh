#!/bin/sh

cp config.ini.tpl config.ini

sed -i 's!\$VALUE_ENV_SERIAL_PORT\$!'$SERIAL_PORT'!g' config.ini
sed -i 's!\$VALUE_ENV_SERIAL_PORT\$!'$SERIAL_PORT'!g' config.ini
sed -i 's!\$VALUE_ENV_RS485_PROTOCOL\$!'$RS485_PROTOCOL'!g' config.ini
sed -i 's!\$VALUE_ENV_REFRESH_INTERVAL\$!'$REFRESH_INTERVAL'!g' config.ini
sed -i 's!\$VALUE_ENV_ENABLE_PC_MODE\$!'$ENABLE_PC_MODE'!g' config.ini
sed -i 's!\$VALUE_ENV_DEBUG\$!'$DEBUG'!g' config.ini

sed -i 's!\$VALUE_ENV_MQTT_SERVER\$!'$MQTT_SERVER'!g' config.ini
sed -i 's!\$VALUE_ENV_MQTT_PORT\$!'$MQTT_PORT'!g' config.ini
sed -i 's!\$VALUE_ENV_MQTT_KEEP_ALIVE\$!'$MQTT_KEEP_ALIVE'!g' config.ini
sed -i 's!\$VALUE_ENV_MQTT_USER\$!'$MQTT_USER'!g' config.ini
sed -i 's!\$VALUE_ENV_MQTT_PASSWORD\$!'$MQTT_PASSWORD'!g' config.ini

sed -i 's!\$VALUE_ENV_HA_ENABLE_AUTO_DISCOVERY_SENSORS\$!'$HA_ENABLE_AUTO_DISCOVERY_SENSORS'!g' config.ini
sed -i 's!\$VALUE_ENV_HA_ENABLE_AUTO_DISCOVERY_CLIMATE\$!'$HA_ENABLE_AUTO_DISCOVERY_CLIMATE'!g' config.ini
sed -i 's!\$VALUE_ENV_HA_AUTO_DISCOVERY_DEVICE_ID\$!'$HA_AUTO_DISCOVERY_DEVICE_ID'!g' config.ini
sed -i 's!\$VALUE_ENV_HA_AUTO_DISCOVERY_DEVICE_NAME\$!'$HA_AUTO_DISCOVERY_DEVICE_NAME'!g' config.ini
sed -i 's!\$VALUE_ENV_HA_AUTO_DISCOVERY_DEVICE_MANUFACTURER\$!'$HA_AUTO_DISCOVERY_DEVICE_MANUFACTURER'!g' config.ini
sed -i 's!\$VALUE_ENV_HA_AUTO_DISCOVERY_DEVICE_MODEL\$!'$HA_AUTO_DISCOVERY_DEVICE_MODEL'!g' config.ini

exec $@