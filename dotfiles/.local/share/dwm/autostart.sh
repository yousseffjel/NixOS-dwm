#!/usr/bin/env bash

sxhkd -c ~/.config/sxhkd/sxhkdrc &

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}
run "nm-applet"
picom -b  --config ~/.config/picom/picom.conf &
xrdb -merge ~/.Xresources &
$HOME/src/bin/wallpaper.sh &
run "volumeicon"
run slstatus &