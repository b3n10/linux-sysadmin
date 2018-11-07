#!/bin/bash

# https://askubuntu.com/a/92195/874085
# https://linuxconfig.org/check-your-gmail-inbox-for-new-emails-with-bash-script

mail=$( curl -u $GUSER:$GPASS --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d' )
mail=$mail | xargs

if [ -n "$mail" ]; then
    GCOUNT=`echo "$mail" | wc -l`

    if [ "$GCOUNT" -gt 1 ]; then
        notif_title="New Mails"
    else
        notif_title="New Mail"
    fi

    sudo -u ben DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "$notif_title: $GCOUNT" "$mail"
fi
