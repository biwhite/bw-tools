#!/bin/sh

# if rofi >= 1.5.2 "Lock \x00icon\x1ffile-browser," works

entries="
Lock,
Logout,
Suspend,
Hybrid,
Hibernate,
Reboot,
Shutdown"

selected=$(echo $entries | rofi -m 0 -dmenu -sep ',' -p "power" -i | awk '{print tolower($1)}')

case $selected in
  lock) 
    exec ~/.local/bin/lock.sh;;
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  hybrid)
    exec systemctl hybrid-sleep;;
  hibernate)
    exec systemctl hibernate;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
