#!/bin/bash

# Icons
iconsV=( "" "" " " )

# Master mute state
MUTE_STATE=$(pactl list sinks | awk '/Mute/ { print $2 }')

# Setting mute status
if [ $MUTE_STATE = 'yes' ]; then
    VOL_ICON='婢 '
    VOL='MUTED'

# Setting volume status
else
    # Master volume
    VOL=$(pactl list sinks | awk '/Volume/ { print $12 }' | tr -d %)
    j=$((VOL/35))
    VOL_ICON=${iconsV[$j]}
    # Getting current volume with percent
    VOL=$(pactl list sinks | awk '/Volume/ { print $12 }')
fi

echo " $VOL_ICON $VOL "

exit 0
