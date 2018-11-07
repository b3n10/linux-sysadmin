#!/bin/bash

battery_status=$( acpi -b )
mybatt="$( acpi -b | sed 's/.*[charging|full], \([0-9]*\)%.*/\1/gi' )"
discharging="Discharging"

if [[ "$mybatt" -lt "10" && $battery_status =~ $discharging ]]; then
    sudo -u ben DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "BATTERY IS $mybatt%" "PLEASE PLUG IN YOUR CHARGER!!!"
fi
