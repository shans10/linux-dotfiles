#!/bin/bash

### This script sets bar status!

######################################################################### ICONS ####################################################################################

# Battery
iconsAc=( "" "" "" "" "" )   # Charging
iconsDc=( "" "" "" "" "" "" "" "" "" "" )   # Discharging

# Volume
iconsV=( "" "" "" )

# Brightness
iconsB=( "" "" "" "" )

# Memory
MEM_ICON=''

##################################################################################################################################################################

while :; do

##################################################################################################################################################################
######################################################################### MEMORY #################################################################################

    # Finding RAM usage
    MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

##################################################################################################################################################################
######################################################################### BATTERY ################################################################################

    # Battery percentage
    BAT_PERC=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/{print $2}' | tr -d %)

    # Battery charging state
    BAT_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/{print $2}')

    # Charging icons
    if [ $BAT_STATE = 'charging' ]; then
        i=$((BAT_PERC/20))
        BAT_ICON=${iconsAc[$i]}

    # Fully charged icon
    elif [ $BAT_STATE = 'fully-charged' ]; then
        BAT_ICON=''

    # Discharging icons
    else
        # For 100% battery
        if [ $BAT_PERC -eq 100 ]; then
            BAT_ICON=${iconsDc[9]}

        # For below 100% battery
        else
            i=$((BAT_PERC/10))
            BAT_ICON=${iconsDc[$i]}
        fi
    fi

##################################################################################################################################################################
######################################################################### VOLUME #################################################################################

    # Master mute state
    MUTE_STATE=$(pactl list sinks | awk '/Mute/ { print $2 }')

    # Setting mute status
    if [ $MUTE_STATE = 'yes' ]; then
        VOL_ICON=''
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

##################################################################################################################################################################
######################################################################### NETWORK ################################################################################

    # Wired connection
    WIRED_STATE=$(nmcli -p d | awk '/enp1s0/{print $3; exit}')

    # Wifi Connection
    WIFI_STATE=$(nmcli -p d | awk '/wlp2s0/{print $3; exit}')

    # Getting wifi SSID
    WIFI=$(iwgetid -r)

    # Wired connection status
    if [ $WIRED_STATE = 'connected' ]; then
        NET_ICON=' eth'

    # Wifi status
    elif [ $WIFI_STATE = 'connected' ]; then
        NET_ICON=" $WIFI"

    # No internet
    else
        NET_ICON=' No IN'
    fi

##################################################################################################################################################################
######################################################################### BRIGHTNESS #############################################################################

    # Value
    BRI_PERC=$(($(light -G | tr -d .)/100))

    # Icons
    # For 100% brightness
    if [ $BRI_PERC -eq 100 ]; then
        BRI_ICON=${iconsB[3]}

    # For below 100%
    else
        k=$((BRI_PERC/25))
        BRI_ICON=${iconsB[$k]}
    fi

##################################################################################################################################################################

    # Print variables
    echo "+@bg=3; $MEM_ICON $MEM +@bg=0;   +@bg=2; $BAT_ICON $BAT_PERC% +@bg=0;   +@bg=8; $VOL_ICON $VOL +@bg=0;   +@bg=7; $BRI_ICON $BRI_PERC% +@bg=0;   +@bg=6; $NET_ICON"

    # Update interval
    sleep 3

done

exit 0

############################################################################ END #################################################################################
