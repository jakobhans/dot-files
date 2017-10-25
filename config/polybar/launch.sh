#!/usr/bin/env sh

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR=HDMI-0 polybar top &
MONITOR=DP-4 polybar top &
MONITOR=DP-2 polybar top &
MONITOR=DP-0 polybar top
