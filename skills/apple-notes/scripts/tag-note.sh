#!/usr/bin/env bash
# Add a tag to an Apple Notes note by name, using the "Tag Note" shortcut.
# Usage: tag-note.sh "<note name>" "<tag without #>"
# The input file must live under $HOME: Shortcuts cannot read /var/folders temp files.
set -euo pipefail
dir="$HOME/Library/Caches/tag-note"
mkdir -p "$dir"
input="$dir/input.json"
python3 -c 'import json,sys; json.dump({"note": sys.argv[2], "tag": sys.argv[3]}, open(sys.argv[1], "w"))' "$input" "$1" "$2"
shortcuts run "Tag Note" --input-path "$input" 2>/dev/null
rm -f "$input"
