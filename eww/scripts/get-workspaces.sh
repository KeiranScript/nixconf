#!/bin/bash
hyprctl workspaces -j | jq -c 'map(.id) | sort'
