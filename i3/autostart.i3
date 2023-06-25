exec xrdb ~/.Xresources
exec numlockx
exec ~/.fehbg
exec /usr/bin/dunst
exec "kitty ~/bin/arch-upgrade-reminder"
exec "~/bin/get-news -s 5 whdh.com wcvb.com reuters.com"
exec "synclient HorizTwoFingerScroll=1 VertScrollDelta=-28 HorizScrollDelta=-28 TapButton1=0 TapButton2=0 tapbutton3=0"
exec "pulseaudio -k; pulseaudio -D"
exec "~/bin/multihead-control"
exec "unclutter -b"
exec "picom -b"
exec lxqt-policykit-agent
exec gpuoff
exec imwheel
exec "darkman run"
exec_always --no-startup-id "setxkbmap -option ctrl:nocaps -option shift:both_capslock -option compose:menu"

