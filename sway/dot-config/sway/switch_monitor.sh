#!/usr/bin/env bash
# move-workspace-to-other-monitor.sh
#
# Moves the currently focused workspace to the other monitor.
# Works with any number of outputs — cycles to the next one (wraps around).

set -euo pipefail

# Require swaymsg
if ! command -v swaymsg &>/dev/null; then
    echo "Error: swaymsg not found. Is Sway running?" >&2
    exit 1
fi

# Require jq
if ! command -v jq &>/dev/null; then
    echo "Error: jq is required but not installed." >&2
    exit 1
fi

# Get all active outputs sorted by position into a bash array
mapfile -t output_list < <(swaymsg -t get_outputs \
    | jq -r '[.[] | select(.active == true)] | sort_by(.rect.x, .rect.y) | .[].name')

if [[ "${#output_list[@]}" -lt 2 ]]; then
    echo "Only one monitor detected — nothing to move to." >&2
    exit 1
fi

# Find the currently focused output
focused_output=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused == true) | .name')

if [[ -z "$focused_output" ]]; then
    echo "Error: Could not determine the focused output." >&2
    exit 1
fi

# Find the next output in the list (wraps around)
target_output=""
for i in "${!output_list[@]}"; do
    if [[ "${output_list[$i]}" == "$focused_output" ]]; then
        next_index=$(( (i + 1) % ${#output_list[@]} ))
        target_output="${output_list[$next_index]}"
        break
    fi
done

if [[ -z "$target_output" ]]; then
    echo "Error: Could not find \"$focused_output\" in the output list." >&2
    exit 1
fi

# Get the currently focused workspace name
focused_workspace=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused == true) | .name')

if [[ -z "$focused_workspace" ]]; then
    echo "Error: Could not determine the focused workspace." >&2
    exit 1
fi

echo "Moving workspace \"$focused_workspace\" from \"$focused_output\" → \"$target_output\""

# Move the workspace to the target output, then follow focus
swaymsg "workspace \"$focused_workspace\"; move workspace to output \"$target_output\""
swaymsg "focus output \"$target_output\""
