#!/usr/bin/bash

set -euo pipefail

tmp=$(mktemp)
mv $tmp $tmp.png
tmp="$tmp.png"
grim - > "$tmp"
wl-copy "$tmp"
