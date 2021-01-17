#!/bin/sh
# Usage: grab_snapshot.sh <name>
# Description: Takes a snapshot from the webcam and puts it into ~/timelapse/<name>
SNAPSHOT_URL="http://127.0.0.1:8080/?action=snapshot"
if [ -z $1 ]; then
	echo "Usage: grab_snapshot.sh <name>"
	echo "Please specify timelapse folder name"
	exit 1
fi
TL_DIR=~/timelapses/$1
mkdir -p $TL_DIR
# my webcam is mounted upside down so I flip it using ImageMagick
curl $SNAPSHOT_URL | convert - -flip $TL_DIR/`date +%s`.jpg
