#!/bin/bash
choice=$(fuzzel --dmenu -p dynamic --prompt "Select Action: " << EOF | sed 's/^ *//'
Shutdown
Reboot
Reboot to firmware
Log off
Sleep
Lock
Cancel
EOF
)

case "$choice" in
    "Shutdown")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Reboot to firmware")
        systemctl reboot --firmware-setup
        ;;
    "Sleep")
        systemctl suspend
        ;;
    "Lock")
        loginctl lock-session
        ;;
    "Log off")
        swaymsg exit
        ;;
esac
