#!/bin/bash

handle() {
#  echo "Subscribing"
  local event=$(swaymsg -t SUBSCRIBE "['window']");
#  echo Event $event
  if [[ ( $(jq .container.app_id <<< $event) == '"waybar"' || \
	  $(jq .container.app_id <<< $event) == '"volctl.py"' || \
	  $(jq .container.app_id <<< $event) == '"teams"' ) && \
	    $(jq .change <<< $event) == '"new"' ]]; then
#    echo "Found window to shift"
    local vert=$(( $(jq .container.geometry.height <<< $event) / 2 + BAR_HEIGHT))
    local horz=$(( $(jq .container.geometry.width <<< $event) / 2))
    local vertplus=$(expr $vert + 15)
    swaymsg move position cursor
    swaymsg move up $vertplus px
    swaymsg move left $horz px
  fi
}

while handle; do
  sleep 0.2
done
