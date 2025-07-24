#!/usr/bin/env bash
#
# compress_pdf.sh  —  Lossy/Lossless PDF compressor for macOS
#
# Usage:
#   chmod +x compress_pdf.sh
#   ./compress_pdf.sh input.pdf [quality] [output.pdf]
#
# Arguments:
#   input.pdf      Path to the source PDF
#   quality        (optional) screen | ebook | printer | prepress | default
#                  Defaults to “ebook”, a good balance of clarity & size
#   output.pdf     (optional) Custom name for the compressed file
#
# Example:
#   ./compress_pdf.sh Plans.pdf screen Plans_small.pdf
#
################################################################################

set -euo pipefail

# ---- 1. Parse arguments ------------------------------------------------------
if [[ $# -lt 1 ]]; then
  echo "compress_pdf.sh: supply at least one PDF file" >&2
  exit 1
fi

SRC="$1"
QUALITY="${2:-ebook}"                     # reasonable default
OUT="${3:-$(basename "${SRC%.*}")_min.pdf}"

# ---- 2. Verify Ghostscript is available --------------------------------------
if ! command -v gs >/dev/null 2>&1; then
  echo "Ghostscript not found. Install with:  brew install ghostscript" >&2
  exit 2
fi

# ---- 3. Compress -------------------------------------------------------------
echo "Compressing '${SRC}' → '${OUT}' (quality=${QUALITY}) ..."
gs \
  -sDEVICE=pdfwrite \
  -dCompatibilityLevel=1.4 \
  -dPDFSETTINGS=/${QUALITY} \
  -dNOPAUSE -dQUIET -dBATCH \
  -sOutputFile="${OUT}" "${SRC}"

echo "Done. Original size: $(du -h "$SRC" | cut -f1)  →  New size: $(du -h "$OUT" | cut -f1)"
