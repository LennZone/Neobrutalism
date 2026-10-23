#!/bin/sh
# Shrink the original fonts in fonts/source/ to what the theme uses and
# write the results to fonts/. Run scripts/embed-fonts.py afterwards.
#
# What it does per font:
#   - limits the weight axis to the weights the theme uses
#   - keeps only Latin characters (incl. German umlauts and common punctuation)
#   - drops hinting (instructions for low-resolution screens, not needed in
#     Obsidian) and outputs woff2
#
# Needs fontTools with brotli, for example in a virtual environment:
#   python3 -m venv .venv && .venv/bin/pip install fonttools brotli
#   PYTHON=.venv/bin/python scripts/subset-fonts.sh

set -e
cd "$(dirname "$0")/.."
PYTHON="${PYTHON:-python3}"
TMP="$(mktemp -d)"
UNICODES="U+0020-007E,U+00A0-00FF,U+0131,U+0152-0153,U+02C6,U+02DA,U+02DC,U+2013-2014,U+2018-201A,U+201C-201E,U+2022,U+2026,U+2039-203A,U+20AC,U+2122,U+2212"
FEATURES="kern,liga,calt,ccmp,locl,mark,mkmk"

# subset <source file> <output file> <weight range>
subset() {
    "$PYTHON" -m fontTools.varLib.instancer -q "fonts/source/$1" "wght=$3" -o "$TMP/font.ttf"
    "$PYTHON" -m fontTools.subset "$TMP/font.ttf" \
        --unicodes="$UNICODES" \
        --layout-features="$FEATURES" \
        --no-hinting --desubroutinize \
        --flavor=woff2 \
        --output-file="fonts/$2"
    echo "fonts/$2: $(wc -c < "fonts/$2" | tr -d ' ') bytes"
}

subset Unbounded-Variable.woff2 Unbounded.woff2 700:800
subset Outfit-Variable.woff2 Outfit.woff2 400:700
subset JetBrainsMono-Variable.woff2 JetBrainsMono.woff2 400:700

rm -rf "$TMP"
