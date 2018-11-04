#!/bin/bash

while true; do

    # https://stackoverflow.com/a/13209479/6353682
    # result=$(python /mnt/sdcard/scripts/python/gmail-checker.py &)

    sep="|"
    mydate="$( date +'%a, %b %d %Y | %X' )"
    mybatt="$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )%"
    mybrt="B: $( cat /sys/class/backlight/intel_backlight/brightness )"
    # myvol=$( awk "/%/ {gsub(/[\[\]]/,''); print $4}" <(amixer sget Master) )
    volstr="V: $(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)"

    xsetroot -name "$volstr $sep $mybrt $sep $mydate $sep $mybatt"
    # xsetroot -name "$mybrt | $mydate | $mybatt"

    sleep 1s    # Update time every sec

done

# /mnt/sdcard/scripts/gmail-checker.sh &
# /mnt/sdcard/scripts/gmail-checker.sh > /dev/shm/gc &
# [ -a /dev/shm/foo ] && source /dev/shm/foo

