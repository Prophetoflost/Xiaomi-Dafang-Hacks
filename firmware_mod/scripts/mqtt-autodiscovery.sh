#!/bin/sh

. /system/sdcard/config/mqtt.conf
. /system/sdcard/scripts/common_functions.sh

MAC=$(cat /sys/class/net/wlan0/address)                                         
MAC_SIMPLE=$(cat /sys/class/net/wlan0/address | tr -d :)                        
MANUFACTURER="Xiaomi"                                                           
MODEL="Dafang"                                                                  
VER="Dafang Hacks"

# Motion sensor
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/binary_sensor/$DEVICE_NAME/motion/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME motion sensor\", \"unique_id\": \"$MAC_SIMPLE-motion-sensor\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:run\", \"state_topic\": \"$TOPIC/motion\", \"device_class\": \"motion\"}"

# Motion detection on/off switch
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/motion_detection/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME motion detection\", \"unique_id\": \"$MAC_SIMPLE-motion-detection\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:run\", \"state_topic\": \"$TOPIC/motion/detection\", \"command_topic\": \"$TOPIC/motion/detection/set\"}"

# Motion send mail alert on/off switch
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/motion_send_mail/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME motion send mail\", \"unique_id\": \"$MAC_SIMPLE-motion-send-mail\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:run\", \"state_topic\": \"$TOPIC/motion/send_mail\", \"command_topic\": \"$TOPIC/motion/send_mail/set\"}"

# Motion detection snapshots
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/camera/$DEVICE_NAME/motion_snapshot/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME motion snapshot\", \"unique_id\": \"$MAC_SIMPLE-motion-snapshot\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"topic\": \"$TOPIC/motion/snapshot\"}"

# Motion tracking on/off switch
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/motion_tracking/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME motion tracking\", \"unique_id\": \"$MAC_SIMPLE-motion-tracking\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:run\", \"state_topic\": \"$TOPIC/motion/tracking\", \"command_topic\": \"$TOPIC/motion/tracking/set\"}"

# LEDs
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/blue_led/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME blue led\", \"unique_id\": \"$MAC_SIMPLE-blue-led\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:led-on\", \"state_topic\": \"$TOPIC/leds/blue\", \"command_topic\": \"$TOPIC/leds/blue/set\"}"
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/yellow_led/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME yellow led\", \"unique_id\": \"$MAC_SIMPLE-yellow-led\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:led-on\", \"state_topic\": \"$TOPIC/leds/yellow\", \"command_topic\": \"$TOPIC/leds/yellow/set\"}"
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/ir_led/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME ir led\", \"unique_id\": \"$MAC_SIMPLE-ir-led\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:led-on\", \"state_topic\": \"$TOPIC/leds/ir\", \"command_topic\": \"$TOPIC/leds/ir/set\"}"

# IR Filter
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/ir_cut/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME ir filter\", \"unique_id\": \"$MAC_SIMPLE-ir-filter\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:image-filter-black-white\", \"state_topic\": \"$TOPIC/ir_cut\", \"command_topic\": \"$TOPIC/ir_cut/set\"}"

# Light Sensor
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/sensor/$DEVICE_NAME/ldr/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME light sensor\", \"unique_id\": \"$MAC_SIMPLE-light-sensor\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:brightness-5\", \"unit_of_measurement\": \"%\", \"state_topic\": \"$TOPIC/brightness\"}"

# Night mode
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/night_mode/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME night mode\", \"unique_id\": \"$MAC_SIMPLE-night-mode\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:weather-night\", \"state_topic\": \"$TOPIC/night_mode\", \"command_topic\": \"$TOPIC/night_mode/set\"}"

# Night mode automatic
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/auto_night_mode/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME night mode auto\", \"unique_id\": \"$MAC_SIMPLE-night-mode-auto\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:weather-night\", \"state_topic\": \"$TOPIC/night_mode/auto\", \"command_topic\": \"$TOPIC/night_mode/auto/set\"}"

# RTSP Server
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/rtsp_h264_server/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME h264 rtsp server\", \"unique_id\": \"$MAC_SIMPLE-h264-rtsp-server\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:cctv\", \"state_topic\": \"$TOPIC/rtsp_h264_server\", \"command_topic\": \"$TOPIC/rtsp_h264_server/set\"}"
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/switch/$DEVICE_NAME/rtsp_mjpeg_server/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME mjpeg rtsp server\", \"unique_id\": \"$MAC_SIMPLE-mjpeg-rtsp-server\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"icon\": \"mdi:cctv\", \"state_topic\": \"$TOPIC/rtsp_mjpeg_server\", \"command_topic\": \"$TOPIC/rtsp_mjpeg_server/set\"}"


# Motor up/down/left/right
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/cover/$DEVICE_NAME/motor_up_down/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME move up/down\", \"unique_id\": \"$MAC_SIMPLE-move-up-down\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"position_topic\": \"$TOPIC/motors/vertical\", \"command_topic\": \"$TOPIC/motors/vertical/set\", \"payload_close\": \"down\", \"payload_open\": \"up\", \"optimistic\": \"false\", \"value_template\": \"{{ ((value|int)/7.3)|round }}\"}"
/system/sdcard/bin/mosquitto_pub.bin -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" -t "$AUTODISCOVERY_PREFIX/cover/$DEVICE_NAME/motor_left_right/config" ${MOSQUITTOPUBOPTS} ${MOSQUITTOOPTS} -r -m "{\"name\": \"$DEVICE_NAME move left/right\", \"unique_id\": \"$MAC_SIMPLE-move-left-right\", \"device\": {\"identifiers\": \"$MAC_SIMPLE\", \"connections\": [[\"mac\", \"$MAC\"]], \"manufacturer\": \"$MANUFACTURER\", \"model\": \"$MODEL\", \"name\": \"$MANUFACTURER $MODEL\", \"sw_version\": \"$VER\"}, \"position_topic\": \"$TOPIC/motors/horizontal\", \"command_topic\": \"$TOPIC/motors/horizontal/set\", \"payload_close\": \"right\", \"payload_open\": \"left\", \"optimistic\": \"false\", \"value_template\": \"{{ ((value|int)/27)|round }}\"}"
