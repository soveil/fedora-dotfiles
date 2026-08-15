#!/usr/bin/env bash
#
# godot-focus.sh
#
# Meant to be used as Godot's External Editor
# (Editor Settings > Text Editor > External), working alongside godot.lua
# (https://simondalvai.org/blog/godot-neovim/).
#
# If Neovim is already running for the project (server.pipe exists), jumps
# to the given file/line/col in it and focuses its Kitty window in Hyprland.
# If not, launches a new Kitty window running Neovim in the project,
# opened directly at that file/line.
#
# Godot Editor Settings:
#   Use External Editor: on
#   Exec Path:            /path/to/godot-focus.sh
#   Exec Flags:            {project} {file} {line} {col}
#
# Can also be run manually / from a Hyprland keybind with just a path
# (a project dir, or any file/dir inside it) to focus-only, no jump:
#   godot-focus.sh [path]
#
# Dependencies: nvim, kitty, ps, jq, hyprctl

set -euo pipefail

# ---- figure out which mode we're in --------------------------------------

if [ "$#" -ge 4 ]; then
    # called from Godot: {project} {file} {line} {col}
    project_arg="$1"
    file_arg="$2"
    line_arg="$3"
    col_arg="$4"
else
    # manual / keybind use: just a path, no jump requested
    project_arg="${1:-$(pwd)}"
    file_arg=""
    line_arg=""
    col_arg=""
fi

# resolve to an existing directory to search from
if [ -f "$project_arg" ]; then
    search_start="$(dirname "$project_arg")"
else
    search_start="$project_arg"
fi
search_start="$(cd "$search_start" && pwd)"

# walk upward looking for project.godot (mirrors the search in godot.lua)
find_project_dir() {
    local dir="$1"
    for _ in 1 2 3; do
        if [ -f "$dir/project.godot" ]; then
            echo "$dir"
            return 0
        fi
        dir="$(dirname "$dir")"
    done
    return 1
}

project_dir="$(find_project_dir "$search_start")" || {
    echo "godot-focus: no project.godot found near '$search_start'" >&2
    exit 1
}

pipe="$project_dir/server.pipe"

# ---- helpers: find the kitty window owning a given nvim pid, and focus it -

find_kitty_pid() {
    local pid="$1"
    for _ in $(seq 1 20); do
        if [ -z "$pid" ] || [ "$pid" = "0" ]; then
            return 1
        fi
        local comm
        comm="$(ps -o comm= -p "$pid" 2>/dev/null || true)"
        if [ "$comm" = "kitty" ]; then
            echo "$pid"
            return 0
        fi
        pid="$(ps -o ppid= -p "$pid" 2>/dev/null | tr -d ' ')"
    done
    return 1
}

focus_kitty_for_pid() {
    local nvim_pid="$1"
    local kitty_pid
    kitty_pid="$(find_kitty_pid "$nvim_pid")" || {
        echo "godot-focus: couldn't find a kitty ancestor for nvim pid $nvim_pid" >&2
        return 1
    }

    local address
    address="$(hyprctl clients -j | jq -r --arg pid "$kitty_pid" \
        '.[] | select(.pid == ($pid | tonumber)) | .address' | head -n1)"

    if [ -z "$address" ]; then
        echo "godot-focus: no Hyprland window found for kitty pid $kitty_pid" >&2
        return 1
    fi

    hyprctl dispatch focuswindow "address:$address"
}

# ---- case 1: nvim server already running for this project -----------------

nvim_pid=""
if [ -S "$pipe" ]; then
    nvim_pid="$(nvim --server "$pipe" --remote-expr 'getpid()' 2>/dev/null || true)"
fi

if [ -n "$nvim_pid" ]; then
    if [ -n "$file_arg" ]; then
        # escape spaces so ":e" treats the path as one argument
        file_escaped="${file_arg// /\\ }"
        nvim --server "$pipe" --remote-send \
            "<C-\><C-N>:e ${file_escaped}<CR>:call cursor(${line_arg}+1,${col_arg})<CR>"
    fi
    focus_kitty_for_pid "$nvim_pid"
    exit 0
fi

# ---- case 2: nothing running yet, start Neovim in a new Kitty window ------
# godot.lua will detect project.godot in $project_dir and start server.pipe
# itself once Neovim launches, so we just need to open the right file.

if [ -n "$file_arg" ]; then
    kitty --directory "$project_dir" nvim \
        "+call cursor(${line_arg}+1,${col_arg})" -- "$file_arg" \
        >/dev/null 2>&1 &
else
    kitty --directory "$project_dir" nvim >/dev/null 2>&1 &
fi
disown
