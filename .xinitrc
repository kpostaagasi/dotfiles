#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -f $usermodmap	]; then
    xmodmap $usermodmap
else
	xmodmap $sysmodmap
fi

if [ -e /sys/class/power_supply/BAT0 ]; then
    export IS_LAPTOP=$true
fi

lxsession &
pulsemixer --unmute &
picom -b &
parcellite &
unclutter &
nm-applet &
udiskie --smart-tray &
redshift-gtk &
bluetoothctl power on &
nitrogen --restore &
setxkbmap -layout tr,us -option grp:alt_shift_toggle &

exec awesome
