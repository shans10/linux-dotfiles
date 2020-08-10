#!/bin/bash

# Icons
iconsB=( "" "" "" "" )

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

echo " $BRI_ICON  $BRI_PERC% "

exit 0
