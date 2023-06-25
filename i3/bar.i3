# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    position top
    status_command i3status

    strip_workspace_numbers yes

    # prevent scrolling on i3bar from changing workspace
    bindsym button4 nop
    bindsym button5 nop
    bindsym button6 nop
    bindsym button7 nop
}
