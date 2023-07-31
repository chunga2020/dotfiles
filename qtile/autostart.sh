#!/bin/sh

if [[ -z $WAYLAND_DISPLAY ]]; then
    # Qtile on Xorg
    xrdb ~/.Xresources
    numlockx on
    setxkbmap -option compose:menu -option ctrl:nocaps -option shift:bothcapslock
fi

/usr/bin/dunst &
alacritty -e ~/bin/arch-upgrade-reminder &
~/bin/get-news -b brave -s 5 whdh.com wcvb.com reuters.com &
unclutter -b &
picom -b &
lxqt-policykit-agent &
imwheel &
adjust-volume set 15
