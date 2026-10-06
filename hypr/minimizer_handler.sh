#!/usr/bin/env bash 

# Usage: ./special-workspace-monitor.sh <workspace-name>
SPWS="$1"
if [[ -z "$SPWS" ]]; then
    echo "Usage: $0 special:spotify"
    exit 1
fi

LAST_WS=""

while true; do
    # Get the currently active workspace by checking which workspace has the focused window
    CUR_WS=$(hyprctl -j clients \
        | jq -r '.[] | select(.focused==true) | .workspaceName')

    # If we couldn't detect a focused window, skip this iteration
    if [[ -z "$CUR_WS" ]]; then
        sleep 0.2
        continue
    fi

    # Compare with last workspace
    if [[ "$CUR_WS" != "$LAST_WS" ]]; then
        # If we moved away from the special workspace, hide it
        if [[ "$LAST_WS" == "$SPWS" ]]; then
            hyprctl dispatch togglespecialworkspace "$SPWS"
        fi
        LAST_WS="$CUR_WS"
    fi

    sleep 0.2
done

