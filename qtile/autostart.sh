#!/bin/sh

xrdb ~/.Xresources &
numlockx &
/usr/bin/dunst &
alacritty -e ~/bin/arch-upgrade-reminder &
~/bin/get-news -s 5 whdh.com wcvb.com reuters.com &
synclient HorizTwoFingerScroll=1 VertScrollDelta=-28 HorizScrollDelta=-28 TapButton1=0 TapButton2=0 tapbutton3=0 &
setxkbmap -option ctrl:nocaps -option shift:both_capslock -option compose:menu &
pulseaudio -k; pulseaudio -D &
~/bin/multihead-control &
unclutter -b &
picom -b &
lxqt-policykit-agent &
imwheel &
