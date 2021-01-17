#!/bin/sh
# Usage: make_timelapse.sh <name> <framerate>
# Description: Turns the image sequence in the specified timelapse folder in a video
# DOES NOT YET WORK - NEED TO EXPERIMENT WITH VIDEO ENCODING SETTINGS
# EASIER TO JUST IMPORT INTO A VIDEO EDITOR
USAGE="make_timelapse.sh <name> <framerate>"
TL_DIR=~/timelapses/$1
if [ ! -d $TL_DIR ]; then
	echo "Specified timelapse folder does not exist"
	exit 1
fi
if [ ! "$2" -eq "$2" ] 2>/dev/null && [ "$2" -gt 1 ]; then
	echo $USAGE
	echo "Frame rate must be greater than 0"
fi
avconv -framerate $2 -f image2 -i $TL_DIR/*.jpg -b 65536k "$1".mov
