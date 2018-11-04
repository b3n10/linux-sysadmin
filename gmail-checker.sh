#!/bin/bash

export DISPLAY=":0.0"

mail=$( curl -u $GUSER:$GPASS --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d' )

# https://askubuntu.com/a/92195/874085
# https://linuxconfig.org/check-your-gmail-inbox-for-new-emails-with-bash-script

if [ -n "$mail" ]; then
    GCOUNT=`echo "$mail" | wc -l`

    if [ "$GCOUNT" -gt 1 ]; then
        notif_title="New Mails"
    else
        notif_title="New Mail"
    fi

    kill -9 $(pgrep -f 'sh /home/ben/.xinitrc')
    kill -9 $(pgrep -f 'sh /mnt/sdcard/scripts/dwm_statusbar.sh')
    xsetroot -name "!!! $notif_title: $GCOUNT !!!"

    sleep 8s

    sh /mnt/sdcard/scripts/dwm_statusbar.sh
fi

# echo "GC_STR='$notif_title: $GCOUNT'" > /tmp/gc.sh
# echo "GC_STR='$notif_title: $GCOUNT'" > /dev/shm/foo
# notify-send --icon=gnome-stock-mail-new "$count $notif_title" "$mail"
# printf "$notif_title:\n$mail"
