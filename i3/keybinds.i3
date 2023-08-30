# Super
set $mod Mod4

floating_modifier $mod
focus_follows_mouse no

################### Keybinds to start/use external programs ###################

# Terminal
bindsym $mod+Return exec alacritty

# kill focused window
bindsym $mod+Shift+q kill

# start rofi (a program launcher)
bindsym --release $mod+r exec rofi -modi run#drun -show run

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec "rofi -modi power-menu:'rofi-power-menu \
--choices=logout/shutdown/reboot' -show power-menu -width 10 -lines 4"

# Screen brightness controls
bindsym XF86MonBrightnessUp exec adjust-brightness increase
bindsym XF86MonBrightnessDown exec adjust-brightness decrease

# Screenshot
bindsym Print exec "scrot ~/Pictures/Screenshot_%F_%H-%M-%S.png"

# Screen lock
bindsym $mod+Shift+x exec i3lock -c 000000

# Volume controls
bindsym XF86AudioRaiseVolume exec adjust-volume increase
bindsym XF86AudioLowerVolume exec adjust-volume decrease
bindsym XF86AudioMute exec adjust-volume toggle

# Media player controls
mode "media" {
    bindsym p exec playerctl play-pause
    bindsym space exec playerctl play-pause

    bindsym $mod+h exec playerctl previous
    bindsym $mod+l exec playerctl next

    bindsym $mod+s exec playerctl stop

    # back to normal: Enter or Escape or $mod+m
    bindsym Return mode "default"
    bindsym Escape mode "default"
    bindsym $mod+m mode "default"
}
bindsym $mod+m mode "media"

# change focused window
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# move windows around on output
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# move workspace to output
bindsym Control+Shift+$mod+j move workspace to output left
bindsym Control+Shift+$mod+k move workspace to output down
bindsym Control+Shift+$mod+l move workspace to output up
bindsym Control+Shift+$mod+semicolon move workspace to output right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# make focused container fullscreen
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
bindsym $mod+c focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# move focused container to workspace and immediately switch to that
# workspace
bindsym $mod+Mod1+1 move container to workspace $ws1; workspace $ws1
bindsym $mod+Mod1+2 move container to workspace $ws2; workspace $ws2
bindsym $mod+Mod1+3 move container to workspace $ws3; workspace $ws3
bindsym $mod+Mod1+4 move container to workspace $ws4; workspace $ws4
bindsym $mod+Mod1+5 move container to workspace $ws5; workspace $ws5
bindsym $mod+Mod1+6 move container to workspace $ws6; workspace $ws6
bindsym $mod+Mod1+7 move container to workspace $ws7; workspace $ws7
bindsym $mod+Mod1+8 move container to workspace $ws8; workspace $ws8
bindsym $mod+Mod1+9 move container to workspace $ws9; workspace $ws9
bindsym $mod+Mod1+0 move container to workspace $ws10; workspace $ws10

# easy workspace switching
# n for "n"ext
# p for "p"revious
bindsym $mod+n workspace next
bindsym $mod+p workspace prev

# moving windows to adjacent workspaces with n and p, as above
bindsym $mod+Shift+n move workspace next
bindsym $mod+Shift+p move workspace prev

# fast logout
bindsym $mod+Shift+Ctrl+e exit

# resize window (you can also use the mouse for that)
bindsym Control+$mod+j resize shrink width 5 px or 5 ppt
bindsym Control+$mod+k resize grow height 5 px or 5 ppt
bindsym Control+$mod+l resize shrink height 5 px or 5 ppt
bindsym Control+$mod+semicolon resize grow width 5 px or 5 ppt
# Scratchpad
bindsym $mod+Shift+minus move scratchpad
bindsym $mod+minus scratchpad show

# Text Scratchpad
bindsym $mod+g exec text-scratchpad
