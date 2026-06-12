#!/usr/bin/bash

set -euo pipefail

tmp=$(mktemp)
mv $tmp $tmp.png
tmp="$tmp.png"
grim -g "$(slurp)" - > "$tmp"
wl-copy "$tmp"
