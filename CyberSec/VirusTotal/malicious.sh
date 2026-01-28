#!/bin/bash
# vt-malicious.sh
# Scan dengan vt-cli dan simpan hasil ke file harian
# Menuliskan "Clean" kalau target tidak mengandung malicious

OUTFILE="VirusTotal-$(date +%d-%m-%Y).txt"

check_target() {
  local target="$1"
  echo "=== Scan: $target ==="

  local results
  results=$(vt url "$target" --format json 2>/dev/null \
    | jq -r '.[0].last_analysis_results
    | to_entries[]
    | select(.value.category=="malicious")
    | "\(.key): \(.value.result)"')

  if [[ -n "$results" ]]; then
    echo "$results"
    {
      echo "=== Scan: $target ==="
      echo "$results"
      echo ""
    } >> "$OUTFILE"
  else
    echo "Clean"
    {
      echo "=== Scan: $target ==="
      echo "Clean"
      echo ""
    } >> "$OUTFILE"
  fi

  echo "" # newline
}

if [ -z "$1" ]; then
  echo "Usage:"
  echo "  $0 <ip|url|hash>"
  echo "  $0 <file.txt>   (isi file: list ip/url satu per baris)"
  exit 1
fi

if [ -f "$1" ]; then
  # input berupa file
  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    check_target "$line"
  done < "$1"
else
  # input berupa single target
  check_target "$1"
fi

echo "📂 Semua hasil disimpan di: $OUTFILE"
