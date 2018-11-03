#!/usr/bin/env python

import time, subprocess, calendar

NOW = time.localtime()

def addZero(time):
    if time < 10:
        return "0" + str(time)
    else:
        return str(time)

def getTime():
    hour = NOW.tm_hour
    min = NOW.tm_min
    sec = NOW.tm_sec

    return addZero(hour) + ":" + addZero(min) + ":" + addZero(sec)


def getDate():
    year = NOW.tm_year
    mon = NOW.tm_mon
    day = NOW.tm_mday
    weekday = calendar.day_abbr[NOW.tm_wday]

    return weekday + ', ' + calendar.month_abbr[mon] + ' ' +  addZero(day) + ' ' +  addZero(year)


subprocess.run(["xsetroot", "-name", getDate() + ' | ' + getTime() ])
