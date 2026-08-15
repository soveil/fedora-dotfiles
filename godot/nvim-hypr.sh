#!/usr/bin/env bash
set -euo pipefail

# godot exec flags:
# --server /tmp/godot.pipe --remote-send "<C-\><C-N>:e {file}<CR>:call cursor({line},{col})<CR>"

ADDR_FILE="${TMPDIR:-/tmp}/nvim-hypr.window.addr"

die() {
  echo "nvim-hypr: $*" >&2
  exit 1
}

require_hyprland() {
  command -v hyprctl >/dev/null 2>&1 || die "hyprctl not found"
  [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]] || die "not running under Hyprland"
}

require_jq() {
  command -v jq >/dev/null 2>&1 || die "jq not found"
}

window_exists() {
  local addr="$1"
  hyprctl clients -j | jq -e --arg addr "$addr" '.[] | select(.address == $addr)' >/dev/null
}

_LUA_CONFIG=""

is_lua_config() {
  if [[ -z "$_LUA_CONFIG" ]]; then
    if hyprctl eval "return 'ok'" 2>/dev/null | grep -qx 'ok'; then
      _LUA_CONFIG=1
    else
      _LUA_CONFIG=0
    fi
  fi
  [[ "$_LUA_CONFIG" == "1" ]]
}

focus_window_by_address() {
  local addr="$1"
  local selector="address:${addr}"

  if is_lua_config; then
    hyprctl eval "hl.dispatch(hl.dsp.focus({window='${selector}'}))"
  else
    hyprctl dispatch focuswindow "${selector}"
  fi
}

focus_window() {
  local addr
  addr="$(<"$ADDR_FILE")"
  [[ -n "$addr" && "$addr" != "null" ]] || return 1
  window_exists "$addr" || return 1
  focus_window_by_address "$addr"
}

open_nvim() {
  local addr
  addr="$(hyprctl activewindow -j | jq -r '.address')"
  [[ -n "$addr" && "$addr" != "null" ]] || die "could not determine active window address"

  printf '%s' "$addr" >"$ADDR_FILE"
  nvim "$@"
  rm -f "$ADDR_FILE"
}

main() {
  require_hyprland
  require_jq

  if [[ -f "$ADDR_FILE" ]] && focus_window; then
    exit 0
  fi

  rm -f "$ADDR_FILE"
  open_nvim "$@"
}

main "$@"
