#!/usr/bin/env bash
set -euo pipefail

REPO="ryanoasis/nerd-fonts"
FONT="JetBrainsMono"
DEST="$HOME/.local/share/fonts/${FONT}NerdFont"

mkdir -p "$DEST"
cd "$DEST"

echo "Fetching latest release info..."

URL=$(curl -s "https://api.github.com/repos/${REPO}/releases" \
  | jq -r '.[0].assets[]
      | select(.name == "'"${FONT}"'.tar.xz")
      | .browser_download_url')

if [[ -z "$URL" ]]; then
  echo "JetBrainsMono.tar.xz not found in latest release"
  exit 1
fi

echo "Downloading $URL"
curl -LO "$URL"

tar xvf "${FONT}.tar.xz"
pwd
ls -la
rm ${DEST}/JetBrainsMonoNerdFontMono*
rm ${DEST}/JetBrainsMonoNerdFontPropo*
rm ${DEST}/JetBrainsMonoNLNerdFont*
rm ${FONT}.tar.xz

fc-cache -fv

echo "JetBrainsMono Nerd Font installed."
