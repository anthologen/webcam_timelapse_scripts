#!/bin/sh
# Usage: start_timelapse.sh <name> <interval>
# Description: Takes a snapshot from the webcam and puts it into ~/timelapse/<name> every <interval> seconds
USAGE="Usage: start_timelapse.sh <name> <interval>"
if [ -z $1 ]; then
        echo $USAGE
        echo "Please specify timelapse folder name"
        exit 1
fi
if [ $2 -lt 1 ]; then
	echo $USAGE
	echo "Should probably record a video if grabbing more than 1 frame per second"
	exit 1
fi
watch -n $2 "./grab_snapshot.sh $1"
