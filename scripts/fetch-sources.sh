#!/usr/bin/env bash
# Download the source essays these skills are built on into sources/ (gitignored).
# The repo does not host the essays; their authors do. Run once after cloning.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p sources

fetch() {
  local url="$1" out="sources/$2"
  echo "-> $2"
  curl -fsSL "$url" \
    | sed -e 's/<script[^<]*<\/script>//g' -e 's/<style[^<]*<\/style>//g' -e 's/<br[^>]*>/\n/g' -e 's/<\/p>/\n\n/g' -e 's/<[^>]*>//g' \
    | sed -e 's/&nbsp;/ /g' -e "s/&#39;/'/g" -e 's/&quot;/"/g' -e 's/&amp;/\&/g' -e 's/&lt;/</g' -e 's/&gt;/>/g' \
    | sed -e 's/[[:space:]]\+$//' \
    | cat -s > "$out"
}

fetch https://www.paulgraham.com/goodwriting.html pg-good-writing.txt
fetch https://paulgraham.com/talk.html            pg-write-like-you-talk.txt
fetch https://paulgraham.com/useful.html          pg-how-to-write-usefully.txt
fetch https://www.paulgraham.com/writes.html      pg-writes-and-write-nots.txt
fetch "https://www.orwellfoundation.com/the-orwell-foundation/orwell/essays-and-other-works/politics-and-the-english-language/" orwell-politics-and-the-english-language.txt

echo "done: $(ls sources | wc -l) files in sources/"
