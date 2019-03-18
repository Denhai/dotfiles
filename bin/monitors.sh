#!/bin/bash
if xrandr | grep "DisplayPort-0 disconnected"; then
    xrandr --output DisplayPort-0 --off --output HDMI-A-0 --mode 1920x1080
elif xrandr | grep "HDMI-A-0 disconnected"; then
    xrandr --output DisplayPort-0 --mode 2560x1440 --output HDMI-A-0 --off
else
    xrandr --output DisplayPort-0 --mode 2560x1440 --primary --output HDMI-A-0 --mode 1920x1080 --right-of DisplayPort-0
fi