#!/bin/bash
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 grep '^workspace>>' | while read -r line; do
  hyprctl workspaces -j | jq -c 'map(select(.windows > 0) | .id)'
done
