# Small scripts and tools

## archnews
Show arch news, with options to delve into details
Useful to tie into arch regular upgrade process

## brightchange
Change screen brightness
Mako snippet to group notifications and timeout quickly.

.config/sway/config

    bindsym XF86MonBrightnessUp exec ~/.local/bin/brightchange brighter
    bindsym XF86MonBrightnessDown exec ~/.local/bin/brightchange dimmer

.config/mako/config

    sort=-time
    [app-name=brightchange]
    group-by=app-name
    default-timeout=500

## killrofi-onworkspace.sh
Sometimes if you have rofi open and switch workspace, it stops taking input
This looks for that situation and kills it when changing workspaces.

.config/sway/config

    exec --no-startup-id nice ~/.local/bin/killrofi-onworkspace.sh

## pinchzoom
Use gestures to zoom in/out depending on which app has focus

.config/libinput-gestures.conf

    gesture pinch in 2 ~/.local/bin/pinchzoom IN
    gesture pinch out 2 ~/.local/bin/pinchzoom OUT

## power.sh
Useful options to lock, poweroff etc

.config/sway/config

    bindsym $mod+Escape exec "~/.local/bin/power.sh"

## tooltip-positioning.sh
Tooltip positions for waybar appindicators don't work.  This script moves the
tooltip window to the mouse pointer location.

.config/sway/config
      
    for_window [app_id="waybar" floating] move position 5000 5000
    exec --no-startup-id ~/.local/bin/tooltip-positioning.sh

## volchange
Make volume changes to pulseaudio, notify user what it's done.
Mako snippet to group notifications and timeout quickly.

.config/sway/config

    bindsym XF86AudioRaiseVolume exec --no-startup-id ~/.local/bin/volchange volup
    bindsym XF86AudioLowerVolume exec --no-startup-id ~/.local/bin/volchange voldown
    bindsym XF86AudioMute exec        --no-startup-id ~/.local/bin/volchange volmute

.config/mako/config

    sort=-time
    [app-name=volchange]
    group-by=app-name
    default-timeout=500

