#!/bin/bash

MEM_ICON=''
MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

echo " $MEM_ICON  $MEM "

exit 0
