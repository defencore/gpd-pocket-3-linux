#!/bin/sh
# 2022 - @defencore
# This script allows you to rotate the screen orientation with hotkeys
#
# └─$ sudo cp rotate.sh /usr/local/bin/rotate.sh
# └─$ xfce4-keyboard-settings
#     > Application Shortcuts
#       > + Add
#         > Command: /usr/local/bin/rotate.sh
#           > OK
#           > Press: Super+R / Win+R
#       > Close

id_touchscreen="16"
id_stylus_pen="21"
id_stylus_eraser="22"
R_0="0 1 0 -1 0 1 0 0 1"
R_90="-1 0 1 0 -1 1 0 0 1"
R_180="0 -1 1 1 0 0 0 0 1"
R_270="1 0 0 0 1 0 0 0 1"

screen_orientation=$(xrandr --query --verbose | grep DSI-1 | awk '{print $5}')

case "$screen_orientation" in
	"right" )
	for i in $(echo -e "$id_touchscreen\n $id_stylus_pen\n $id_stylus_eraser\n"); do xinput set-prop $i 'Coordinate Transformation Matrix' $R_90; done
	xrandr --output DSI-1 --rotate inverted
	;;
	"inverted" )
	for i in $(echo -e "$id_touchscreen\n $id_stylus_pen\n $id_stylus_eraser\n"); do xinput set-prop $i 'Coordinate Transformation Matrix' $R_180; done
	xrandr --output DSI-1 --rotate left
	;;
	"left" )
	for i in $(echo -e "$id_touchscreen\n $id_stylus_pen\n $id_stylus_eraser\n"); do xinput set-prop $i 'Coordinate Transformation Matrix' $R_270; done
	xrandr --output DSI-1 --rotate normal
	;;
	"normal" )
	for i in $(echo -e "$id_touchscreen\n $id_stylus_pen\n $id_stylus_eraser\n"); do xinput set-prop $i 'Coordinate Transformation Matrix' $R_0; done
	xrandr --output DSI-1 --rotate right
	;;
esac
