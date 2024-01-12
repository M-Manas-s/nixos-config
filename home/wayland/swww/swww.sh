#!/bin/bash
swww init
# sleep 1

export SWWW_TRANSITION_DURATION=2
export SWWW_TRANSITION=wipe
export SWWW_TRANSITION_ANGLE=45

INTERVAL=300

while true; do
	find "$1" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			swww img "$img"
			sleep $INTERVAL
		done
done