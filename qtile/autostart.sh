#!/bin/sh

/usr/bin/dunst &
alacritty -e ~/bin/arch-upgrade-reminder &
~/bin/get-news -b brave -s 5 whdh.com wcvb.com reuters.com &
unclutter -b &
picom -b &
lxqt-policykit-agent &
imwheel &
adjust-volume set 15
