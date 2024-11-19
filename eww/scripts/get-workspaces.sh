#!/bin/sh
hyprctl workspaces -j | jq '[.[].name]'
