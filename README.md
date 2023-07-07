# hacomfoairmqtt
Container based Home Assistant integration for ComfoAir devices via serial communication and MQTT

*It is not compatible with the newer Q or Aeris Next models as they use a different communication standard.

This work is based on the following projects and scripts:
- Domoticz integration https://github.com/AlbertHakvoort/StorkAir-Zehnder-WHR-930-Domoticz-MQTT
- Adaption for HomeAssistant and MQTT https://github.com/adorobis/hacomfoairmqtt/

## Project content
- `app/ca350.py` - python script to communicate with the Comfoair unit via serial port, publish data on MQTT broker and react to control messages

- `app/config.ini.sample` - sample configuration file. Needs to be renamed to config.ini and customized


## Installation instructions in the project Wiki
https://github.com/adorobis/hacomfoairmqtt/wiki
