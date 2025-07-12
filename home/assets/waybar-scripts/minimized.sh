#!/bin/bash

# Script to check for minimized windows in Hyprland special workspace
# Returns JSON for waybar custom module

# Get windows in the special:minimized workspace
minimized_windows=$(hyprctl clients -j | jq -r '.[] | select(.workspace.name == "special:minimized") | .title')

# Count minimized windows
count=$(echo "$minimized_windows" | grep -c . 2>/dev/null || echo "0")

# If no minimized windows, return empty state
if [ "$count" -eq 0 ]; then
    echo '{"text": "", "tooltip": "No minimized windows", "class": "empty"}'
else
    # Create tooltip with window titles
    tooltip="Minimized windows ($count):\n"
    while IFS= read -r window; do
        if [ -n "$window" ]; then
            tooltip+="• $window\n"
        fi
    done <<< "$minimized_windows"
    
    # Remove trailing newline
    tooltip=$(echo -e "$tooltip" | sed 's/\\n$//')
    
    # Return JSON with count and tooltip
    echo "{\"text\": \"  $count\", \"tooltip\": \"$tooltip\", \"class\": \"minimized\"}"
fi
