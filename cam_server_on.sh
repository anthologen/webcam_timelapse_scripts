#!/bin/sh
# Usage: ./cam_server_on.sh 
# Description: starts the webcam server and reboots it when it goes down
# Notes: the server goes down after running for a long time and I cannot reproduce the conditions to crash it 
# so I just reboot it in a while loop and that works just fine for the time lapse script
# Photo URL = <Machine IP Address>:8080/?action=snapshot
# Video URL = <Machine IP Address>:8080/?action=stream
# Documentation: https://github.com/jacksonliam/mjpg-streamer
cd ~/mjpg-streamer/mjpg-streamer-experimental
while true; do
	echo 'Starting cam server'
	./mjpg_streamer -i "./input_uvc.so -d /dev/video0" -o "./output_http.so"
	sleep 1
done
