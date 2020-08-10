#!/bin/bash

WINDOW_NAME=$(xprop -id $(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5) WM_CLASS | cut -d "," -f2 | sed 's/"//g')
if [ ! -n "$WINDOW_NAME" ]; then
    WINDOW_ICON='   i3-gaps'
else
    WINDOW_ICON=''
fi

echo " $WINDOW_ICON $WINDOW_NAME "

exit 0
