#!/bin/bash
# rbl.sh
# Cek single IP / list IP dari file ke RBL (pakai list eksternal)

TARGET=$1
DATE=$(date +"%d-%m-%Y")
OUTPUT_FILE="rbl-check-${DATE}.txt"
RBL_FILE="rbl-list.txt"

if [[ -z "$TARGET" ]]; then
  echo "Usage: $0 <IP|file.txt>"
  exit 1
fi

if [[ ! -f "$RBL_FILE" ]]; then
  echo "File $RBL_FILE tidak ditemukan!"
  exit 1
fi

# Load daftar RBL
mapfile -t RBL_LIST < "$RBL_FILE"

check_ip() {
  local IP=$1
  local REVERSED_IP=$(echo $IP | awk -F. '{print $4"."$3"."$2"."$1}')
  local STATUS="Clean"

  echo -e "\nChecking $IP..." | tee -a "$OUTPUT_FILE"

  for RBL in "${RBL_LIST[@]}"; do
    RESULT=$(dig +short "${REVERSED_IP}.${RBL}" A @1.1.1.1)
    if [[ -n "$RESULT" ]]; then
      echo "[LISTED] $IP blacklisted on $RBL ($RESULT)" | tee -a "$OUTPUT_FILE"
      STATUS="Blacklisted"
    else
      echo "[CLEAN]  $IP not listed on $RBL" >> "$OUTPUT_FILE"
    fi
  done

  echo "Summary for $IP: $STATUS" | tee -a "$OUTPUT_FILE"
  echo "-------------------------------------" >> "$OUTPUT_FILE"
}

if [[ -f "$TARGET" ]]; then
  while read -r IP; do
    [[ -z "$IP" ]] && continue
    check_ip "$IP"
  done < "$TARGET"
else
  check_ip "$TARGET"
fi

echo -e "\nSelesai! Hasil tersimpan di $OUTPUT_FILE"
