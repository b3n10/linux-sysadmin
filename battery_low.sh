#!/bin/bash

mybatt="$( acpi -b | sed 's/.*[charging|full], \([0-9]*\)%.*/\1/gi' )"

if [ "$mybatt" -lt "10" ]; then
    sudo -u ben DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Battery below 10%" "Please plug your charger!"
fi
