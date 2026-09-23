#!/usr/bin/env bash
# Create an Apple Notes note from Markdown, using the "Markdown Note" shortcut.
# Notes renders the Markdown itself, so headings and lists get real Notes styles.
# Usage: markdown-note.sh <file.md>   or   ... | markdown-note.sh
# The input file must live under $HOME: Shortcuts cannot read /var/folders temp files.
set -euo pipefail
dir="$HOME/Library/Caches/markdown-note"
mkdir -p "$dir"
input="$dir/input.json"
python3 -c 'import json,sys; json.dump({"markdown": sys.stdin.read()}, open(sys.argv[1], "w"))' "$input" < "${1:-/dev/stdin}"
shortcuts run "Markdown Note" --input-path "$input" 2>/dev/null
rm -f "$input"
