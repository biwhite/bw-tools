#!/bin/bash

handle() {
  local event=$(swaymsg -t SUBSCRIBE "['workspace']");
#  echo $event | jq
  if [[ ( $(jq .change <<< $event) == '"focus"' ) || \
	( $(jq .change <<< $event) == '"init"'  ) ]]; then
#     echo "Focus Change, killing rofi if exists"
     killall rofi || true
  fi
}

while handle; do
  sleep 0.2
done
