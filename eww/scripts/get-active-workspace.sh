#!/bin/sh
hyprctl activeworkspace -j | jq -r '"\(.name)"'
