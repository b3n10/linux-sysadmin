#!/bin/bash

mail=$( curl -u $gmail_username:$gmail_password --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d' )

# https://askubuntu.com/a/92195/874085
# https://linuxconfig.org/check-your-gmail-inbox-for-new-emails-with-bash-script

if [ -n "$mail" ]; then

    GCOUNT=`echo "$mail" | wc -l`

    if [ "$GCOUNT" -gt 1 ]; then
        notif_title="New Mails"
    else
        notif_title="New Mail"
    fi

    echo "GC_STR='$notif_title: $GCOUNT'" > /dev/shm/foo

    # echo "GC_STR='$notif_title: $GCOUNT'" > /tmp/gc.sh

    # notify-send --icon=gnome-stock-mail-new "$count $notif_title" "$mail"
    # printf "$notif_title:\n$mail"
else
    echo "GC_STR=':)'" > /dev/shm/foo
fi
